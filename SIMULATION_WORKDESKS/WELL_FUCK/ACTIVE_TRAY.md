# Active Tray

<!-- machine-state:start -->
operation_id: WF-SIM-001
status: ACTIVE
priority: P0
started_utc: 2026-11-14T03:36:43Z
<!-- machine-state:end -->

## Operation

**Title:** Preserve and independently verify Cities Laboratory 2.11 in the repository.

**Question:** Can the exact current local prototype be placed in the project home with verified identity, syntax, behavior, and an independently readable repository copy?

**Known input**
- File: Well_Fuck_Cities_Lab_2_11.html
- Current session path: /mnt/data/Well_Fuck_Cities_Lab_2_11.html
- Size: 1,549,198 bytes
- SHA-256: `1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05`
- A generated conversation-file copy was materialized and compared byte-for-byte with the working file; the matching copy is the source for repository publication.

**Progress**
- Exact source identity confirmed by SHA-256.
- Full source text retrieved (969 lines) for publication.
- Node.js v22.16.0 syntax check of the sole inline script: PASS.
- Chromium headless DOM/smoke attempts did not complete within the available 25-second run; no JavaScript exception was captured before timeout. Browser behavior remains INCONCLUSIVE, not passed.
- GitHub blob prepared: `67d17e7efac74434570f36f6b3f726e945db6f1e` (not yet committed at the time this record was prepared).

**Planned repository destination:** builds/Well_Fuck_Cities_Lab_2_11.html

**Scope**
- Transfer the exact file without rewriting or normalizing it.
- Verify repository readback against the source text and known SHA-256.
- Record the repository blob SHA and commit.
- Complete browser/runtime checks and the language/geology-city RNG separation test.

**Stop condition**
The repository copy is byte-identical to the identified local artifact, the commit and blob are recorded, independent readback succeeds, and syntax plus runtime/RNG checks have explicit, checkable results. An inconclusive browser run does not satisfy the stop condition.

**Out of scope**
- New simulation mechanics.
- Geology expansion.
- Language redesign before the current implementation has been audited.
- Changes to existing ChatGPT scheduled tasks.

**Next cursor:** publish the prepared blob at the planned path, read it back independently, then resolve the browser/runtime test and RNG-isolation checks.
