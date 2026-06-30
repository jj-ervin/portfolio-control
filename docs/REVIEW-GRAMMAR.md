# REVIEW-GRAMMAR

Status: active
Updated: 2026-06-30
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
| Close the loop on X | Fix the issue, validate the fix, update trackers, and commit when appropriate. | Small scoped changes plus validation evidence. |
| De-stale X | Remove outdated claims after a correction or implementation lands. | Updated docs with old "not written", "TBD", or missing-plan claims removed. |

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

## Closure States

Use the closure states from `docs/gap-analysis-framework.md`:

| State | Meaning |
| --- | --- |
| open | Not started or only informally described. |
| spec-complete | A spec, schema, or test vector exists. |
| release-complete | Published, packaged, and installable. |
| runtime-complete | Mechanism runs, emits observable signals, and is tested. |

Do not call a gap closed merely because it is documented.

## Stranger Test

Before calling a gap closed, ask:

> Can a stranger install this, run it, produce evidence, verify that evidence, and trust the release artifact?

If the answer is no, the remaining work is adoption, validation, release, or runtime evidence work.

## Diagnostic Levels

Used by `validate-recent-work.ps1` and `review-last-24h.ps1`. Reference these levels when asking for a diagnostic or specifying review depth.

| Level | Name | Scope |
| --- | --- | --- |
| 1 | Quick Health | All 5 atomic validators. Pass/fail only. No git analysis. |
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

## GC-AUDIT Registry

This file is the canonical verb registry for GC-AUDIT, declared by DEV-ACCORD.05 (GC:2013).
GC-AUDIT is the portfolio-wide toolchain for validation, normalization, de-stale, adversarial
review, trace, and release-readiness operations. The verbs above are the standard operation names.

Remaining promotion steps (post DEV-ACCORD.05):

1. Promote the 12-question framework into a GC profile or standard.
2. Teach eco to emit review and validation evidence using GC event schemas.
3. Expose a DCP/Governance Kit five-minute checklist for adopters.
