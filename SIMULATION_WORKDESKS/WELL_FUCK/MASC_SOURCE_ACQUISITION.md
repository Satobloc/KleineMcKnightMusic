# MASC 3.0.0 Source Acquisition Record

**Operation:** WF-LANG-002  
**Checked:** 2026-11-16  
**Status:** SOURCE IDENTITY VERIFIED / ARCHIVE NOT ACQUIRED

## 1. Official corpus description

The official MASC download page identifies an annotated MASC 3.0.0 package and a separate 500K-word data-only package:

- https://anc.org/data/masc/downloads/data-download/
- The annotated corpus is described as over 500K words of written and spoken data, with 25K words from each of 19 genres and up to 17 annotation types.
- The official corpus overview describes MASC as a balanced subset of approximately 500K words of contemporary American English written and spoken data drawn primarily from OANC.
- Annotation coverage and limitations are described at https://anc.org/data/masc/corpus/annotations/ and https://anc.org/data/masc/corpus/masc-structure/.

## 2. License and attribution caution

The official pages are not phrased consistently:

- MASC About: https://anc.org/data/masc/about/ says MASC is distributed without license or other restrictions from the ANC website.
- MASC landing page: https://anc.org/data/masc/ says MASC is available under Creative Commons Attribution 3.0 United States.
- The September 2026 migration release states that existing license and attribution requirements for each dataset/software package continue to apply.

**Working handling rule:** until the exact archive README and source-level notices are inspected, treat the corpus conservatively as CC BY 3.0 US, preserve attribution and provenance, and do not assume that every included text has identical downstream rights. The source corpus itself is a curated subset whose inclusion policy considers licensing. This is a cautious operational rule, not a definitive legal interpretation.

## 3. Release identity and integrity metadata

The ANC website's current download links resolve to the public GitHub migration release:

- Repository: https://github.com/nancyide/anc-website
- Release tag: `datasets-2026-09-25`
- Release metadata: https://api.github.com/repos/nancyide/anc-website/releases/tags/datasets-2026-09-25
- Migration manifest: https://raw.githubusercontent.com/nancyide/anc-website/main/migration/download-manifest.json

The release metadata identifies these two candidate archives:

| Package | Size | SHA-256 |
|---|---:|---|
| `MASC-3.0.0.zip` (annotated) | 36,358,521 bytes | `0b300d96016233c7c79b43559b477a6bb0ed16bb416d5c517eccb108a6228493` |
| `masc_500k_texts.zip` (data only) | 1,351,682 bytes | `0c3f1fd3314ee5ec09830d6f6b217c19a6899d1cabd22c42264578c3348b2d01` |

The release API supplies SHA-256 digests for its assets; the migration manifest independently records source URL paths, byte sizes, hashes, and release asset names. These are source-published integrity values, not locally recomputed hashes.

Direct archive retrieval was attempted through the available download route and failed. The release metadata and checksums are now known, but neither archive has been obtained or inspected locally. The package README, exact internal notices, and text-level rights therefore remain unverified.

## 4. Consequences for WF-LANG-002

1. Do not claim the corpus has been acquired.
2. Do not freeze a corpus sample manifest or run E0/E1 until the actual package is available and inspected.
3. Prefer the annotated archive if access is resolved, because the experiment needs stable document IDs, text, and annotation layers. The data-only archive is not sufficient by itself for the proposed annotated ingestion checks.
4. On acquisition, verify archive SHA-256 against the release digest, inspect the package README and resource headers, map text files to annotation layers, record document-level provenance and genre, and check source notices before sampling.
5. Keep MASC's representativeness limitation visible: it is a balanced 500K-word subset across 19 genres, not a comprehensive sample of contemporary informal conversation or all current social/regional varieties.
6. If archive access remains unavailable, choose an openly accessible alternative only after checking its actual license, provenance, annotation quality, and genre coverage. Do not fabricate an E0 sample from web snippets or metadata.

## 5. Retrieval attempts and result

- Official download links were followed to the migration release.
- GitHub release metadata was fetched successfully and the exact package names, sizes, and SHA-256 values were inspected.
- The annotated archive and data-only archive download attempts failed in the current execution environment.
- No archive bytes were received; no local checksum, extraction, sampling, or ingestion test was performed.

**Next action:** obtain the annotated MASC 3.0.0 archive through a working route, then verify its contents and package-level terms before freezing the sample manifest.
