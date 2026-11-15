#!/usr/bin/env python3
"""Randomly compile Suno lyrics/style prompts from selected corpus hoppers."""
from __future__ import annotations
import argparse, csv, hashlib, json, random, re, sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterator

TEXT_EXTENSIONS={".txt",".md",".markdown",".csv",".tsv",".json",".jsonl",".yaml",".yml",".toml",".ini",".cfg",".xml",".html",".htm",".rst",".log"}
SKIP_NAMES={".ds_store","thumbs.db","desktop.ini"}
MAX_FILE_BYTES=25*1024*1024
DEFAULT_EXCLUDES={"Writing_Voice"}
STYLE_BIAS={"genre_hopper":.84,"structure_hopper":.84,"prompt_hopper":.34,"prompt_examples_hopper":.38,"lyrics_hopper":.12,"writing_voice":.16,"others_writing":.18,"grab_bag":.35,"product_hopper":.28,"community_hopper":.42,"research_hopper":.5,"source_hopper":.5,"audio_case_hopper":.55,"sample_hopper":.58,"sonic_pi":.65,"tooling_hopper":.55}

@dataclass(frozen=True)
class Fragment:
    text:str
    hopper:str
    source:str

def clean_fragment(value:str)->str:
    value=value.replace("\r\n","\n").replace("\r","\n")
    return re.sub(r"[ \t]+\n","\n",value).strip()

def json_strings(value:object)->Iterator[str]:
    if isinstance(value,str): yield value
    elif isinstance(value,list):
        for item in value: yield from json_strings(item)
    elif isinstance(value,dict):
        for item in value.values(): yield from json_strings(item)

def split_text(text:str,suffix:str)->list[str]:
    text=text.replace("\r\n","\n").replace("\r","\n")
    if suffix==".json":
        try: parsed=json.loads(text)
        except (json.JSONDecodeError,RecursionError): pass
        else:
            out=[]
            for item in json_strings(parsed): out.extend(split_text(item,".txt"))
            return out
    if suffix in {".csv",".tsv"}:
        try:
            rows=csv.reader(text.splitlines(),delimiter="\t" if suffix==".tsv" else ",")
            return [p for row in rows if (p:=" | ".join(c.strip() for c in row if c.strip()))]
        except csv.Error: pass
    pieces=[]
    for block in re.split(r"\n\s*\n+",text):
        block=clean_fragment(block)
        if not block: continue
        if len(block)<=2400: pieces.append(block); continue
        current=""
        for line in (clean_fragment(x) for x in block.split("\n")):
            if not line: continue
            if len(line)>2400:
                if current: pieces.append(current); current=""
                pieces.extend(line[i:i+1800] for i in range(0,len(line),1800))
            elif current and len(current)+len(line)+1>1800:
                pieces.append(current); current=line
            else: current=f"{current}\n{line}" if current else line
        if current: pieces.append(current)
    return pieces

def parse_names(raw:str|None)->set[str]:
    return {x.strip() for x in raw.split(",") if x.strip()} if raw else set()

def load_hoppers(corpus:Path,includes:set[str]|None=None,excludes:set[str]|None=None)->dict[str,list[Fragment]]:
    if not corpus.is_dir(): raise SystemExit(f"Corpus directory not found: {corpus}")
    excluded={x.casefold() for x in (DEFAULT_EXCLUDES if excludes is None else excludes)}
    dirs=sorted(p for p in corpus.iterdir() if p.is_dir())
    if includes:
        wanted={x.casefold() for x in includes}
        dirs=[p for p in dirs if p.name.casefold() in wanted]
        missing=sorted(wanted-{p.name.casefold() for p in dirs})
        if missing: print("WARNING: requested hoppers not found: "+", ".join(missing),file=sys.stderr)
    dirs=[p for p in dirs if p.name.casefold() not in excluded]
    hoppers={}
    for d in dirs:
        found=[]
        for path in sorted(d.rglob("*")):
            if not path.is_file() or path.name.casefold() in SKIP_NAMES: continue
            if path.suffix.casefold() not in TEXT_EXTENSIONS:
                label=re.sub(r"[_-]+"," ",path.stem).strip()
                if label: found.append(Fragment(label,d.name,path.relative_to(corpus).as_posix()))
                continue
            try:
                if path.stat().st_size>MAX_FILE_BYTES:
                    print(f"SKIP oversized: {path}",file=sys.stderr); continue
                raw=path.read_text(encoding="utf-8-sig")
            except (OSError,UnicodeError) as exc:
                print(f"SKIP unreadable {path}: {exc}",file=sys.stderr); continue
            for piece in split_text(raw,path.suffix.casefold()):
                piece=clean_fragment(piece)
                if piece: found.append(Fragment(piece,d.name,path.relative_to(corpus).as_posix()))
        if found: hoppers[d.name]=found
    if not hoppers: raise SystemExit("No eligible text fragments found in selected hoppers.")
    return hoppers

def compile_both(hoppers,lyrics_chars,styles_chars,rng):
    pools={name:list(items) for name,items in hoppers.items()}
    for items in pools.values(): rng.shuffle(items)
    outputs={"lyrics":"","styles":""}; manifests={"lyrics":[],"styles":[]}
    limits={"lyrics":lyrics_chars,"styles":styles_chars}; seen=set()
    while any(len(outputs[k])<limits[k] for k in outputs):
        available=[name for name,items in pools.items() if items]
        if not available: break
        fragment=pools[rng.choice(available)].pop()
        digest=hashlib.sha256(fragment.text.encode()).hexdigest()
        if digest in seen: continue
        seen.add(digest)
        dest="styles" if rng.random()<STYLE_BIAS.get(fragment.hopper.casefold(),.5) else "lyrics"
        other="lyrics" if dest=="styles" else "styles"
        if len(outputs[dest])>=limits[dest]: dest=other
        if len(outputs[dest])>=limits[dest]: continue
        current=outputs[dest]; divider=".\n" if current else ""
        remaining=limits[dest]-len(current)-len(divider)
        if remaining<=0: continue
        used=fragment.text[:remaining].rstrip()
        if not used: continue
        outputs[dest]=current+divider+used
        manifests[dest].append({"hopper":fragment.hopper,"source":fragment.source,"characters_used":str(len(used)),"truncated":str(len(used)<len(fragment.text)).lower()})
    return outputs["lyrics"],manifests["lyrics"],outputs["styles"],manifests["styles"]

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--corpus",type=Path,default=Path("corpus"))
    ap.add_argument("--out",type=Path,default=Path("hopper_pulls"))
    ap.add_argument("--lyrics-chars",type=int,default=5000)
    ap.add_argument("--styles-chars",type=int,default=1000)
    ap.add_argument("--seed",type=int)
    ap.add_argument("--include-hoppers",help="Comma-separated allowlist of immediate corpus hopper directories")
    ap.add_argument("--exclude-hoppers",default=None,help="Comma-separated hopper names to exclude (Writing_Voice is excluded by default)")
    a=ap.parse_args()
    if a.lyrics_chars<1 or a.styles_chars<1: raise SystemExit("Character limits must be positive integers.")
    hoppers=load_hoppers(a.corpus,parse_names(a.include_hoppers) or None,parse_names(a.exclude_hoppers))
    lyrics,lm,styles,sm=compile_both(hoppers,a.lyrics_chars,a.styles_chars,random.Random(a.seed))
    a.out.mkdir(parents=True,exist_ok=True)
    (a.out/"lyrics_pull.txt").write_text(lyrics,encoding="utf-8")
    (a.out/"styles_pull.txt").write_text(styles,encoding="utf-8")
    manifest={"compiler":"random_hopper_compiler.py","seed":a.seed,"corpus":str(a.corpus),"included_hoppers":sorted(hoppers),"hopper_count":len(hoppers),"fragment_count":sum(map(len,hoppers.values())),"hoppers_loaded":{k:len(v) for k,v in sorted(hoppers.items())},"lyrics":{"target_characters":a.lyrics_chars,"actual_characters":len(lyrics),"pull_count":len(lm),"pulls":lm},"styles":{"target_characters":a.styles_chars,"actual_characters":len(styles),"pull_count":len(sm),"pulls":sm},"routing_note":"Hopper-specific probabilistic bias; any selected hopper may feed either field.","text_only_note":"Binary files are not embedded; filenames may be used as text fragments."}
    (a.out/"pull_manifest.json").write_text(json.dumps(manifest,ensure_ascii=False,indent=2),encoding="utf-8")
    print(f"Loaded {len(hoppers)} hoppers and {manifest['fragment_count']} fragments.")
    print(f"Lyrics: {len(lyrics)}/{a.lyrics_chars} characters from {len(lm)} pulls")
    print(f"Styles: {len(styles)}/{a.styles_chars} characters from {len(sm)} pulls")
    print(f"Outputs: {a.out.resolve()}")
    if len(lyrics)<a.lyrics_chars or len(styles)<a.styles_chars: print("WARNING: available material did not fill one or both targets.",file=sys.stderr)
if __name__=="__main__": main()
