# eco and Marlin reconciliation — 2026-10-06

Both main checkouts were clean and matched GitHub: eco f29c0963faa11dc06df41b45b6e51564598f70ce and Marlin cb137c77026b20d5c08a676eaaaa7a90fb3bde1a. This reconciliation corrects documentation/evidence; it does not migrate runtimes, revive old feature queues, publish packages or merge branches.

## Canonical boundaries

- eco owns governed runtime/execution and deterministic orchestration with contracted probabilistic modules. The standalone LASSO portal and eco's internal LASSO runtime namespace are distinct project surfaces with different local PASS namespaces; similarly named records must not be conflated.
- C:/dev/.eco is a separate portable governance-package root; eco's ignored internal .eco output is runtime/package material. Neither is eco's product roadmap.
- Marlin owns install/scaffold/audit/package/workspace authority. Cockpit owns presentation and approval UX; trusted hosts/provider paths carry explicit confirmed mutation intents to Marlin. Discovery metadata alone is not permission.
- Signal Radar remains evidence-first event intelligence; EdgeLab remains downstream market-edge research/validation. Neither is absorbed into this runtime/install reconciliation.

## Remote state and recovery

| Identity | Verified state | Recovery action |
| --- | --- | --- |
| jj-ervin/eco | Four branches; three others have zero ahead commits (77,28,1 behind); no open PR, releases or tags. | Retain historical branches; no missing branch implementation found. |
| jj-ervin/marlin | Two branches; PR #1 is one ahead/67 behind, eight old Niji-provider files. No Actions runs, releases or tags. | Preserve; assess supersession instead of blindly merging older v1.1 work. Main has later corrective Niji1.1.1, provider attestation and resolver behavior. |
| jj-ervin/marlin-registry | Current main963a07df; actual index/manifests plus inherited DCP template shell. | Keep registry contract distinct from the DCP-flavored README. No registry files changed. |
| jj-ervin/eco-vscode | Companion main4def3f69 and package0.5.0; no Actions runs/releases/tags. | Its source version is separate from eco's older embedded0.3.0 VSIX, which exists locally. No installed-extension validation occurred. |

[eco current-head CI](https://github.com/jj-ervin/eco/actions/runs/31873714289) is successful but only checks Markdown table format. It does not run runtime tests. [Registry current-head CI](https://github.com/jj-ervin/marlin-registry/actions/runs/32599064531) succeeds, closing Marlin's stale instruction to repair that workflow. Registry submission validation is a separate PR-path workflow, not a refreshed package-artifact proof.

[Marlin PR #1](https://github.com/jj-ervin/marlin/pull/1) remains open. Every old tip file differs from newer main; that alone does not establish missing functionality. Main's current schemas/installer/provider tests cover provider runtime/attestation, and the corrective Niji1.1.1 history supersedes the old v1.1 intent. No close/merge or branch deletion was performed. Detailed tip-to-main diffs are saved for residual review.

## Classification and documentation discrepancies

| Work | Classification | Resolution |
| --- | --- | --- |
| eco DEV-PATH/DEV-PLAN authority pair | CANONICAL | Preserved. DEV-TRACKS explicitly supersedes missing TRACKS; current references corrected. |
| eco v3 migration baseline | HISTORICAL | Broken R:/ machine links now point to archive/lineage baseline; not promoted into fresh roadmap authority. |
| RT.01 metadata foundations | IMPLEMENTED | Release summary no longer calls them queued; RT.10 remains future. |
| SPARK.00 | ACCEPTED SPEC | August9 acceptance reconciled; not proof of live DGX adapter/model/hardware deployment. |
| Old eco trailing handshake | STALE | Three supposedly active tasks have completed earlier rows; dated correction preserves history. Old411/413 result is not the current baseline. |
| Old local hold/freeze prose | PARTIALLY SUPERSEDED | Accepted LASSO.01/NEHI.01 and implementation history exist. No blanket refactor permission inferred; runtime untouched. |
| SEC.00/RT.10/standards proof/hardware deployment | PARTIAL / planned | Retain gates; historical percentages/spec tests do not establish current operational readiness. |
| Marlin four lanes and Doctor/provider surfaces | IMPLEMENTED / residual gaps | Full source suite/build pass; update/remove GUI and full workspace panel remain scoped residual work. No new lane work opened. |
| Marlin bootstrap/package launcher | PARTIAL release/adoption | Generic MarlinSetup August5 stranger/architecture proof and later package-specific warm proof are different scopes. Package-launcher cold/warm-stale/repair proof remains incomplete. |
| Marlin capabilities “Cockpit read-only” | STALE | Living description corrected to existing confirmed provider mutations; no new machine contract/privilege added. |
| Marlin bootstrap links | STALE / broken | AGENTS and CLAUDE used ../../governance-commons, resolving outside C:/dev. Corrected to ../governance-commons. |
| Public @marlin/cli quickstart | UNAVAILABLE | npm metadata E404; README now starts from verified source build. No assertion that unavailable means definitely never published. |
| Registry repair task | STALE / resolved | Current-head governance run green. |
| Chat-only completeness | UNKNOWN | Repo-captured history and evidence audited; a complete eco/Marlin Classic corpus was not retrieved. Old brainstorms were not adopted. |

## Fresh test and build evidence

Marlin was tested in an isolated HEAD export with npm ci --ignore-scripts. Workspace build, TypeScript checks and setup syntax checks passed. Full suite: core25, package manager86, DCP43, DXP268, CLI20, setup74 = **516 passed**. Three opt-in real-artifact tests were skipped (one Sealdex and two real Marlin provider/bootstrap checks). Prior recorded local EPERM/process-cleanup failures did not reproduce in this clean proof; their cause is not established by that result.

No Electron/NSIS binary was rebuilt or installed. No target package was downloaded/installed, no registry release was published, and no credential value was printed. Warm-path historical proof is not a fresh cold install or ordinary-user adoption test. Recorded bridge build-freshness and private-download cleanup problems remain follow-ups rather than newly verified repairs.

Eco's isolated source run first stopped at six NumPy import errors. The declared pyproject dependency list is empty and there is no checked-in test dependency profile. After installing needed dependencies in the disposable venv, complete tests/: **1080 passed, four failed, 196 subtests passed**. Markdown baseline and edited-file lint pass.

The four failures are root-discovery/fixture-layout dependent. A plain HEAD export lacks a .git marker; current discovery walks upward and finds the legacy C:/dev/docs/passes path, selecting C:/. Two fixer fixtures then scan beyond their intended temporary root, while runtime cases0042.04/.05 cannot resolve PASS records there. Both records exist and resolve with explicit live eco root. All four original tests pass in a targeted proof with an empty repository-directory marker and independent boundaries on the two temporary rename fixtures. These markers created no Git repository/branch and patched no runtime/source test; the fixture plugin is saved as proof-only work. **The full default suite is not claimed green**, and this does not establish four production runtime defects.

Seven eco and seven Marlin documentation files changed; runtime/tests/provider/schema/manifests/hold-sensitive files remained unchanged. Protected DEV-PATH prefixes and backup CRC pass. Dependencies/build outputs were confined to work/ exports. New source test dependencies were not committed into a speculative packaging fix.

## Recommended order

1. Fix eco test-root isolation and declare a reproducible test dependency profile; then add runtime CI with explicit fixtures. Preserve governed validation, not bypass PASS checks to make tests green.
2. Review the existing uncommitted portfolio corrections together. Decide whether PR #1 has any residual change; close/rebase only under an explicit next action.
3. Prove the per-package launcher's cold path and warm-stale/repair behavior using disposable install homes. Separately tie Cockpit bridge freshness to packaged-shell builds and reproduce private-download cleanup failures.
4. Implement Marlin's remaining update/remove or workspace UI only under their existing scoped provider work; keep execution authority in Marlin.
5. Reconcile eco-edge and its standards/hardware proof chain next, then companion .eco/DevXToolkit and the remaining active inventory. Do not auto-activate DGX/hardware, SEC.00 or RT.10 brainstorms.

Technical package/provider proof and a one-click, runnable end-user install remain distinct. This review is source/evidence reconciliation, not public release authorization.

## Governance closeout

All nine Level1 validators pass. Full Level4 retains existing CXP4/canonicalGC5/preserved duplicateGC10 release blockers. Final PLAY validation accepts 24 records with zero errors/warnings. Source/evidence reconciliation complete; release admission and eco default full-suite readiness remain distinct gaps. Timing is unmeasured (null timestamps/zero schema durations). Next portfolio task: eco-edge reconciliation.
