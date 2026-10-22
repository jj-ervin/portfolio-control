# DCP.92.00 — Portfolio recovery (working name; not yet registered)

Status: OPEN
Scope: Local portfolio recovery contract; no portable standard created.
Human authorization: Jesse explicitly approved execution-brief.md and then directed GO after enabling write access.

# Portfolio recovery and reconciliation — execution brief

Goal: Recover the portfolio root and newer project checkouts, preserve unpublished work, and apply the prepared documentation corrections without promoting exploratory ideas into product scope.

Proposed PASS ID: DCP.92.00 (local portfolio recovery contract; not a new portable GC standard).

Sub-PASS lanes:

| Lane | Scope |
|---|---|
| DCP.92.01 | Preserve root Git metadata, overwritten/root files, unpublished commits, SDK edits, and dotgovernance deletion diff; verify archive integrity. |
| DCP.92.02 | Correct root origin to `jj-ervin/dev`, recover existing main at `96e0594`, restore only root-owned missing/wrong-project files, and verify child repos are unchanged. |
| DCP.92.03 | Fast-forward clean stale checkouts to inspected remote main commits; preserve branches and dirty SDK/dotgovernance state for review. |
| DCP.92.04 | Apply the exact TBV, Signal Radar, and LASSO documentation corrections in the prepared diff, including append-only history updates. |
| DCP.92.05 | Establish EdgeLab's documentation foundation in the existing empty local folder, initialize its own Git repository on unborn main, and connect it to the existing `jj-ervin/edge-lab` remote. |
| DCP.92.06 | Reconcile root registry pointers/status, run existing appropriate validators/tests, record actual results and remaining work, and refresh the inventory. |

Repos touched: `jj-ervin/dev`; `governancecommons/governance-commons`, `agent-team-protocol`, `governance-commons-www`; `jj-ervin/cockpit`, `eco`, `resume`, `hoodie-boom-labs`; `dxp-org/devxtoolkit-v2-x`; `jj-ervin/trust-but-verify`, `signal-radar`, `lasso`, `edge-lab`. SDK, dev-docs and dotgovernance are preserved/inspected without automatic synchronization. Archive/dormant copies retain their current state.

Files:

- Portfolio root: exact file restoration/removal actions in `root-recovery-manifest.json`; `.gitignore`, `projects.yaml`, append-only `DEV-PATH.md`/`DEV-PLAN.md`, `PLAY.jsonl`, and this local recovery contract as appropriate. Files owned by nested repositories are excluded from root file restoration.
- Clean checkouts: only file changes already committed in the inspected remote main histories; no arbitrary rewriting or branch-stack merging.
- TBV: `README.md`, append-only reconciliation entries in `DEV-PLAN.md` and `DEV-PATH.md`.
- Signal Radar: `docs/architecture.md`.
- LASSO: `README.md`, append-only reconciliation entries in `DEV-PLAN.md` and `DEV-PATH.md`.
- EdgeLab: `README.md`, `docs/research-method.md`, `DEV-PLAN.md`, `DEV-PATH.md`, `.gitignore`; initialize `C:\dev\edge-lab\.git` and set its origin to the existing empty remote. No experiment or execution implementation is included.

Validation gates:

1. The preservation archive opens, its CRC check passes, and its SHA-256 is recorded.
2. Every root write/removal is contained in `C:\dev` and matches the reviewed pre-change hash; existing unrelated changes are retained.
3. Root origin and main match the portfolio identity; every nested HEAD/status matches the before snapshot immediately after root recovery.
4. Each synchronization is clean and fast-forward only, with a pinned target and no recursive submodule update. New unexpected remote state or dirty files stop that repository's action.
5. Proposed document changes match pre-change hashes, preserve history/queued work, and correct only verified claims.
6. Run existing governance validators and project tests appropriate to the changes. A pre-existing or out-of-scope validator failure is recorded rather than “fixed” by changing governance tooling.
7. Refresh the inventory with actual applied, preserved, and blocked state.

Commit plan: retain existing current branches; leave newly applied local changes reviewable. No push, public publication, new PR, worktree, branch stack, deletion/rename of project folders, or replacement/movement of existing `.git` directories. No version/release bump is included. The initial EdgeLab Git repository is the only new Git metadata location.

Blockers: the portfolio’s DEV-ACCORD.06 requires confirmation of this compound brief before repo edits. `C:\dev` also requires filesystem write approval in this Codex session. This brief does not authorize GC RFC implementation/activation, publication, prospect outreach, trading/account access, or live agent dispatch. Those remain separately scoped work after recovery makes current code and authority available locally.

Existing SDK edits remain unfinished local work: remote npm intentionally lacks TypeScript Capability/Dossier parity. A blind update would lose those edits, and the local 0.3.0 Python bump conflicts with remote's coordinated 0.2.0 release metadata. Their complete integration requires a separately reviewed source change set; preservation is included here.

Confirmation covers the exact recovery, fast-forward synchronization, 12 prepared document changes, root registry reconciliation, and initial EdgeLab Git setup above. No further confirmation is needed for those named actions once this brief is approved.

## Execution receipt

Approved recovery actions applied. Registry pointers and source preservation pass. Governed closure remains OPEN because the existing portfolio release profile fails on bootstrap/planning debt. No new validation tooling was introduced into any repository. No commit or push was produced.
