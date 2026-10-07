# Trust But Verify reconciliation — 2026-10-06

The book has a reproducible frozen v1.0 source package and two identifiable Gumroad listings. Its companion tools are partial: the CLI has list/start foundations, while the local and remote VS Code projects have unrelated histories and conflicting designs. The remote extension candidate has a compilation failure and an approval-binding defect. No companion is demonstrated as a complete implementation of the book's five-stage process.

## Canonical product and distribution

The source owner is `C:\dev\trust-but-verify`, matching GitHub `jj-ervin/trust-but-verify` main at `f4ed698aa652ea50dbee3f3bcf9aa8d887c10fd6`. The book retains ten workflows and five stages: Plan → Generate → Audit → Approve → Record.

- [Full Edition](https://jjervin.gumroad.com/l/trust-but-verify-ten-practical-workflows): the owner-supplied public URL returned HTTP 200 and title “Trust, But Verify: 10 Practical AI Workflows”.
- [Free Sample](https://jjervin.gumroad.com/l/trust-but-verify-free-edition): the owner-supplied public URL returned HTTP 200 and the expected free-copy title. Its retrieved description identifies Debug Code and Generate Documentation as the two preview workflows.

These checks establish public listing identities. They do not establish current rendered prices, checkout availability, purchased download contents or current sales. Local $9/$6 pricing and August publication/sales records remain historical planning evidence. Three launch drafts now contain the clean Free Sample URL; stale “this week” wording was removed where found. No post or live listing was changed.

The Release Engineering Preflight remains a **DRAFT addendum**, excluded from frozen v1.0 builds. It specializes workflow 8 and the Audit → Approve → Record transition. Proposed v1.1 workflows 11/12 and additional web copy remain queued ideas; this reconciliation did not adopt a sixth stage, expand the manuscript or rebuild the published product in place.

## Repository identities and classifications

| Local location under C:\dev | GitHub identity / inspected head | Disposition |
| --- | --- | --- |
| trust-but-verify | jj-ervin/trust-but-verify; main `f4ed698a` | CANONICAL frozen product source; IMPLEMENTED build/test package. Current docs repaired locally. |
| trust-but-verify-companion | jj-ervin/trust-but-verify-companion is an empty public repository | Separate empty local placeholder and remote identity. The local folder has no own Git repository; inherited C:\dev Git state is not its history. |
| trust-but-verify-companion-cli | jj-ervin/trust-but-verify-companion-cli; main `9c48a18d` | Local/remote heads agree. PARTIAL implementation: list/start foundations; later commands are stubs. |
| trust-but-verify-companion-cli-registry | jj-ervin/trust-but-verify-companion-cli-registry; main `826cd248` | Local/remote heads agree. PARTIAL distribution scaffold, README/LICENSE; no verified published artifact. |
| trust-but-verify-companion-vscode | Local head `39d3dc5a`, no remote. GitHub main `852ef24d`; feat/initial-scaffold `c30feaba` | Two separate lineages. Local is a scaffold/proposal; remote feature is code-bearing but PARTIAL and blocked. Canonical architecture unresolved. |
| trust-but-verify-companion-vscode-registry | Local head `4be1ae73`, no remote; authenticated account lookup found no accessible repository of this exact name | LOCAL-ONLY distribution scaffold. The empty generic companion repository was not reassigned to it. |

The book's `claude/copyright-notice` branch at `d3db6a22` is seven commits behind main, zero ahead. It is SUPERSEDED ancestry, not unrecovered new work; it was retained.

The local VS Code root is `c61a1d6e45b9aec33a80c64c7e3853a9e9f2c134`; the remote root/main is `852ef24d6d5ee8373617ce1b7fccfec01f822dbe`. The remote feature is three commits ahead of main, zero behind. The local root lookup in that remote returned 404, consistent with the inspected distinct lineages. No remote was rebound and no history was merged or replaced.

## Demonstrated companion gaps

**CLI:** an isolated build succeeds. Ten workflow parsers, PLAN state/pointer creation and reading, invalid-workflow handling and the five stub exits were checked. `log`, `next`, `approve`, `record` and `status` exit 1 as unimplemented. Valid `start` was not invoked because it writes the system clipboard; its parser/state components were tested independently.

All ten bundled workflow Markdown files are byte-identical to the frozen book source. Effective prompts nevertheless differ: the book renderer injects the shared conversation rule into PLAN, evidence and change-application rules into AUDIT, stage nudges into GENERATE/RECORD, and approval rules into APPROVE. CLI `promptForStage` returns the raw sections and does not add these rules; APPROVE throws. Raw file equality is therefore insufficient proof of book-equivalent companion behavior. See [prompt parity evidence](prompt-parity.json).

**VS Code:** the local plan makes the CLI the core engine with an editor wrapper. The inspected remote feature instead defines an agent-neutral workspace protocol: `.tbv/session.json` holds replaceable session state, while `.tbv/decisions.jsonl` holds human decision events. This is a substantive design conflict, not merely a missing remote setting. Neither candidate was declared canonical.

The remote candidate's allowed dependency installation fails compilation at `src/tbvState.ts:263`: a `Uint8Array<ArrayBufferLike>` cannot be assigned to the inferred `Uint8Array<ArrayBuffer>`. This is the tested current dependency resolution, not a claim about every historical compiler version. See [compile output](vscode-compile.txt).

An isolated in-memory reproduction also demonstrates a stale approval defect: the panel displays session A/gate A; workspace state changes to session B/gate B; the old panel sends only `APPROVE`; `recordDecision` reads the latest state and records approval for B. A human click on A can therefore authorize B. No real decision log was written, and stage auto-advance was not observed. See [reproduction evidence](vscode-gate-binding-reproduction.json).

## Verification and applied changes

The book was exported at its inspected committed head and built in an isolated workspace. All **23 unit tests pass**. Full, sample and checklist PDFs pass the existing canonical content, metadata and page-count verification; both EPUBs build. This is source/build proof, not a fresh visual-layout review or verification of Gumroad-delivered files. Original source and output files under C:\dev were not replaced.

Fourteen documentation/registry files were reconciled: current listing references, unposted launch links, CLI implementation status, prompt-parity limits, VS Code lineage/protocol conflicts and the local-only registry identity. Planning history was appended. Runtime code and the frozen manuscript were not changed. Prior bytes are preserved in [before-edits.zip](before-edits.zip); [final diff](review.diff) and [edited-file hashes](applied-edits.json) make this reviewable.

Scoped whitespace checks pass in the portfolio root and four edited TBV repositories. Portfolio planning checks report **zero errors, twelve existing warnings**; all **126 planning pointers resolve**. See [scoped check results](scoped-checks.json). Authenticated GitHub Actions inspection returned zero total workflow runs for all five TBV repositories. No hosted CI success is established; see [hosted CI evidence](hosted-ci.json). Successful local builds do not establish release closure; no CI badge or release gate was invented. Existing portfolio release blockers from the prior Governance Commons stage remain open.

## Recommended work order

1. Resolve the companion protocol from the two concrete inspected candidates. Retain the human approval boundary and decide state/ownership rules before combining histories or making the CLI/extension relationship canonical.
2. Repair the selected remote extension's compilation and bind panel decisions to the exact displayed session/gate, rejecting stale messages. Add regression coverage for replacement sessions/gates before enabling approval use.
3. Establish a shared effective-prompt contract for the CLI/book, then implement and validate Audit/Approve/Record state transitions. File-copy parity alone must not be the acceptance criterion.
4. Reconcile current storefront price, checkout and buyer-file evidence through authorized access; review launch copy against that evidence before posting. Keep historical sales claims dated.
5. Consider addendum/v1.1 adoption only as a separately scoped product decision. Preserve frozen v1.0 and distinguish draft instructions from current shipped content.

The next portfolio reconciliation remains **EdgeLab**, followed by Signal Radar, Cockpit, LASSO and other active repositories. Signal Radar remains the evidence-first event intelligence layer; EdgeLab remains the downstream market-edge research and validation lab. This TBV review introduces no trading strategy or execution feature.

No commit, push, publication, repository creation, remote rebinding or companion architecture adoption occurred.

Automatic browser approval review rejected opening Gumroad, reporting that access was denied. No alternative browser or subsequent raw fetch was used to bypass that rejection. Rendered price and checkout checks remain unverified; the listing metadata above was obtained before the rejection.

## 2026-10-06 — Owner-confirmed storefront status

Jesse confirmed the current Full Edition price is $9, checkout is available, and there have been no downloads yet. This is owner-confirmed evidence, separate from the earlier HTTP/title check. No sales count is inferred from the download count, and buyer-file contents have not been inspected. No live listing or launch post was changed.

The earlier browser denial remains historical. Current price and checkout are now owner-confirmed; independent rendered-browser and buyer-file checks were not performed.
