# eco-vscode reconciliation — 2026-10-06

The standalone editor preview is implemented, but editor adoption and distribution remain partial. Two reproduced defects were repaired in a bounded ten-file change. No extension was installed or published, and no provider mutation or live agent call was performed.

## Canonical source and lineage

`C:\dev\eco-vscode` main 4def3f6900dbd75188434fdaecb77dc016ee4d03 matches the inspected private jj-ervin/eco-vscode remote. Its manifest is version 0.5.0, publisher eco, minimum VS Code 1.85. No Actions runs, releases, tags or open PRs were found in the inspected snapshot. There is no extension CI/test workflow.

`C:\dev\eco\surfaces\vscode\eco-vs` belongs to the eco repository. Its source manifest is 0.4.0; historical local VSIX files are 0.1/0.2/0.3. These are separate lineage evidence, not installed-editor proof. Each manifest exposes eight commands; only eco.openCockpit shares an ID. Seven embedded-only palette commands remain a convergence question, not automatically approved migration work. Some underlying HELM/PASS capabilities already exist in the shared Cockpit web surface.

## Confirmed discrepancies and corrections

- Existing hard-mode pre-commit hooks could be overwritten. Exclusive creation now preserves an existing hook, including concurrent creation. The generated hook remains a no-op; this is not full validation enforcement.
- A standalone build silently fell back to legacy web assets whose URI placeholders and bootstrap contract do not match the current host. Builds now require complete canonical sibling Cockpit assets and fail before erasing prior output when those inputs are absent or incomplete.
- VS Code type definitions exceeded the advertised engine minimum and blocked the packaging tool. Types now match 1.85.0; this does not establish actual minimum-host activation compatibility.
- Internal PLAY logs and tests were included in package candidates. Packaging exclusions now remove them.
- README and plans now describe all eight commands, real Python bridge configuration, workspace limits, embedded lineage and release gates. DEV-PATH history was preserved byte-for-byte as a prefix; AGENTS remained unchanged.

## Validation and practical limits

Six regression tests pass. Old code first failed one hook test and two asset tests, demonstrating the defects independently of the fixes. The corrected paired-checkout build passes; a missing canonical checkout fails deliberately. A mocked panel exercising the compiled host resolves all resource tokens and injects its bootstrap. This is not an actual editor activation or visual usability check.

The compiled TypeScript client successfully performed read-only health/state/run-list calls to the real Python bridge in a disposable fixture; absent Python fails explicitly. No runtime agent was configured and no provider action was invoked. The default bridge timeout is ten seconds, so long-running provider workflows require explicit timeout/cancellation review. Dedicated Marlin install uses a native modal; generic provider approval uses the web relay. Neither mutation path was validated by this audit.

An audit-only VSIX was built with explicit missing-license/repository and link-rewrite exceptions. All 26 packaged web assets match the current live Cockpit input hashes. That input includes pre-existing Cockpit working edits, so it is not an immutable release dependency. Internal PLAY, tests and planning files are absent from the package. The audit artifact remains in work/ and is not offered as a release installer.

A read-only Marketplace query returned no result for exact ID eco.eco-vscode. Default local VS Code extension metadata contains neither eco.eco-vscode nor eco.eco-vs. Other profiles, remote hosts, enablement and publisher entitlement were not inspected. These observations do not establish universal absence.

## Remaining reconciliation actions

1. Record or pin the canonical Cockpit bundle revision/digest and establish repository/license metadata and publisher identity.
2. Add editor CI, minimum/current-host activation and visual checks, then package without audit exceptions and verify a clean install.
3. Resolve first-workspace-folder/.eco detection versus flat governance roots and multiple roots; extension warnings cover five metadata families and six SKU values, not full portable.eco conformance. eco.fix is still an informational placeholder.
4. Decide embedded palette convergence and long-operation approval/timeout behavior from current requirements before implementing historical ideas.

CANONICAL: standalone preview source and shared Cockpit boundary. IMPLEMENTED: command wiring, Python transport and bounded repairs. PARTIAL: release/adoption, full validation, layout/SKU coverage and embedded convergence. STALE: old README and fallback assumptions, now corrected. SUPERSEDED: incompatible legacy Cockpit payload for this host, retained as historical source. No chat-only feature was promoted into implementation.

Next portfolio reconciliation: Niji and its adjacent provider/editor boundaries. Signal Radar remains evidence-first event intelligence; EdgeLab remains the downstream market-edge research and validation lab.

## Governance closeout

Nine portfolio Level1 validators pass. Existing Level4 CXP4/canonical GC5/duplicate GC10 gates remain open. Final PLAY validation accepts 28 records. No portfolio release clearance is claimed.
