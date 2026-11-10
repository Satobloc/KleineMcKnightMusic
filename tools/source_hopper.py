#!/usr/bin/env python3
"""Conservative source hopper for public Suno research sources.

Ingests manually curated URL lists and public RSS/Atom feeds. It records
provenance and short metadata summaries; it does not download audio, sign in,
bypass access controls, or crawl private communities.

Examples:
  python tools/source_hopper.py urls urls.txt --out corpus/Source_Hopper/intake
  python tools/source_hopper.py feed https://www.reddit.com/r/SunoAI/.rss --out corpus/Community_Hopper/intake
  python tools/source_hopper.py feed https://example.org/feed.xml --limit 30

A captured record is unverified until reviewed. Respect terms, robots.txt,
rate limits, privacy, attribution and redistribution rights.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import re
import sys
import time
from datetime import datetime, timezone
from email.utils import parsedate_to_datetime
from pathlib import Path
from urllib.parse import urlparse, urlunparse
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError
import xml.etree.ElementTree as ET

UA = "KleineMcKnightMusic-SourceHopper/0.2 (+public research; contact via repository)"

def canonicalize(url: str) -> str:
    p = urlparse(url.strip())
    if p.scheme not in ("http", "https") or not p.netloc:
        raise ValueError(f"Unsupported URL: {url}")
    path = re.sub(r"/+$", "", p.path) or "/"
    return urlunparse((p.scheme.lower(), p.netloc.lower(), path, "", "", ""))

def fetch(url: str, timeout: int = 20) -> tuple[str, str, str]:
    req = Request(url, headers={"User-Agent": UA, "Accept": "text/html,application/atom+xml,application/rss+xml,application/xml"})
    with urlopen(req, timeout=timeout) as response:
        final_url = response.geturl()
        ctype = response.headers.get("Content-Type", "")
        raw = response.read(2_000_000)
        charset = response.headers.get_content_charset() or "utf-8"
    if not any(x in ctype.lower() for x in ("text/", "xml", "json")):
        raise ValueError(f"Non-text response refused: {ctype}")
    return raw.decode(charset, errors="replace"), final_url, ctype

def strip_html(value: str) -> str:
    value = re.sub(r"(?is)<(script|style|noscript).*?>.*?</\\1>", " ", value)
    value = re.sub(r"(?s)<[^>]+>", " ", value)
    value = re.sub(r"&nbsp;|&#160;", " ", value)
    value = re.sub(r"&amp;", "&", value)
    value = re.sub(r"&lt;", "<", value)
    value = re.sub(r"&gt;", ">", value)
    value = re.sub(r"&quot;", '"', value)
    value = re.sub(r"&#39;|&apos;", "'", value)
    return re.sub(r"\\s+", " ", value).strip()

def iso_date(value: str | None) -> str | None:
    if not value:
        return None
    try:
        dt = parsedate_to_datetime(value)
        if dt.tzinfo is None:
            dt = dt.replace(tzinfo=timezone.utc)
        return dt.astimezone(timezone.utc).isoformat()
    except Exception:
        try:
            dt = datetime.fromisoformat(value.replace("Z", "+00:00"))
            if dt.tzinfo is None:
                dt = dt.replace(tzinfo=timezone.utc)
            return dt.astimezone(timezone.utc).isoformat()
        except Exception:
            return value

def fingerprint(url: str, text: str) -> str:
    return hashlib.sha256((url + "\\n" + text).encode("utf-8")).hexdigest()

def capture_record(url: str, title: str, description: str, source_type: str, hopper: str,
                   out: Path, *, author: str | None = None,
                   published: str | None = None, source_id_hint: str | None = None) -> Path:
    canonical = canonicalize(url)
    fp = fingerprint(canonical, title + "\\n" + description)
    record = {
        "source_id": (source_id_hint or ("SRC-" + fp[:12])).upper(),
        "canonical_url": canonical,
        "original_url": url,
        "title": title[:500] or None,
        "platform": urlparse(canonical).netloc,
        "author_or_creator": author,
        "published_at": iso_date(published),
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
    target.write_text(json.dumps(record, ensure_ascii=False, indent=2) + "\\n", encoding="utf-8")
    return target

def infer_source_type(url: str) -> str:
    host = urlparse(url).netloc.lower()
    if "help.suno.com" in host or ("suno.com" in host and "release-notes" in url):
        return "official_documentation"
    if "reddit.com" in host:
        return "community_post"
    if "github.com" in host:
        return "software_repository"
    return "other"

def ingest_url(url: str, out: Path, hopper: str) -> Path:
    try:
        body, final_url, _ = fetch(url)
        title_match = re.search(r"(?is)<title[^>]*>(.*?)</title>", body)
        desc_match = re.search(r'(?is)<meta[^>]+name=["\\']description["\\'][^>]+content=["\\'](.*?)["\\']', body)
        author_match = re.search(r'(?is)<meta[^>]+name=["\\']author["\\'][^>]+content=["\\'](.*?)["\\']', body)
        date_match = re.search(r'(?is)<meta[^>]+(?:property|name)=["\\'](?:article:published_time|datePublished|pubdate)["\\'][^>]+content=["\\'](.*?)["\\']', body)
        title = strip_html(title_match.group(1)) if title_match else final_url
        desc = strip_html(desc_match.group(1)) if desc_match else strip_html(body)[:1200]
        author = strip_html(author_match.group(1)) if author_match else None
        published = date_match.group(1).strip() if date_match else None
        return capture_record(final_url, title, desc, infer_source_type(final_url), hopper, out,
                              author=author, published=published)
    except (URLError, HTTPError, TimeoutError, ValueError) as exc:
        raise RuntimeError(f"{url}: {exc}") from exc

def ingest_feed(url: str, out: Path, hopper: str, limit: int) -> list[Path]:
    body, _, _ = fetch(url)
    root = ET.fromstring(body)
    ns = {"atom": "http://www.w3.org/2005/Atom"}
    records: list[Path] = []
    entries = root.findall(".//item") or root.findall(".//atom:entry", ns)
    for item in entries[:max(1, min(limit, 100))]:
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
        hint = "SRC-" + hashlib.sha256(str(guid).encode("utf-8")).hexdigest()[:12]
        records.append(capture_record(link, strip_html(title), strip_html(desc),
                                      "community_post", hopper, out,
                                      author=strip_html(author) if author else None,
                                      published=published, source_id_hint=hint))
        time.sleep(0.25)
    return records

def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="cmd", required=True)
    urls = sub.add_parser("urls", help="ingest a newline-delimited URL file")
    urls.add_argument("file", type=Path)
    urls.add_argument("--out", type=Path, default=Path("corpus/Source_Hopper/intake"))
    urls.add_argument("--hopper", default="source")
    feed = sub.add_parser("feed", help="ingest a public RSS or Atom feed")
    feed.add_argument("url")
    feed.add_argument("--out", type=Path, default=Path("corpus/Community_Hopper/intake"))
    feed.add_argument("--limit", type=int, default=50)
    feed.add_argument("--hopper", default="community")
    args = parser.parse_args()
    if args.cmd == "urls":
        if not args.file.is_file():
            parser.error(f"URL list not found: {args.file}")
        successes, errors = [], []
        for line in args.file.read_text(encoding="utf-8").splitlines():
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            try:
                successes.append(str(ingest_url(line, args.out, args.hopper)))
                time.sleep(0.5)
            except Exception as exc:
                errors.append(str(exc))
        print(json.dumps({"captured": successes, "errors": errors}, indent=2))
    else:
        try:
            paths = ingest_feed(args.url, args.out, args.hopper, args.limit)
            print(json.dumps({"captured": [str(path) for path in paths]}, indent=2))
        except Exception as exc:
            print(str(exc), file=sys.stderr)
            return 1
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
