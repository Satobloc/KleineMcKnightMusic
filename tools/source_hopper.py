#!/usr/bin/env python3
"""Conservative source hopper for public Suno research sources.

This first version deliberately ingests URL lists and RSS/Atom feeds only.
It does not scrape login-walled communities, automate account sessions,
download audio, bypass access controls, or republish full copyrighted posts.

Examples:
  python tools/source_hopper.py urls.txt --out corpus/Source_Hopper/intake
  python tools/source_hopper.py feed https://example.org/feed.xml --out corpus/Community_Hopper/intake

Each capture is stored as JSON with provenance, a short extracted description,
and a SHA-256 fingerprint. Review and classify before promotion.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import re
import sys
import time
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urlparse, urlunparse
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError
import xml.etree.ElementTree as ET

UA = "KleineMcKnightMusic-SourceHopper/0.1 (research; contact via repository)"

def canonicalize(url: str) -> str:
    p = urlparse(url.strip())
    if p.scheme not in ("http", "https") or not p.netloc:
        raise ValueError(f"Unsupported URL: {url}")
    host = p.netloc.lower()
    path = re.sub(r"/+$", "", p.path) or "/"
    # Drop common tracking parameters, retain meaningful query strings.
    return urlunparse((p.scheme.lower(), host, path, "", "", ""))

def fetch(url: str, timeout: int = 20) -> tuple[str, str]:
    req = Request(url, headers={"User-Agent": UA, "Accept": "text/html,application/atom+xml,application/rss+xml"})
    with urlopen(req, timeout=timeout) as response:
        final_url = response.geturl()
        ctype = response.headers.get("Content-Type", "")
        raw = response.read(2_000_000)
        charset = response.headers.get_content_charset() or "utf-8"
    if not any(x in ctype.lower() for x in ("text/", "xml", "json")):
        raise ValueError(f"Non-text response refused: {ctype}")
    return raw.decode(charset, errors="replace"), final_url

def strip_html(s: str) -> str:
    s = re.sub(r"(?is)<(script|style|noscript).*?>.*?</\1>", " ", s)
    s = re.sub(r"(?s)<[^>]+>", " ", s)
    s = re.sub(r"&nbsp;|&#160;", " ", s)
    s = re.sub(r"&amp;", "&", s)
    s = re.sub(r"&lt;", "<", s)
    s = re.sub(r"&gt;", ">", s)
    s = re.sub(r"&quot;", '"', s)
    s = re.sub(r"&#39;|&apos;", "'", s)
    return re.sub(r"\s+", " ", s).strip()

def fingerprint(url: str, text: str) -> str:
    return hashlib.sha256((url + "\n" + text).encode("utf-8")).hexdigest()

def capture_record(url: str, title: str, description: str, source_type: str, hopper: str, out: Path, *, author: str | None = None, published: str | None = None, source_id_hint: str | None = None) -> Path:
    canonical = canonicalize(url)
    fp = fingerprint(canonical, title + "\n" + description)
    record = {
        "source_id": (source_id_hint or ("SRC-" + fp[:12])).upper(),
        "canonical_url": canonical,
        "original_url": url,
        "title": title[:500] or None,
        "platform": urlparse(canonical).netloc,
        "author_or_creator": author,
        "published_at": published,
        "retrieved_at": datetime.now(timezone.utc).isoformat(),
        "source_type": source_type,
        "hopper": hopper,
        "evidence_class": "unknown",
        "model_version": None,
        "generation_settings": None,
        "input_field": None,
        "prompt_text": None,
        "prompt_excerpt": None,
        "audio_url": None,
        "audio_duration_seconds": None,
        "has_prompt_and_audio": False,
        "reported_observation": description[:1200] or None,
        "creator_interpretation": None,
        "our_hypothesis": None,
        "limitations": ["Automatically captured metadata is unverified.", "Review source terms and provenance before reuse."],
        "rights_and_terms": None,
        "access_notes": "Text-only metadata capture; no audio downloaded.",
        "content_fingerprint": fp,
        "related_source_ids": [],
        "tags": []
    }
    out.mkdir(parents=True, exist_ok=True)
    target = out / (record["source_id"] + ".json")
    if target.exists():
        return target
    target.write_text(json.dumps(record, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return target

def ingest_url(url: str, out: Path, hopper: str) -> Path:
    try:
        text, final_url = fetch(url)
        title_match = re.search(r"(?is)<title[^>]*>(.*?)</title>", text)
        desc_match = re.search(r'(?is)<meta[^>]+name=["\']description["\'][^>]+content=["\'](.*?)["\']', text)
        title = strip_html(title_match.group(1)) if title_match else url
        desc = strip_html(desc_match.group(1)) if desc_match else strip_html(text)[:1200]
        return capture_record(final_url, title, desc, "other", hopper, out)
    except (URLError, HTTPError, TimeoutError, ValueError) as e:
        raise RuntimeError(f"{url}: {e}") from e

def ingest_feed(url: str, out: Path, hopper: str, limit: int) -> list[Path]:
    xml, _ = fetch(url)
    root = ET.fromstring(xml)
    ns = {"atom": "http://www.w3.org/2005/Atom"}
    records = []
    entries = root.findall(".//item") or root.findall(".//atom:entry", ns)
    for item in entries[:limit]:
        title = (item.findtext("title") or item.findtext("atom:title", namespaces=ns) or "Untitled").strip()
        link = item.findtext("link")
        if not link:
            elem = item.find("atom:link", ns)
            link = elem.attrib.get("href") if elem is not None else None
        if not link:
            continue
        desc = item.findtext("description") or item.findtext("atom:summary", namespaces=ns) or ""
        author = item.findtext("author") or item.findtext("atom:author/atom:name", namespaces=ns)
        published = (item.findtext("pubDate") or item.findtext("atom:published", namespaces=ns)
                     or item.findtext("atom:updated", namespaces=ns))
        guid = item.findtext("guid") or item.findtext("atom:id", namespaces=ns) or link
        records.append(capture_record(link, strip_html(title), strip_html(desc), "community_post", hopper, out,
                                      author=strip_html(author) if author else None,
                                      published=published,
                                      source_id_hint="SRC-" + hashlib.sha256(str(guid).encode("utf-8")).hexdigest()[:12]))
        time.sleep(0.2)
    return records

def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    sub = p.add_subparsers(dest="cmd")
    u = sub.add_parser("urls")
    u.add_argument("file", type=Path)
    u.add_argument("--out", type=Path, default=Path("corpus/Source_Hopper/intake"))
    u.add_argument("--hopper", default="source")
    f = sub.add_parser("feed")
    f.add_argument("url")
    f.add_argument("--out", type=Path, default=Path("corpus/Community_Hopper/intake"))
    f.add_argument("--limit", type=int, default=50)
    f.add_argument("--hopper", default="community")
    args = p.parse_args()
    if args.cmd == "urls":
        if not args.file.is_file():
            p.error(f"URL list not found: {args.file}")
        successes, failures = [], []
        for line in args.file.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            try:
                successes.append(str(ingest_url(line, args.out, args.hopper)))
                time.sleep(0.5)
            except Exception as e:
                failures.append(str(e))
        print(json.dumps({"captured": successes, "errors": failures}, indent=2))
    elif args.cmd == "feed":
        try:
            result = ingest_feed(args.url, args.out, args.hopper, max(1, min(args.limit, 100)))
            print(json.dumps({"captured": [str(x) for x in result]}, indent=2))
        except Exception as e:
            print(str(e), file=sys.stderr)
            return 1
    else:
        p.print_help()
        return 2
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
