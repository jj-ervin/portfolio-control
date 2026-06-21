# PROTECTED — Agent Protection Rules

**AUTHORITY LEVEL: AL:1**
**Scope:** All agents operating in `C:\dev` or any sub-project within this portfolio
**Enforcement:** These rules apply to Claude, Codex, Copilot, and any other AI agent or automated tool

---

## Rule 1 — Do Not Overwrite Protected Files

The following files are **read-only for agents**. You may read them. You may append to them only when explicitly instructed. You may not rewrite, restructure, or replace their contents.

| File | Reason |
|------|--------|
| `DEV-CONTROL-PLANE.md` | Boundary doctrine — authoritative, not a draft |
| `DEV-PATH.md` (any project) | Phase history and design decisions — append-only |
| `passchangelog.md` (any project) | Governance audit log — append-only |
| `GOVERNANCE-COMMONS.md` | Umbrella scope doc — changes require explicit instruction |
| `PROTECTED.md` (this file) | Cannot modify itself |
| `projects.yaml` | Registry — edit/append only, do not delete entries without instruction |
| `docs/sources/source_*.md` | Source corpus — protected by pre-commit hook |

---

## Rule 2 — Do Not Rename Files Without Permission

Do not rename any file or folder in this portfolio without explicit human instruction. This includes:

- Renaming `DEV-PATH.md` → anything else
- Renaming `DEV-PLAN.md` → anything else
- Renaming project folders
- Renaming any file in `docs/`, `governance-commons/`, or `dxp-org/`

If a rename seems necessary, **stop and ask**. Do not proceed.

---

## Rule 3 — DEV-PATH Files Are Append-Only

Every `DEV-PATH.md` file in this portfolio records the authoritative history of a project. This history must not be rewritten.

Permitted operations:
- Reading the file
- Appending a new phase section at the bottom
- Appending a new task to the TASK REGISTRY table
- Appending a new PASS entry

Forbidden operations:
- Rewriting existing phase sections
- Changing existing design decisions
- Deleting or restructuring existing entries
- Summarizing or collapsing history

If you need to update a DEV-PATH, append. Do not rewrite.

---

## Rule 4 — DEV-PLAN Files Require Caution

`DEV-PLAN.md` files represent current execution state. They may be updated, but:

- Do not delete existing task entries — mark them done instead
- Do not restructure the document layout without instruction
- Do not change the CANONICAL DOC RULE section
- Do not merge or split sections without instruction

---

## Rule 5 — No Bulk Rewrites of Plan Docs

Do not perform bulk rewrites of any planning document (`DEV-PATH`, `DEV-PLAN`, `TRACKS`, `passchangelog`, `DEV-RELEASE`, `DEV-CONTROL-PLANE`). If a comprehensive update seems needed, surface the proposed changes and wait for approval before applying them.

The pre-commit hook (`protect-sources.ps1`) enforces this for `docs/sources/`. The same principle applies to all planning docs by human instruction.

---

## Rule 6 — Feature Ideas Must Not Be Lost

When working in any project that has a `DEV-PATH.md`, `DEV-PLAN.md`, or planning note:

- Do not delete or overwrite sections that contain feature ideas, queued work, or future phases
- If you cannot see where a feature idea fits, append it to the bottom of `DEV-PLAN.md` under a `## QUEUED IDEAS` section
- If you are unsure whether something is stale, ask — do not delete it

---

## Rule 7 — Voice, Canon, and Style Docs Are Read-Only for Agents

For any project that contains a `voice-guide.md`, `canon.md`, `style-guide.md`, `author-rules.md`, or `.governance/` folder:

- Do not alter these files without explicit instruction
- Do not "polish" or "improve" them
- They define constraints, not drafts
- Treat them as read-only reference material

---

## What to Do When Uncertain

If you are about to:
- Rename a file
- Rewrite more than a few lines of a planning doc
- Delete an entry from a registry
- Restructure a document that has an AUTHORITY LEVEL header
- Touch any file listed in Rule 1

**Stop. Ask the human. Do not proceed.**

The cost of pausing is low. The cost of overwriting irreplaceable history or feature plans is high.

---

## Scope

These rules apply to:
- `C:\dev` and all subfolders
- All projects listed in `projects.yaml`
- Any workspace or branch created from these projects
- Any agent session that reads files from this portfolio

---

*Last updated: 2026-06-20*
