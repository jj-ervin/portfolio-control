# REVIEW-GRAMMAR

Status: active
Updated: 2026-07-01
Authority: GC standard component — canonical verb registry for GC-AUDIT (declared by DEV-ACCORD.05 / GC:2013)

## Purpose

This document is the canonical verb registry for GC-AUDIT operations across the `C:\dev`
portfolio. It is the working command language for human and agent sessions.

DEV-ACCORD.05 (GC:2013) promoted this file from a portfolio working grammar to a GC
standard component. All GC-AUDIT implementations must use the operation names defined
here. Extensions to the verb list require an amendment to DEV-ACCORD.05.

Use this file when a short instruction like "normalize lasso" or "adversarial audit
the last 24 hours" would otherwise be ambiguous.

## Authority Boundary

| Layer | Responsibility |
| --- | --- |
| REVIEW-GRAMMAR (this file) | GC-AUDIT verb registry — canonical operation names for all audit tooling |
| Governance Commons / DEV-ACCORD | Standards that govern DEV-DOCS; GC-AUDIT declaration (DEV-ACCORD.05) |
| eco | Runtime execution, PASS evidence, telemetry, validation gates |
| DCP / Governance Kit | Five-minute adoption path, registry checks, planning templates |

## Command Verbs

| Command | Meaning | Expected Output |
| --- | --- | --- |
| Normalize X | Align names, scope, status, paths, registry entries, and authority pointers for X. | Minimal doc/registry edits, stale claims removed, pointers validated. |
| Validate X against Y | Check whether X satisfies the declared rules in Y. | Pass/fail findings with source references and any required fixes. |
| Verify implementation of X | Inspect code/tests to confirm a specific contract is actually implemented. | Code-grounded findings, tests run or test gaps named. |
| Adversarial audit X | Try to disprove claims about X. Look for contradictions, stale state, loopholes, unsafe assumptions, and drift paths. | Findings ordered by severity, with remediation options. |
| Meta-audit X | Audit the tracker, registry, inventory, or gap list for X, not only X itself. | Stale tracker claims, missing coverage, and process gaps. |
| Trace X | Follow X from origin to authority to plan to implementation to evidence. | A lineage chain and any broken links. |
| Authority audit X | Identify which document or spec has the right to define X. | Authority source, superseded sources, and ambiguity risks. |
| Registry audit X | Check whether `projects.yaml` and related indexes tell the truth about X. | Missing fields, stale notes, broken pointers, and schema gaps. |
| Close the loop on X | Fix the issue, validate the fix, update trackers, and commit when appropriate. Current-branch publish is the default unless a git split is explicitly authorized under DEV-ACCORD.10. | Small scoped changes plus validation evidence. |
| De-stale X | Remove outdated claims after a correction or implementation lands. | Updated docs with old "not written", "TBD", or missing-plan claims removed. |
| Preflight X | Validate that the named agent or current session declared and completed the GC agent-trail reading sequence before beginning work. | Pass/fail with missing files listed and required stamp format shown. |

## Review Order Terms

| Term | Meaning |
| --- | --- |
| First-order review | Review the thing itself. Example: does Cockpit match CK.01? |
| Meta-audit / second-order review | Review whether the gap list, registry, inventory, or tracker about the thing is accurate. |
| Process audit / third-order review | Review whether the process prevents future drift, false closure, or repeated stalls. |

Do not confuse this with first-party, second-party, and third-party audits:

- First-party audit: internal self-audit.
- Second-party audit: stakeholder, customer, vendor, or dependent-team audit.
- Third-party audit: independent external auditor or certifier.

## GC Planning Vocabulary

*Planning container lock declared by DEV-ACCORD.07 (GC:2015).*

### Structural planning containers

Phase, Wave, and Track are the only three GC structural planning containers. Agents must not invent a fourth.

| Term | Answers | Role |
| --- | --- | --- |
| Phase | What era is the project in? | Macro arc — preserved in DEV-PATH.md |
| Wave | What delivery batch within this phase? | Sequences work inside a phase |
| Track | What persistent workstream owns this? | Parallel lanes — CLI, schema, UI, runtime, release, docs |

### Governance contract

| Term | Answers | Note |
| --- | --- | --- |
| PASS | What governed contract defines done? | Not a planning container — may span multiple Tracks or Waves |
| Sub-PASS | What child contract can close or fail independently? | Narrows a PASS scope |

### Supporting vocabulary

| Term | Answers |
| --- | --- |
| RUN | What execution event happened? |
| Evidence Bundle | How is the RUN independently verifiable? |
| Work Item | What local planning row tracks a task? |
| Gate | What check must pass before closure? |
| Release | What packaged version or distribution target ships? |

### Vocabulary Lock

Agents must not invent new GC planning or governance vocabulary. Any term not listed above
is invalid for DEV-DOCS planning taxonomy. A new term requires a GC amendment before use.

Allowed exception: a project may use a domain word like `lane` descriptively for product
architecture — "Marlin Lane 1 — package manager." That does not create a new GC term.

`Flow` is not a GC planning unit. Use it only as ordinary prose.

## Change Playbook Execution Levels

DEV-ACCORD.06 defines the portfolio Change Playbook. It owns the four execution
levels used to decide governance obligations:

| Execution level | Meaning |
| --- | --- |
| BUNT | Tiny tactical change with no behavioral effect |
| RUN | Normal bounded work with local, contained impact |
| DRIVE | Meaningful milestone movement that is visible or release-affecting |
| PASS | Governed contract for planned, multi-step, or cross-cutting work |

BUNT and DRIVE are Change Playbook execution levels only. They are not planning terms
and must not appear in DEV-DOCS planning structure.

`RUN` and `PASS` appear in both vocabularies with distinct meanings:

| Term | Planning / governance meaning | Change Playbook execution-level meaning |
| --- | --- | --- |
| RUN | An execution event: work happened. | A normal bounded change with local, contained impact. |
| PASS | A governance contract: scope and Done-when are agreed. | Work whose governance weight requires PASS-level obligations. |

## Closure States

Use the closure states from `docs/gap-analysis-framework.md`:

| State | Meaning |
| --- | --- |
| open | Not started or only informally described. |
| spec-complete | A spec, schema, or test vector exists. |
| release-complete | Published, packaged, and installable. |
| runtime-complete | Mechanism runs, emits observable signals, and is tested. |

Do not call a gap closed merely because it is documented.

## Development Status Vocabulary

Agents must use the status vocabulary declared by the artifact they are editing.
If an artifact does not declare its own allowed statuses, use the tables below.
Do not invent status values.

| Artifact / scope | Allowed statuses |
| --- | --- |
| `projects.yaml` project status | `active`, `stable`, `wip`, `scaffold`, `archive` |
| PASS closure status | `OPEN`, `CLOSED` |
| Planning work item status | `planned`, `queued`, `open`, `in-progress`, `blocked`, `done`, `deferred` |
| Gap closure status | `open`, `spec-complete`, `release-complete`, `runtime-complete` |
| Release status | `planned`, `in-progress`, `blocked`, `released`, `deferred` |
| Document lifecycle status | `draft`, `active`, `accepted`, `superseded`, `archived` |

### Status Lock

Agents must not introduce new DEV status values. Any status value not listed
in the relevant table above is invalid unless the target artifact already
declares that exact value as allowed.

Use notes fields, prose, or a work item description for nuance. For example:
use `status: archive` plus a note saying "redirect-only legacy entry", not
`status: migrating`.

If a new status value is genuinely needed, stop and propose a grammar or
DEV-ACCORD amendment first.

## Stranger Test

Before calling a gap closed, ask:

> Can a stranger install this, run it, produce evidence, verify that evidence, and trust the release artifact?

If the answer is no, the remaining work is adoption, validation, release, or runtime evidence work.

## Diagnostic Levels

Used by `validate-recent-work.ps1` and `review-last-24h.ps1`. Reference these levels when asking for a diagnostic or specifying review depth.

| Level | Name | Scope |
| --- | --- | --- |
| 1 | Quick Health | All 8 atomic validators, including git split authorization, CI invariant uniqueness, and script format (parse-only). Pass/fail only. |
| 2 | Recent-Work Review | Level 1 + dirty repo scan, commit log for the time window, changed files. |
| 3 | Adversarial Audit | Level 2 + open TODO/FIXME/TBD in recently-touched markdown, DEV-PLAN staleness vs commits. |
| 4 | Release Readiness | Level 3 + pending items in DEV-RELEASE.md files, open PASS gates. |

Examples: "run a Level 1 diagnostic", "adversarial audit the last 24 hours" (= Level 3).

## Agent Output Contract

When performing any review command, agents should produce:

1. Scope reviewed.
2. Findings or confirmation that no issue was found.
3. File references or evidence.
4. Validation performed, or validation not run with reason.
5. Next action: fix, defer, promote, or no action.

For code reviews and implementation audits, findings lead. For normalization work, changes and validation lead.

## PLAY to GC-AUDIT Obligations

PLAY execution-level obligations and PLAY record close requirements are defined in:

`governance-commons/gc-audit/PLAY-OBLIGATIONS.md`

REVIEW-GRAMMAR remains the canonical GC-AUDIT verb registry and should keep process
details in dedicated GC-AUDIT process docs.

---

## GC-AUDIT Registry

This file is the canonical verb registry for GC-AUDIT, declared by DEV-ACCORD.05 (GC:2013).
GC-AUDIT is the portfolio-wide toolchain for validation, normalization, de-stale, adversarial
review, trace, and release-readiness operations. The verbs above are the standard operation names.

Remaining promotion steps (post DEV-ACCORD.05):

1. Promote the 12-question framework into a GC profile or standard.
2. Teach eco to emit review and validation evidence using GC event schemas.
3. Expose a DCP/Governance Kit five-minute checklist for adopters.
