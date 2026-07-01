# SCRIPTS.md — Portfolio Script Reference

Status: active
Updated: 2026-06-28
Authority: portfolio control plane

Quick reference for portfolio script entrypoints. GC-AUDIT authority lives under
`governance-commons/gc-audit/tools`; matching root `.ps1` files are compatibility
adapters unless noted otherwise.
For the review command vocabulary (normalize, adversarial audit, trace, etc.), see [`docs/REVIEW-GRAMMAR.md`](docs/REVIEW-GRAMMAR.md).
For the authoritative machine-readable GC-AUDIT index used by Marlin/Cockpit/DCP menus, see [`governance-commons/gc-audit/GC-AUDIT-REGISTRY.yaml`](governance-commons/gc-audit/GC-AUDIT-REGISTRY.yaml).

---

## Five-Minute Onboarding

New session? Run these three in order:

```powershell
.\dev-status.ps1              # Are all repos clean and synced?
.\validate-recent-work.ps1 -Level 1   # Do all validators pass?
.\dev-report.ps1 -GapOnly             # What planning gaps are open?
```

End of session? Run the closing ritual:

```powershell
.\review-last-24h.ps1         # Commit log + dirty check + all validators
.\review-last-24h.ps1 -Deep   # + adversarial: open markers, stale planning docs
```

---

## Diagnostic Levels

Used by `validate-recent-work.ps1` and `review-last-24h.ps1`.

| Level | Name | What it checks |
| --- | --- | --- |
| 1 | Quick Health | All 5 validators. Pass/fail only. |
| 2 | Recent-Work Review | + dirty repos, commit log for last N hours, changed files. |
| 3 | Adversarial Audit | + open TODO/FIXME/TBD in recently-touched markdown, DEV-PLAN staleness vs commits. |
| 4 | Release Readiness | + pending items in DEV-RELEASE.md, open PASS gates. |

---

## Script Index

The tables below are human-readable help. The execution allowlist is
`governance-commons/gc-audit/GC-AUDIT-REGISTRY.yaml`; security-sensitive callers
must use the registry instead of scraping this document.

### Portability Contract

Paths in the GC-AUDIT registry are relative to the portfolio/control-plane root.
`dcp.ps1 init` installs the required `governance-commons/gc-audit` registry and
`governance-commons/passes/dev-accord` authority files into the target root.
After init, edit `projects.yaml` for that root before running portfolio-wide
pointer checks.

### Entrypoint

| Script | What it does | Common invocation |
| --- | --- | --- |
| [dcp.ps1](dcp.ps1) | Command wrapper — the front door for init, status, validate, validate-debt | `.\dcp.ps1 help` |
| [dcp-setup.ps1](dcp-setup.ps1) | One-time setup: wires pre-commit hook, runs pointer validation, shows dashboard | `.\dcp-setup.ps1` |

### Status & Reporting

| Script | What it does | Common invocation |
| --- | --- | --- |
| [dev-status.ps1](dev-status.ps1) | Git status dashboard for every repo in `projects.yaml`. Flags dirty, ahead, behind. | `.\dev-status.ps1` |
| [dev-report.ps1](dev-report.ps1) | Planning status report: gap analysis table + per-project detail (GC:2008 / DEV-ACCORD.00) | `.\dev-report.ps1 -GapOnly` |

### Atomic Validators

Each script checks one thing, exits 0/1, callable standalone or composed by other scripts.

| Script | What it validates | Standard | Common invocation |
| --- | --- | --- | --- |
| [validate-bootstrap.ps1](validate-bootstrap.ps1) | AGENTS.md exists and routes to DEV-ACCORD.03; no overclaims | DEV-ACCORD.04 (GC:2012) | `.\validate-bootstrap.ps1` |
| [validate-planning.ps1](validate-planning.ps1) | DEV-PLAN/DEV-PATH/DEV-TRACKS/DEV-RELEASE present and structurally valid | DEV-ACCORD.00 | `.\validate-planning.ps1` |
| [validate-pointers.ps1](validate-pointers.ps1) | All file pointers in `projects.yaml` resolve on disk | — | `.\validate-pointers.ps1` |
| [validate-review-grammar.ps1](validate-review-grammar.ps1) | Repo has a REVIEW-GRAMMAR file and agent instructions reference it | — | `.\validate-review-grammar.ps1` |
| [validate-debt.ps1](validate-debt.ps1) | Tracked files are free of generated artifacts and legacy shim markers | — | `.\validate-debt.ps1 -Portfolio -IncludeDocs` |

### Normalizers

Each normalizer is the fix-counterpart to an atomic validator. Always supports `-DryRun` to preview before writing.

| Script | What it fixes | Paired validator | Common invocation |
| --- | --- | --- | --- |
| [normalize-bootstrap.ps1](normalize-bootstrap.ps1) | Creates missing AGENTS.md (W1); adds DEV-ACCORD.03 routing to broken ones (E1) | validate-bootstrap.ps1 | `.\normalize-bootstrap.ps1 -DryRun` |
| [normalize-planning.ps1](normalize-planning.ps1) | Renames non-standard planning doc names (TRACKS.md → DEV-TRACKS.md, etc.) via `git mv` | validate-planning.ps1 | `.\normalize-planning.ps1 -DryRun` |
| [normalize-pointers.ps1](normalize-pointers.ps1) | Fixes broken file pointers in projects.yaml using rename heuristics | validate-pointers.ps1 | `.\normalize-pointers.ps1 -DryRun` |

### Composite Review

These orchestrate the atomic validators and add commit-level analysis.

| Script | What it does | Common invocation |
| --- | --- | --- |
| [validate-recent-work.ps1](validate-recent-work.ps1) | Multi-level portfolio diagnostic (Levels 1–4). Runs validators + git analysis. | `.\validate-recent-work.ps1 -Hours 24 -Level 2` |
| [review-last-24h.ps1](review-last-24h.ps1) | Closing-ritual wrapper. Runs Level 2 by default; `-Deep` for 3, `-Deeper` for 4. | `.\review-last-24h.ps1` |

### Maintenance & Sync

| Script | What it does | Common invocation |
| --- | --- | --- |
| [sync-dcp.ps1](sync-dcp.ps1) | Copies distributable DCP files from this portfolio root to the `dxp-org\devx-control-plane` distribution repo | `.\sync-dcp.ps1 -DryRun` then `.\sync-dcp.ps1 -Commit` |
| [protect-sources.ps1](protect-sources.ps1) | Pre-commit hook: blocks commits that bulk-change `docs/sources/source_*.md` | Wired automatically by `dcp-setup.ps1` |

---

## Normalize → Validate Workflow

The standard pattern for fixing drift:

```powershell
.\dcp.ps1 validate                   # find what's broken
.\dcp.ps1 normalize -DryRun          # preview all fixes
.\dcp.ps1 normalize                  # apply fixes
.\dcp.ps1 validate                   # confirm clean
```

Or target one area:

```powershell
.\dcp.ps1 normalize-bootstrap -DryRun
.\dcp.ps1 normalize-bootstrap
.\dcp.ps1 validate-bootstrap
```
