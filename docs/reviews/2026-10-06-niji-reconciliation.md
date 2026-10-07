# Niji reconciliation — 2026-10-06

Niji is an implemented standalone deterministic palette application with a published private Windows release and newer committed development. Recovery requires separating those states, not restarting the project or treating later brainstorms as approved features. Thirteen scoped documentation/comment/handoff files were updated; Python behavior, package version, stable API and capability declarations were preserved.

## Local versus GitHub

`C:\dev\niji` is an independent Git root. Its initially clean main and GitHub jj-ervin/niji main both point to `951467e5521d20b729fb8ffba862e9d273ec44c8`. There is one remote branch and no open issues/PRs in the inspected snapshot. The repository is private. Three Windows releases exist: v1.0.0, v1.1.0 and v1.1.1.

Current-head Actions is green, but it validates only the capability declaration with Governance Commons SDK 0.2.0. It does not run the application tests, build the GUI/provider, or establish release readiness. Older failed contract CI was corrected in subsequent commits; it is not a current failure.

## Release and artifact discrepancies

The canonical v1.1.1 release tag identifies `286eed835b4ccef2995882a189ba978cb8418711`. Its published Windows ZIP digest is `035738ad50ccb25f1df216ad5bbdc94710b080babf7f146a177220d5fde2f423`. Local dist bytes match that digest. The archive contains LICENSE, LICENSE-COMMERCIAL, LICENSING.md, the desktop executable, the read-only provider executable and versioned provider manifest. Both executable PE headers identify x64. Marlin's local built-in and hosted-registry checkout manifests reference the same 1.1.1 digest; ARM64 resolves to that x64 artifact under emulation, not a native build. This audit does not recertify the prior installer/attestation/rollback or emulation smoke.

The local v1.0.0 ZIP also matches its published digest. The local v1.1.0 ZIP does **not** match the published v1.1.0 digest. It includes licensing files, but those local contents cannot prove the published older artifact's contents. The mismatching local ZIP was preserved and classified as noncanonical. No historical asset was overwritten, deleted or retagged.

Current main differs from the v1.1.1 release tag in 53 files while pyproject/provider metadata still says 1.1.1. The current-source wheel is therefore an audit build of post-release development, not the immutable published Windows release. Version/API/provider alignment must be deliberate before another publication.

## Canonical intent and implemented work

DEV-PLAN owns execution; DEV-PATH owns origin/phase decisions; DEV-RELEASE owns release conditions; DEV-TRACKS owns parallel workstreams; DOCS identifies retired planning references. `.agents/handshake.json` and the latest handoff are local operating context. Historical niji_* planning files and NIJI_TASKS remain preserved, superseded references.

The deterministic color engine, ramps, contrast evaluation, SQLite palette/library/preset persistence, JSON/CSS exports and stable UI-free `niji.api` 1.0 are implemented. The default reference library is now 216 web-safe colors with CSS naming; the 136-color Atlas remains an archived mode. New committed development includes palette assets/revisions, metadata search, backup/restore services, DTCG export, PIK/theme/snippet exports, image conversion presets, and the CSS Preview tab.

The stable Python API intentionally does not promote the newer exporters/services. Asset management and backup/restore lack desktop controls; DTCG is not exposed in the desktop UI. The Preview QWebEngine widget is distinct from the queued URL-import browser. Its theme export produces JSON; it does not constitute a shipped VS Code extension/theme marketplace product.

The Niji stdio provider exposes one read-only palette preview. Cockpit's adapter consumes the Niji integration facade and keeps save/export ownership in Niji. Niji core has no Cockpit import or live AI dependency. Optional publish hooks do not establish a deployed eco publication path. No new cross-project capability or execution authority was declared.

## Verification

- 213 tests passed against an exact HEAD export using existing Niji dependencies and disposable test databases; the live source/data store was not used as a fixture.
- Wheel and sdist build succeeded in a disposable build environment. Wheel Python payload matches the exported source. This is not a fresh installation of every third-party dependency.
- From the unpacked wheel, stable API/integration imports stayed UI-free; a real in-process provider preview succeeded and an undeclared write command was rejected. This is source-provider proof, not execution of the published provider EXE or an installed Cockpit path.
- An offscreen wheel window constructed Generate, Library and Preview tabs against a disposable database, using QWebEngineView. It is not visual usability or stranger-installation proof.
- The capability declaration passes the SDK validator. A generated DTCG fixture passes the fetched [official 2025.10 schema](https://www.designtokens.org/schemas/2025.10/format.json); full external-consumer interoperability remains unverified. The [DTCG report](https://www.designtokens.org/TR/2025.10/format/) is a stable Community Group specification, not a W3C Standard.
- Stale "stub" comments were corrected without altering Python behavior (AST comparison after stripping module docstrings). README source instructions and development/release distinction were corrected. Planning history prefixes, bootstrap routes, handshake and old handoff records were preserved; a new immutable handoff and current pointer were written.

## Classification and recovery order

| Classification | Evidence-backed work |
| --- | --- |
| CANONICAL | Standalone deterministic domain, SQLite boundaries, stable API1.0, DEV-DOCS authority map, immutable release tag/digest |
| IMPLEMENTED | Published1.1.1 technical payload; committed asset/revision/search/backup/export/Preview code; 213 tests |
| PARTIAL | Development/release metadata separation, application CI, asset/backup/DTCG UI, API promotion, clean-user adoption and eco publication |
| STALE | Stub descriptions, Track E's older next-adapter wording, incomplete README source instructions; corrected or annotated |
| SUPERSEDED | Legacy planning files and published1.1.0 release by corrective1.1.1; preserved |
| CHAT-ONLY | No additional unrecorded Classic idea could be proven from available evidence. Studio/Packs/apparel/marketplace ideas are already documented as deferred concepts, not implemented features. |

Recommended Niji work: first clarify a development/version and application-CI contract; then select the existing bounded AssetTarget/TemplateRequirement vocabulary candidate. Keep UI/API promotion and packaging as explicit later slices. AI, Studio/Packs/apparel, marketplace and broader Cockpit coupling are not implied tasks. Publication requires clean packaging, access/distribution review and actual installation/GUI/rollback evidence.

Next portfolio reconciliation: eco-slate and eco-slate-www together, including their distinct product/site roles and the already identified stale nested .eco checkout. Then eOS and remaining active repositories. Signal Radar remains evidence-first event intelligence; EdgeLab remains downstream market-edge research and validation.

## Governance closeout

All nine Level1 validators pass. Existing Level4 release gates remain open in CXP (4), canonical GC (5), and duplicate GC docs (10). Final PLAY validation accepts 29 records with zero errors/warnings. Reconciliation complete; release/adoption and deferred product work remain open.
