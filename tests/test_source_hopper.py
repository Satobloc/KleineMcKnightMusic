from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
import source_hopper as hopper


class SourceHopperTests(unittest.TestCase):
    def test_canonicalize_drops_tracking_query_and_fragment(self):
        self.assertEqual(
            hopper.canonicalize("HTTPS://Example.COM/path/?utm_source=x#part"),
            "https://example.com/path"
        )

    def test_strip_html_removes_tags_and_script(self):
        self.assertEqual(
            hopper.strip_html("<h1>Hello</h1><script>bad()</script><p>world</p>"),
            "Hello world"
        )

    def test_iso_date_rss_and_iso(self):
        self.assertEqual(
            hopper.iso_date("Wed, 09 Sep 2026 12:30:00 +0000"),
            "2026-09-09T12:30:00+00:00"
        )
        self.assertEqual(
            hopper.iso_date("2026-09-09T12:30:00Z"),
            "2026-09-09T12:30:00+00:00"
        )

    def test_capture_record_writes_valid_schema_shape_and_deduplicates(self):
        with tempfile.TemporaryDirectory() as temp:
            out = Path(temp)
            first = hopper.capture_record(
                "https://example.com/post?tracking=1",
                "Example", "A short description", "other", "source", out,
                author="Writer", published="2026-09-09T12:30:00Z"
            )
            second = hopper.capture_record(
                "https://example.com/post",
                "Example", "A short description", "other", "source", out,
                author="Writer", published="2026-09-09T12:30:00Z"
            )
            self.assertEqual(first, second)
            data = json.loads(first.read_text(encoding="utf-8"))
            self.assertEqual(data["title"], "Example")
            self.assertEqual(data["author_or_creator"], "Writer")
            self.assertEqual(data["published_at"], "2026-09-09T12:30:00+00:00")
            self.assertTrue(data["source_id"].startswith("SRC-"))

    def test_feed_parses_rss_author_date_and_guid(self):
        fixture = """<?xml version="1.0"?>
        <rss version="2.0"><channel><item>
        <title>Example post</title>
        <link>https://example.com/post</link>
        <description><![CDATA[<p>A short description</p>]]></description>
        <author>author@example.com</author>
        <pubDate>Wed, 09 Sep 2026 12:30:00 +0000</pubDate>
        <guid>stable-guid-1</guid>
        </item></channel></rss>"""
        with tempfile.TemporaryDirectory() as temp:
            with patch.object(hopper, "fetch", return_value=(fixture, "https://example.com/feed", "application/rss+xml")):
                paths = hopper.ingest_feed("https://example.com/feed", Path(temp), "community", 10)
            self.assertEqual(len(paths), 1)
            data = json.loads(paths[0].read_text(encoding="utf-8"))
            self.assertEqual(data["title"], "Example post")
            self.assertEqual(data["reported_observation"], "A short description")
            self.assertEqual(data["author_or_creator"], "author@example.com")
            self.assertEqual(data["published_at"], "2026-09-09T12:30:00+00:00")


if __name__ == "__main__":
    unittest.main()
