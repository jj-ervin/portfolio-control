# Portfolio reconciliation recovery — 2026-10-06

## Outcome

The stranded reconciliation has been recovered into the existing `C:\dev` portfolio control plane without creating a second framework.

- The canonical live registry remains `C:\dev\projects.yaml`.
- The canonical execution ledger remains `C:\dev\PLAY.jsonl`.
- Immutable reconciliation evidence now lives in the established `C:\dev\docs\reviews` area.
- The recovered cross-source inventory contains 74 entries.
- The final classified inventory contains zero `UNCLASSIFIED` rows and zero generic release-pending classifications.
- Twenty completed reconciliation reports were copied byte-for-byte and verified by SHA-256.
- The approximately 650 MiB preservation ZIP and other raw evidence were moved intact into the existing ignored `C:\dev\_archive` area and were not added to Git.
- Nothing was deleted, committed, pushed, released, deployed, merged, or synchronized.

## Recovered artifacts

The source snapshot is preserved as:

- `2026-10-06-project-reconciliation-inventory.csv`
- `2026-10-06-project-reconciliation-inventory.md`

The evidence-backed final inventory is:

- `2026-10-06-project-reconciliation-inventory-final.csv`
- `2026-10-06-project-reconciliation-inventory-final.md`

Detailed source/target hashes and archive disposition are recorded in `2026-10-06-project-reconciliation-provenance.csv`.

The imported project reports cover Agent Project Orchestrator, Arche, Cockpit, CXP, Doc Vault Plane, eco-edge, eco/Marlin, eco-slate, eco-vscode, EdgeLab, Elan, eOS, Kinjuu, LASSO, Niji, portable .eco/DevXToolkit, Sealdex, Signal Radar, Trust But Verify, and time.loc/GEE. Existing Governance Commons reviews already present in this directory were retained rather than duplicated.

The two former `Documents\Codex` output trees are now preserved at:

- `C:\dev\_archive\2026-10-05-project-reconciliation-outputs` — 632 files, 691,985,322 bytes.
- `C:\dev\_archive\2026-10-06-kinjuu-reconciliation-outputs` — 10 files, 140,255 bytes.

Both moves retained the same file counts and byte totals, and sentinel hashes matched after relocation. The former `outputs` paths no longer exist.

## Previously unresolved entries

| Repository | Recovered classification | Required action |
| --- | --- | --- |
| `dxp-org/dotgovernance` | Partial historical starter; remote implementation intact; local checkout has 17 preserved deletions | Determine whether the deletions are intentional before restoring, staging, or synchronizing anything |
| `governancecommons/agent-dossier` | Canonical organization component; released v1.1.0 | No deeper reconciliation |
| `governancecommons/agent-dossier-www` | Canonical supporting site | No deeper reconciliation |
| `governancecommons/agent-roster` | Canonical implemented supporting component; v1.0.0 tag, no GitHub release | Release only if it becomes an active distribution priority |
| `governancecommons/agent-team-protocol` | Canonical successor protocol scaffold/spec | Continue only through its existing activation plan |
| `governancecommons/governance-commons-www` | Canonical public organization site | Treat personal site as stale duplicate |
| `jj-ervin/agent-dossier` | Stale/superseded personal predecessor | Preserve; do not use as canonical |
| `jj-ervin/agent-dossier-www` | Stale duplicate public site | Preserve pending an explicit redirect/archive decision |
| `jj-ervin/agent-matrix` | Stale/superseded personal predecessor | Preserve; do not use as canonical |
| `jj-ervin/bax` | Partial; open draft PR #1 implements ingestion but lacks live API/PBIX acceptance | Validate the draft in Power BI before merge consideration |
| `jj-ervin/bean-21-salute` | Canonical documentation/R&D recipe source; consolidated V1.2 and test-cook package implemented | No software work; run physical testing only if the product is prioritized |
| `jj-ervin/claude-budget-bar` | Canonical public release source v0.2.0; Marketplace remains v0.1.0 | Close release parity after private v0.3 scope is accepted |
| `jj-ervin/claude-budget-bar-vscode` | Canonical private v0.3 implementation; 24 tests pass | Decide the release-safe v0.3 cut before copying to the public repository |
| `jj-ervin/dev-docs` | Canonical private documentation repository; local main ahead one commit | Review and commit/push `19f69d6` only with explicit authorization |
| `jj-ervin/governance-commons-www` | Stale duplicate public site | Preserve pending an explicit redirect/archive decision |
| `jj-ervin/kinjuu` | Canonical private Flutter source; tests/analyzer/web proof pass; platform and release gates remain partial | Keep behind Cockpit and commercial work unless its product priority changes |
| `jj-ervin/ons` | Stale/superseded personal v1.2-era predecessor | Preserve; organization v1.3 repository is canonical |
| `jj-ervin/reddit-publisher` | Partial remote-only Python scaffold; no tests, CI, release, or live proof | Do not exercise credentials or posting; implement only if it becomes a current revenue channel |
| `jj-ervin/resume-private` | Canonical private data boundary; local folder has no independent Git identity | Repair ownership/topology separately without inspecting or exposing personal data |
| `jj-ervin/vault` | Canonical private operational registry; implemented and synchronized except one onboarding-doc edit | Preserve private-registry role; Sealdex supersedes only the distributable template |

## Current discrepancies that affect execution

1. Cockpit has a reported large chat-to-repository implementation gap and unrelated pending local changes that must be preserved.
2. Claude Budget Bar has three distinct states: private implementation v0.3.0, public source v0.2.0, and Marketplace v0.1.0.
3. BAX PR #1 is mergeable but intentionally lacks live API/PBIX acceptance.
4. `dev-docs` has one unpublished local commit.
5. `dotgovernance` has 17 unexplained local deletions.
6. `resume-private` exists remotely, while its local directory is not an independent Git checkout.
7. Historical personal Governance Commons repositories remain visible and can cause authority confusion, but no destructive disposition is authorized.

## Ranked execution queue

1. **Cockpit catch-up:** preserve the current dirty state, translate accepted chat-side decisions into bounded implementation commits, and avoid another design pass.
2. **Trust But Verify commercial follow-through:** verify the current sales/listing state and close only the blockers that prevent revenue.
3. **Claude Budget Bar release parity:** decide the release-safe v0.3 cut, validate packaging, then align public source and Marketplace through separately authorized release actions.
4. **BAX acceptance:** exercise draft PR #1 in the required Power BI/API environment before any merge.
5. **Small local-state closures:** review the `dev-docs` local-only commit, determine the intent of the `dotgovernance` deletions, and repair `resume-private` topology without touching private content.
6. **Low-priority hygiene:** redirects/archive decisions for stale personal Governance Commons surfaces, plus dormant remote-only projects, only when they materially obstruct active work.

This recovery ends the broad portfolio-audit phase. Further work should use the final inventory as a navigation aid and return to implementation rather than extending the reconciliation bureaucracy.
