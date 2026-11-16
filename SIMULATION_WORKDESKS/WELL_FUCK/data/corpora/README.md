# Language Corpus Workspace

This workspace is private working intake, not a public redistribution mirror.

## Layers

- `source_manifest.json`: versioned source records and acquisition permissions.
- `incoming/`: original, unmodified source archives acquired for a specific operation.
- `extracted/`: extraction products, kept separate from originals.
- `processed/`: normalized/annotated candidate records used by experiments.
- `manifests/`: frozen sample manifests for reproducible E0–E4 runs.
- `reports/`: acquisition, validation, extraction, and sampling reports.

Do not commit source archives, extracted third-party source text, private conversation data, or unreviewed derived text to the public repository. Keep local data in this workspace and commit only code, schemas, metadata manifests, aggregate reports, and source pointers that are permitted to publish.

## Intake invariants

1. Preserve original archives byte-for-byte after acquisition.
2. Verify published SHA-256 and byte count before extraction.
3. Record license/terms at package and document level where available.
4. Never infer data rights from the software/code license.
5. Never pool source genres or modalities without preserving provenance.
6. Never put raw source attestations into speaker repertoires.
7. Mark every acquisition, extraction, normalization, and sampling action with its code version and input hashes.
8. A source record is not approved for processing merely because its URL is listed.

