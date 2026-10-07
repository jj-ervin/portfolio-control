# Elan reconciliation — 2026-10-06

Elan's language/runtime ambition is design direction. Its standalone executable implementation is currently a PowerShell validator for a draft DevXToolkit semantic-ID binding. The pinned binding works, but does not establish compatibility with today's upstream v1 source or the independent v2 catalog. Four documentation files clarify actual capabilities, upstream version boundaries and task-history drift; no grammar/binding, parser, runtime or authority was changed.

## Local, GitHub and artifacts

Initially clean local main matches private [jj-ervin/elan](https://github.com/jj-ervin/elan) main at `2bee34ab91ae61822526b4e17fc5fdc3a54cf6d5`. GitHub reports one branch, no tags/releases/open issues/open PRs and no Actions runs. There is no application CI workflow or package manifest. Core/adapters/interfaces/modules remain placeholders; the only executable standalone artifact is `src/tests/Test-DevXToolkitGrammarBinding.ps1`.

The repository includes two complete JSON snapshots: grammar1.0.0 with20 command records and grammar1.1.0 with24, plus draft binding0.1.0-draft and its specification. Generate maps19 stable IDs; inspect maps2; run/build/validate are planned empty families. The catalog includes additional records not actively bound. Active family means catalog binding exists, not that an Elan parser or operation executor exists.

## Authority and distinct namespaces

`C:/dev/eco/docs/specifications/elan-language-spec.md` remains current language authority until a separate accepted cluster/package scope exists. Its related metadata/runtime/Cockpit/eos specification references were read/hashed and remain unchanged. The standalone draft establishes semantic-ID and grammar-version binding before parser work; it neither replaces DevXToolkit's command authority nor gives Elan execution/commit authority.

ARCHE owns environment semantics; Cockpit would inspect Elan plans; eco/NEHI and their runtime consumers retain operational/governance/admission authority. Those relationships are intended contracts, not current consumer integration. README now labels plans/diagnostics/rendering/admission as intended where implementation evidence is absent. Signal Radar remains evidence-first event intelligence and EdgeLab remains downstream market-edge research/validation; no evidence boundary changes here.

`eco/src/elan` contains real HELM mode normalization/history, Cockpit config synchronization, LENS/CIL context synchronization and hook support. This is useful existing implementation lineage, not a lexer/parser/evaluator for `.elan`. Its `eos.cil_contract` and `eos.lens_runtime` imports refer to the separate `eco/src/eos` Python namespace, whose files exist. They do not refer to the standalone eOS CLI and do not establish an Elan compiled-package admission path. No such language package contract was found in the inspected standalone source.

## Binding validation and upstream compatibility

The real checked-in validator passes the pinned1.1.0 snapshot. Six counterfactual cases are rejected: mismatched grammar version, unknown bound semantic ID, empty active family, missing family, duplicate family and duplicate command. All malformed candidates were disposable work files. The validator/source map/snapshots are unchanged. This proves bounded catalog consistency, not parsing, argument execution, deterministic plan generation, trace completeness or runtime governance.

The cached published DevXToolkit1.6.0 artifact retained by the earlier portfolio audit exports grammar1.1.0,24 records. Its freshly emitted grammar is JSON-equivalent to Elan's checked-in snapshot and passes the same binding. The artifact was reused from that prior verified cache rather than re-downloaded here; no new public-package provenance or target-platform install proof is inferred from this compatibility probe.

Current local DevXToolkit v1 source declares1.7.0 and exports13 functions. Importing that module and querying `Show-DevGrammar` fails because the command is no longer exported/present; it cannot regenerate this catalog. The initial audit command did not stop on that PowerShell missing-command error; the corrected probe uses stop-on-error and captures it explicitly. This is an upstream source compatibility gap, not a failing pinned fixture.

Independent DevXToolkit v2 emits grammar2.1.0,12 records. The current Elan binding rejects it with grammar-version and missing-ID diagnostics. Full record/ID differences are saved in upstream-compatibility.json. v2 was not silently substituted and the historical snapshot was not overwritten. Before parser work, choose whether Elan explicitly consumes published legacy v1, a new upstream catalog contract or a separately versioned v2 binding. Each needs an explicit provider/compatibility scope.

## Planning and completeness

The old “current snapshot” phrase means the current input of draft binding0.1, not current upstream source. Dated appendices make that distinction. No `.elan` source examples, lexer/parser/evaluator, machine plan/diagnostic compiler, Cockpit inspector contract or eos-admissible package contract exist in this standalone implementation. ELAN.4 is draft implemented; the language milestones remain partial/planned.

Several historical IDs name different tasks in the two planning files: ELAN-P0-02 is spec preservation versus root registry pointer repair; ELAN-P1-02 is package shape versus parser output contracts; ELAN-P1-03 is diagnostics versus inspector handoff. Root projects.yaml already points to Elan's DEV-PLAN/DEV-PATH. ELAN-P0-03's dated binding completion follows an older planned table. Appendices disambiguate deliverables and chronology without rewriting or renumbering history.

The three original append-only planning/binding documents remain exact byte prefixes. README consumer statements are corrected. AGENTS, governing eco sources, binding JSON, grammar snapshots and validator are unchanged; whitespace checks pass. No unrelated source or user environment was mutated by the read-only module probes.

## Classification and recovery order

| Class | Evidence |
| --- | --- |
| CANONICAL | Governing eco language specification, standalone root planning, DevXToolkit command ownership |
| IMPLEMENTED | Draft semantic-ID family binding, snapshots, real catalog validator and positive/negative checks |
| PARTIAL | Parser/evaluator, plans/diagnostics, consumer/admission contracts, CI/package, current upstream compatibility |
| STALE | Current-upstream implication and literal implemented consumer claims; clarified in documentation |
| SUPERSEDED | Historical1.0 catalog as lineage;1.1 remains valid pinned legacy input, not automatically obsolete |
| CHAT-ONLY | No additional Classic-only shipped capability established; language/runtime ambitions remain design direction |

Recovery order: first choose a versioned upstream provider/catalog contract; then define one normalized-call and diagnostic output; then scope a minimal parser/consumer proof with visible side effects and existing authority gates. Do not implement the whole language or change DevXToolkit merely to make a historical binding look current.

The canonical portfolio inventory remains74 entries. Next reconciliation: agent-project-orchestrator, comparing the local governancecommons checkout with the separate remote jj-ervin repository before deciding their relationship.

## Governance closeout

Nine Level1 checks pass; existing Level4 CXP4/canonicalGC5/duplicateGC10 gates remain. PLAY accepts 34 records with zero errors/warnings. No release readiness is claimed.
