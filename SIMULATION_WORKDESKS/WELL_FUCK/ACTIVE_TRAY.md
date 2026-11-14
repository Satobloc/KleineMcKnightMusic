# Active Tray

<!-- machine-state:start -->
operation_id: WF-SIM-001
status: BLOCKED
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
- SHA-256: 1b31d2d9683a416eb3e6b37f0bfbd44529aca73c971a2fc5459a7243c4bf3a05

**Blocker**
The artifact is present in the current session's local working area, but the repository connector used for the documentation bootstrap did not provide a direct local-file upload path. Do not claim the HTML has been committed. The user maintains independent copies. Unblock by making the exact HTML file available as a conversation upload or through another explicitly supported transfer route.

**Planned repository destination:** builds/Well_Fuck_Cities_Lab_2_11.html

**Scope after unblocking**
- Transfer the exact file without rewriting or normalizing it.
- Verify the uploaded file's SHA-256 against the known local hash.
- Record the repository blob SHA and commit.
- Run syntax and browser checks, including the language/geology RNG separation test.
- Read the committed artifact back independently.

**Stop condition**
The repository copy is byte-identical to the identified local artifact, the commit and blob are recorded, and the defined tests have checkable receipts.

**Out of scope**
- New simulation mechanics.
- Geology expansion.
- Language redesign before the current implementation has been audited.
- Changes to existing ChatGPT scheduled tasks.

**Next cursor:** obtain the 2.11 HTML as an upload, then create the repository artifact.
