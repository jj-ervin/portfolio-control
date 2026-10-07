# CXP reconciliation — 2026-10-06

CXP is an implemented basketball coaching prototype, not an empty scaffold. Its editor, frame actor playback, configurable surfaces, local play library and PDF export exist. Fresh 35-test, analysis and web-build proofs pass in an isolated copy. Six documentation/description files now align claims with current evidence; no product feature, release criterion or public deployment was changed.

## Local, GitHub and version state

Initially clean `C:/dev/cxp` is an independent Git root and matches private [jj-ervin/cxp](https://github.com/jj-ervin/cxp) main at b7ae78aa668e243a435c45dc9c3dcdda19caa5fe. GitHub reports one branch, no tags/releases/open issues/open PRs and no Actions runs. There is no application CI workflow. Six Flutter platform targets are scaffolded; that does not establish six released/verified platforms.

pubspec declares 1.0.0+1 with publish_to:none, while DEV-PLAN calls the product pre-v0.1. This is build metadata versus product-release naming drift, not evidence of a shipped 1.0 application. No version decision/bump or release target was silently chosen. README's “no implementation yet” and package description were stale; current implementation is now explicit.

## Implemented behavior

Main opens the basketball editor. Source and tests show 5v5 actor manipulation, route tools and frame sequencing, endpoint advancement into a new frame, editor ball assignment/pass transfer, configurable half/full court surfaces and persistent configuration. Court presets/surface dimensions are prototype data, not newly certified sport-rule compliance.

Playback interpolates actor positions using the saved court configuration. It does not animate drawn paths or carry editor ball ownership through playback; CXP.23 is still open. Local persistence uses a SharedPreferences JSON list through PlayRepository, with save/load/delete and overwrite-by-ID behavior. It has no play revision history, server sync, tenant/account isolation, search/tag/folder organization or production backend guarantee.

PDF export generates a page per frame and is wired to Printing.layoutPdf. Tests validate generated PDF header/structural output and the export button's presence, not an actual browser/native print-dialog operation. PDF path styling intentionally lacks editor parity; PNG/SVG exports remain deferred. Print-safe/vector-quality admission is not certified by byte tests alone.

Org/team/player/practice onboarding, Core authorization/SKU enforcement, cloud/AI services and future game/stat operations remain architecture/queued direction. Pricing/inheritance documents are not enforced product entitlements. No real coach/team/youth data, existing browser preferences or production records were read or changed in this audit. Signal Radar remains evidence-first event intelligence and EdgeLab downstream market-edge research/validation; CXP does not alter those boundaries.

## Fresh proof and environment limits

An exact-HEAD export uses installed Flutter 3.41.6/Dart 3.11.4 with the committed lock. Initial flutter pub get --enforce-lockfile resolved dependencies but returned failure because native Windows plugin setup requires unavailable symlink support. Windows platform source was moved to a preserved sibling directory inside the disposable proof workspace so the web proof could resolve without changing system settings. The live repository's Windows target was untouched; no Developer Mode, SDK upgrade or native install occurred.

Locked dependency resolution then succeeds and the lock remains equivalent to the committed file. 35 Flutter tests pass; analysis reports no issues; Flutter web build succeeds and its artifact hashes are recorded. The initial test loader spent time compiling before proceeding normally. These checks run against original application code; only documentation/package description was changed locally. No dependency upgrade was performed; newer available versions do not by themselves establish a defect.

The suite uses fake repositories for persistence interaction tests, so it does not establish real-browser storage durability or concurrency. There was no manual browser workflow, PDF visual/physical print review, real coach retest, native target build/install or real-device release/profile benchmark. Successful compilation/widget tests remain distinct from those adoption/performance gates.

## Release and history reconciliation

DEV-RELEASE contains four draft criteria: five-minute org/team/practice flow, editor usability, tag/formation/family search, and print-safe vector PDF. All four remain unchecked. Some target future modules beyond the current prototype; this audit did not rewrite scope or clear criteria. The portfolio Level4 CXP release gate therefore remains open.

DEV-PLAN already names coach retest as the next step rather than more feature work. The recorded earlier coach feedback remains historical planning evidence; no new feedback or acceptance was invented. Real-device performance, playback ball marker, search and export fidelity remain open as scoped. Source/module security and SKU architecture remain direction pending Core implementation.

README, AGENTS release-posture wording and pubspec description now reflect prototype reality. DEV-PLAN/DEV-PATH/DEV-RELEASE get dated appendices; all originals remain exact byte prefixes. Existing admission boxes and application/lock files remain unchanged; whitespace/review checks pass. Six local files are pending, without commits/push/deployment.

## Classification and recovery order

| Class | Evidence |
| --- | --- |
| CANONICAL | Current basketball prototype source and root planning/release posture |
| IMPLEMENTED | Editor/routes/frame actor playback/court config/local play library/PDF export; 35 tests |
| PARTIAL | Coach retest, real-device perf, print review/search/PNG/SVG/playback ball, backend/Core/SKU, packaging/CI/release |
| STALE | Empty-scaffold README/package/bootstrap implications; now corrected |
| SUPERSEDED | Empty app-shell phase as current state; history retained |
| CHAT-ONLY | Game/stat operations, AI/cloud/business architecture ideas not promoted into implementation |

Recovery order: obtain coach retest; choose one supported target and concrete release/version acceptance; prove storage/print/performance/adoption on that target; then scope the open usability/features in priority order. Architecture breadth and pricing ideas are not authorization to build ahead of that feedback. Add locked test/analysis/build CI when the supported scope is concrete.

The canonical inventory remains 74 entries. Next portfolio reconciliation: Kinjuu.

## Governance closeout

Nine Level1 checks pass; existing Level4 CXP4/canonicalGC5/duplicateGC10 gates remain. PLAY accepts 37 records with zero errors/warnings. No release readiness is claimed.
