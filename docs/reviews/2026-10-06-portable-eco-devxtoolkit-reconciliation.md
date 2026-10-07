# Portable .eco and DevXToolkit reconciliation

Evidence date: 2026-10-06. Reconciliation is complete; publication, compatibility, freeze and stranger-adoption gaps remain open. Four exact HEAD exports and a separate downloaded public package supplied bounded local proofs. Fourteen documentation changes are uncommitted; runtime, versions, workflows, hashes, capability contracts and protected phase history were preserved.

## Canonical inventory and boundaries

| Workspace | Current state | Classification |
| --- | --- | --- |
| C:/dev/.eco → jj-ervin/.eco | main de1140c4 matches GitHub; portable governance/runtime workspace; global roadmap points to C:/dev/eco | CANONICAL source, IMPLEMENTED runtime/stub, PARTIAL release readiness |
| C:/dev/eco-slate-www/.eco | main 36d6429a; clean own Git checkout; four commits behind canonical | STALE duplicate checkout; preserved |
| C:/dev/dxp-org/devxtoolkit-v1-x | main a9e1310e matches GitHub; source1.7.0,13 exports; published1.6.0,24 functions | CANONICAL source and published artifact separately; PARTIAL compatibility/release admission |
| C:/dev/dxp-org/devxtoolkit-v2-x | main3411aa06 matches GitHub; source2.1.0,12 functions/eight aliases | IMPLEMENTED independent semantic/grammar/status module; unpublished |
| C:/dev/dxp-org/devxtoolkit-v1-x-registry | main30a9541f matches GitHub; public pin1.6.0 | CANONICAL public support/distribution index |
| C:/dev/dxp-org/devx-control-plane | main4bb0391d matches GitHub; portable DCP template | IMPLEMENTED init; PARTIAL portable validation |
| jj-ervin/devx-control-plane | remote-only main6401f1f6;37 tree entries, legacy DEVPLAN/DEVPATH; active dxp-org tree73 entries | STALE older copy; cross-owner ancestry not established |
| C:/dev/dxp-org/devx-toolkit | TypeScript eco-integration prototype0.1.0; Git root resolves to C:/dev, no independent repository; files not tracked by parent | LOCAL-ONLY, PARTIAL, build broken; distinct from PowerShell modules |

Portable .eco holds existing governance/runtime tooling. The eco root owns its global roadmap. DevXToolkit supplies developer workflow commands; DCP supplies portfolio registry/operations, while Governance Commons owns portable standards. These layers do not become a market research lab: Signal Radar remains evidence-first event intelligence and EdgeLab remains downstream market-edge research/validation.

All actual local repository roots above began clean. No commits, branches, worktrees, pushes, tags, merges, publication, device access, live external agent execution, or credential changes occurred.

## Portable .eco proof and discrepancies

- Dependency-equipped isolated export:69 pytest tests pass (one dependency deprecation warning). Tests exercise kernel/routing/lifecycle and in-process FastAPI endpoints; agent registration refers to simulated runtime state, not an external model call.
- CI's unittest-discovery command runs11 tests and passes in the dependency-equipped export. It does not run the full69 pytest suite. The tracked workflow installs only pip, so this successful local reproduction does not establish that CI installs runtime dependencies correctly. Trigger paths omit top-level runtime/tools/tests changes. Twelve remote runs were reported; recent inspected runs failed at older heads, with no current-head run.
- New stub scaffold succeeds and its generated validator exits0 with declared-rule warnings. Stub success explicitly downgrades enforcement; it is not full-mode conformance.
- Full validator exits1: governance state hash mismatch, missing eco-spark SKU manifest, and a related inheritance warning. Kernel health observations pass within that validator despite those failures.
- The distinct frozen v1.0 validator exits1. Stored frozen hash differs from both exact-export and read-only live-checkout computation. The separate root runtime-release hash also differs in the live checkout. Byte/line-ending and pre-existing generated-file differences affect computed values, so the report records each computation separately and does not invent a drift cause or repair attestation by regenerating hashes.
- README's stable/full-enforcement list, hard-coded old VSIX example, and mixed version signals are historical assertions. The current editor source is eco-vscode0.5.0, not proof of an available eco-vs0.3.0 installer.
- Nested eco-slate-www/.eco is four commits behind. Syncing it is a separate owner/adoption decision; no copy was overwritten.

Runtime implementation is supported by fresh tests. A certified freeze, complete enforcement inventory, current editor installer and live deployment are not established.

## DevXToolkit source versus distribution

PowerShell Gallery currently lists [DevXToolkit1.6.0](https://www.powershellgallery.com/packages/DevXToolkit/1.6.0). The downloaded nupkg imports in a fresh process and exports24 functions. Its URL/size/SHA256 are saved in gallery-artifact.json; this verifies the retrieved public artifact, not independent signature/attestation validation. The public registry correctly remains pinned1.6.0 and was not advanced to an unpublished version.

Source v1.7.0 independently passes31 Pester tests,89.49% coverage and zero analyzer findings with the declared tool versions. Source has13 exported functions. It preserves the deprecated Invoke-DevCleanup failure-only command and placeholder environment scaffolding; these are not functioning cleanup or virtual-environment creation.

Source v2.1.0 independently passes46 Pester tests, with12 exported functions and eight aliases including Write-DevStatus. The earlier11-function count describes2.0 before output styling. It owns migrated grammar/filesystem/language/introspection code, runs independently of v1 and does not wrap all published v1 commands. Scaffold-only governance instructions and the old facade compatibility matrix are SUPERSEDED history. No new architecture was invented.

V1's current-head test workflow succeeds in the inspected remote window; several other green runs are dependency updates, not extra release/test proofs. V2 has no Actions runs, releases, package-round-trip or public distribution proof. Its manifest points to a v2 registry URL that returns404 with the current authenticated account: the audit cannot establish an accessible public registry, and404 alone cannot distinguish absence from access restrictions.

Open v1 PR1 is one commit ahead and39 behind current main, with no net compared file changes; PR6 is one ahead and19 behind, changing the attestation action. These are historical maintenance proposals, not approval to merge. Branch/PR evidence is saved; no PR state was changed.

Before any source1.7.0 publication, resolve removed published functions against CONTRIBUTING.md's within-major compatibility commitment. Tests prove the reduced surface works; they do not prove consumer migration is safe. The August19 scope decision is retained, but semver/transition approval remains a separate release decision. DEV-RELEASE also needs a current release gate entry before a future authorized publication.

## DCP portability and older copies

Exact template export dcp init -NoHook succeeds in a fresh disposable directory. Immediate composite validation exits1:11 of19 sample registry pointers are unresolved, and AGENTS.md is not copied. Planning validation passes; bootstrap reports a warning. This is a bounded Windows PS7 reproduction, not Mac/Linux or real-user adoption proof. The template expects registry customization and GC dependency wiring; it is not a self-contained clean validation experience.

The dxp-org template is the active mapped source. The older jj-ervin remote has legacy planning names and fewer files. Cross-owner GitHub comparison returned404, so ancestry/automatic mergeability is unverified; tree/doc differences are confirmed separately through API evidence. Neither copy is merged, renamed or archived.

The template's sample portfolio registry, C:/dev's operational registry and project plans are separate authorities. Statements that all kits shipped or consulting is live lack tagged release/CI/commercial adoption evidence in this inspection. No customer outcome is inferred from completed planning checkboxes.

## Local TypeScript prototype

C:/dev/dxp-org/devx-toolkit contains actual0.1.0 TypeScript eco scaffolding/import/upgrade/soft-validation code and package metadata. It has no own Git root; reporting parent C:/dev dirty state as prototype changes would be wrong. It is newly inventoried as a local workspace, not as a remote repository.

Disposable dependency install succeeds, but the declared build fails with TS1378 (top-level await versus ES2020 module setting) and TS7016 (missing js-yaml declarations). No source or dependency manifest was repaired. Soft warnings are intentional here; this prototype must not be presented as PowerShell DevXToolkit v1/v2 or full Python enforcement. Recovery should first decide whether it remains an intended product, belongs in an existing repo, or is historical exploratory work.

## Documentation corrections and recovery order

Fourteen files were changed across five repos: a bounded current-state notice in .eco README; v1 source-versus-published notice; new v2 README; three current-state pointers in local-agent-guidance; append-only reconciliation entries in three DEV-PLANs and three task logs; DCP adoption caveats; and registry README correction of the obsolete 'Marlin is not built' statement. Exact DevXToolkit installation through Marlin remains unverified. Protected governance context/agent policy files were retained; routing guidance now identifies their stale state explicitly.

1. **DRIVE: DevX distribution/compatibility recovery.** Resolve the v1 command-removal compatibility decision and v2 package/support destination, then define current release gates, test module coexistence and exact package artifacts. Publication requires explicit separate authorization.
2. **DRIVE: .eco freeze and enforcement recovery.** Identify byte-level freeze provenance and hash-policy ownership, classify the missing eco-spark reference, and repair dependency/test/trigger coverage through a reviewed release plan. Do not regenerate hashes merely to make checks green.
3. **DRIVE: DCP stranger-adoption recovery.** Decide sample versus empty registry initialization and dependency/bootstrap delivery, then verify a fresh independent portfolio. Preserve registry ownership boundaries and old remote history.
4. **RUN: TypeScript prototype disposition.** Establish ownership and intended scope before repairing or archiving. No blind absorption into PowerShell repos.
5. **Next portfolio reconciliation: time.loc and Governed Event Envelope.** Recheck current source, package, release and standards claims against their own evidence; do not reuse stale release assumptions.

No chat-only feature is promoted to implemented. Older .eco release descriptions, v2 facade designs and DCP commercial plans are classified only to the extent corroborated above. This phase did not require recovery of missing Classic conversation content to establish these repo-local contradictions.

## Evidence and limitations

remote-evidence.json records repository/branch/PR/release/run snapshots. local-before.json records actual roots, clean status, histories and tracked files. source-documents.txt preserves inspected planning/guidance text. before-edits.zip preserves prior changed documents. scoped-checks.json verifies archive integrity, append-only prefixes and documentation-only edits. Individual proofs retain successes and failures, including the initial pytest collection attempt made before dependency installation finished; the successful69-test result follows the completed dependency installation.

Inventory now contains74 repository/workspace rows; unrelated entries retain earlier snapshots. No protected phase history, standards, runtime/test code, workflow, version, registry package pin or stored hash was modified. Timing is unmeasured. Task completion must not be confused with release readiness.

## Governance closeout

All nine portfolio Level1 validators pass. Level4 retains the existing CXP4, canonical GC5 and preserved duplicate GC10 unchecked gates. Final PLAY validation accepts 26 records. Reconciliation complete; identified product release/adoption gaps remain explicitly open. Timing is unmeasured (null timestamps, zero schema durations). Next portfolio reconciliation: time.loc and Governed Event Envelope.
