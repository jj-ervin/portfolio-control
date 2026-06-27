# Debt Classification

Status: active
Updated: 2026-06-26

This document records the first portfolio-wide debt warning classification pass.

## Scan Surface

Command:

```powershell
.\dcp.ps1 validate-debt -Portfolio -IncludeDocs
```

Portfolio mode scans registered git repos from `projects.yaml` and skips archive or vendor-style entries. It is meant to keep the daily signal focused on active project debt, not historical or third-party material.

## Suppressed Categories

The following marker classes are intentional and no longer produce routine warnings:

| Category | Examples | Rationale |
| --- | --- | --- |
| Formal deprecation vocabulary | `deprecated` enum values in schemas, conformance tests, ONS validator rules | Standards need lifecycle terms to model real states. |
| Published schema/site copies | `public/`, `content/`, `schemas/` | These are versioned reference artifacts, not active implementation shims. |
| Changelog/history vocabulary | `CHANGELOG.md`, accepted PASS and archive paths | Historical records should preserve the original terms. |
| Known active compatibility support | `src/eco/micropython/run.py`, `src/eco/micropython/time_loc.py` | MicroPython/CPython support is an active constrained-runtime layer, not legacy debt. |
| Scanner/self and lockfile metadata | `validate-debt.ps1`, package lockfiles | These create noisy false positives. |

## Visible Warnings

The remaining warnings are intentionally left visible because they represent work that still needs a human decision:

| Repo | Warning Class | Follow-up |
| --- | --- | --- |
| `eco` | `src/lasso/` compatibility shim references in active planning | Complete or close `DP-6-4-09`: retire `orchestrator.py` and any remaining `src/lasso/` shim claims. |
| `.eco` | Four `Current workaround` notes in `GAP_ANALYSIS_ECORUNTIME.md` | Convert each workaround into either implemented runtime behavior, a tracked backlog item, or an explicit accepted limitation. |

## PASS Outcome

This pass reduced the portfolio debt scan from broad lexical noise to a short actionable queue:

- intentional standards vocabulary is classified and allowlisted
- archive/vendor side areas remain outside daily portfolio debt scans
- real cleanup candidates remain visible as warnings
- generated/debug artifacts remain hard failures

