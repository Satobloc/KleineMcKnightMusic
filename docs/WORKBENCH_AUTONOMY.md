# KMcKM Workbench Autonomy

This repository has two cooperating work surfaces:

1. **Repository control:** the GitHub connector can browse, search, read files, create branches, commit changes, open pull requests, inspect Actions, retrieve logs, and download artifacts.
2. **Execution:** GitHub Actions checks out code, runs tests and approved tasks, and uploads outputs as short-lived artifacts.

## Issue-driven command channel

The workflow `.github/workflows/workbench-command.yml` accepts an issue whose title begins with `[workbench]`. For safety, execution is restricted to issues opened by the repository owner account `Satobloc`.

The issue body must be JSON. Currently supported command:

```json
{
  "command": "hopper-trial",
  "lyrics_chars": 1800,
  "styles_chars": 500,
  "seed": 20261115
}
```

- `lyrics_chars`: integer from 1 to 5000; default 1800
- `styles_chars`: integer from 1 to 1000; default 500
- `seed`: optional integer for repeatable sampling
- unsupported commands or out-of-range values are rejected before execution

The runner checks out the prototype compiler from `prototype/hopper-trial`, fetches the current corpus from `main`, runs the compiler tests, executes the requested task, and uploads outputs for seven days.

The current compiler command selects these hoppers: `Genre_Hopper`, `Structure_Hopper`, `Prompt_Hopper`, `Prompt_Examples_Hopper`, and `Lyrics_Hopper`. It excludes `Writing_Voice` by default and discards fragments shorter than 24 characters.

## Assistant operating loop

1. Inspect relevant repository state and source files.
2. Make changes on an isolated branch.
3. Run tests and an approved task through the workbench command channel.
4. Retrieve the run, logs, and artifact through GitHub.
5. Inspect outputs and provenance, then repair or iterate.
6. Promote useful results through a pull request or an explicitly chosen merge.

Generated artifacts are not committed automatically. Prototype runs preserve outputs as inspectable artifacts; source provenance is recorded in `pull_manifest.json`.

## Current limits

- The GitHub connector does not expose a general workflow-dispatch or arbitrary-shell action.
- The issue command channel is a bounded substitute: it supports only explicitly whitelisted commands, not arbitrary code from issue text.
- Only the repository owner can trigger the issue command job.
- Artifacts expire after seven days.
- This workbench does not generate Suno audio or interact with a Suno account. It prepares and inspects prompt material.

Add new commands deliberately: define a narrow input schema, validate it, add tests, and keep each command's outputs inspectable.
