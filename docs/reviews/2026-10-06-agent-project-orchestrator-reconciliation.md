# Agent Project Orchestrator reconciliation — 2026-10-06

The governed local checkout and personal GitHub repository are distinct implementations with different package identities. The governed source has substantially more runtime/contract coverage. Two real defects were reproduced and fixed locally: missing CLI module in the built wheel, and a task compiler still reading renamed Tracks.md. Three documentation files clarify release, runtime and repository boundaries. No remote history or configuration was changed.

## Repository identities and release evidence

`C:/dev/governance-commons/agent-project-orchestrator` is its own Git root, initially clean. It matches private [governancecommons/agent-project-orchestrator](https://github.com/governancecommons/agent-project-orchestrator) main at33e4e7bd8caa7c33b838620c9e0c34770b139007. Its package is agent-project-orchestrator1.1.0. GitHub has a v1.1.0 tag/release with no attached package assets. Main includes post-tag work such as matrix/roster recommendations while package metadata remains1.1.0. No unapproved version bump or next release target was invented.

Private [jj-ervin/agent-project-orchestrator](https://github.com/jj-ervin/agent-project-orchestrator) main is af7b7c7ea43286f679b6e7e8460da3a920fdac72, package project-orchestrator-agent1.0.0. It is remote-only in the inventory and has no release/tag in the inspected snapshot. Neither repository is marked as a GitHub fork. Exact-head archive comparison finds22 governed-only files,3 personal-only files,31 differing common files and4 identical initializer files. This establishes divergence, not shared commit ancestry, transfer authority or permission to merge/delete one. The personal DevPath-v1.0/DevPlan-v1.0/Tracks files preserve bootstrap lineage.

Each repository has one remote branch, no open issue/PR, no Actions runs and no application workflow. The personal source independently passes26 existing tests in its isolated archive. The governed exact-HEAD export passes113 tests with explicit copied roster/matrix fixtures; after the bounded repair it still passes113. No tests were run against live task queues or provider accounts.

The local ignored remote/ directory is a separate unborn Git shell with no HEAD/remotes. It is not a checkout of the personal repository. Ignored dist/log/odd-path artifacts were preserved; no live contents were copied or cleaned up.

## Current runtime implementation and limits

The governed source implements dossier/task compilation and schema loading, typed task queues, local AgentA/B/C dispatch, retry/backoff, time/tool-call/retry budgets, escalation, durable handoff evidence, OpenTelemetry/local audit events, canonical-plus-overlay roster loading, matrix-ranked recommendations and fixed-projection catalog queries. The existing source CLI roster-catalog query returns JSON in a copied-fixture workspace.

Those agents are local example handlers, with task-specific checks and no-op warnings for unknown handlers, not general hosted LLM adapters. Recommendation/catalog selection does not prove outbound provider execution. Historical DDR-APO-4 describes OS-store/env secret resolution and credential injection; this audit did not establish an implemented live secret-resolution path. No credential value, OS vault, local overlay or live provider request was accessed. Governance/roster/matrix inputs were metadata fixtures copied without modification.

APO executes local task orchestration; it does not replace Governance Commons contract authority or Agent Team Protocol fleet-root authority. Signal Radar remains evidence-first event intelligence and EdgeLab downstream market-edge research/validation. No user/provider action was delegated by this reconciliation.

## Reproduced repairs and proof

The original Hatch wheel explicitly packaged compiler/orchestrator/agents/models but omitted top-level cli.py while declaring orchestrate=cli:main. A clean environment using the wheel reproduces ModuleNotFoundError for cli. A force-include entry now packages cli.py. Candidate wheel/sdist build and the actual installed orchestrate --help pass. A source venv's editable install initially masked that defect; the definitive proof uses a clean venv with raw dependency import paths and no editable .pth activation. The final candidate package was rebuilt after the compiler repair and its compiler bytes match the corrected source.

Packaging remains partial: schemas, compiled contract, governance/task artifacts, and sibling roster/matrix inputs are not included in the wheel; operational paths remain checkout-relative. Console help is not a standalone operational install proof. requirements.txt also omits OpenTelemetry dependencies listed in pyproject.toml; README directs dependency installation to the canonical project declaration. No public package, user environment install, persistent PATH change or release was performed.

Actual source CLI compile tasks failed on missing Tracks.md, although unit tests passed, because the canonical file was renamed DEV-TRACKS.md. The compiler path/docstrings now use DEV-TRACKS.md. In the disposable source export, both dossier and task compilers produce byte-identical outputs over two runs. Those outputs stay in work; live runtime-contract.yaml and tasks/task-queue.json were not regenerated. The test suite remains green. Repeatability establishes these compiler outputs for this fixture, not universal language/runtime determinism.

## Documentation and classification

README now describes actual local handlers, queries, installation prerequisites and package/release limits. DEV-PLAN/DEV-PATH receive dated evidence appendices; original history remains an exact byte prefix. Historical next-release1.1.0 and queued dispatch/retry/audit work are labeled by current implementation evidence; Python compiler names supersede old .js design references. AGENTS and other governed repositories are untouched. Whitespace and review-bundle checks pass.

| Class | Evidence |
| --- | --- |
| CANONICAL | Governed repository/source identity for current portfolio work; original contract authority retained |
| IMPLEMENTED | Tested compiler/local dispatch/budget/escalation/telemetry/roster-query mechanisms; personal bootstrap separately tested |
| PARTIAL | Operational package data/config, application CI, current release/version acceptance, live model adapters/secret resolution/provider proof |
| STALE | Missing wheel CLI, Tracks.md path, one-line README, queued already-implemented mechanisms; fixed/annotated |
| SUPERSEDED | .js compiler references and old planning filenames for the governed implementation; historical personal material preserved |
| CHAT-ONLY | No additional Classic-only shipped capability established; live credential/model execution design remains unverified |

Recovery order: define runtime-data/config locations and release acceptance; add CI covering installed CLI and actual compiler entry paths; establish repository ancestry/provenance before deciding personal bootstrap disposition; scope real model adapters/credential resolution/provider admission separately. No autonomous merge, cleanup or runtime expansion follows from this audit.

The canonical inventory remains74 entries with both APO rows classified. Next portfolio reconciliation: Doc Vault Plane, inspecting its actual data boundaries and repository state before changes.

## Governance closeout

Nine Level1 checks pass; existing Level4 CXP4/canonicalGC5/duplicateGC10 gates remain. PLAY accepts 35 records with zero errors/warnings. No release readiness is claimed.
