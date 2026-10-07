# eOS reconciliation — 2026-10-06

eOS is a dependency-free Python CLI front door to the separately installed `.eco` HTTP runtime. It is not a bootable OS image or the broader eco execution substrate. Five local files were changed: README, append-only DEV-PLAN/DEV-PATH, CLI path validation, and a focused test module. No commits, pushes, releases, installations into the user's working environments or provider calls occurred.

## Local and GitHub state

Initially clean local main matches private [jj-ervin/eos](https://github.com/jj-ervin/eos) main exactly at `a452ac734036ede47801af024a59367c31b7a0c1`. GitHub reports one branch, no tags, releases, open issues, open PRs or Actions runs. There is no application CI workflow in tracked source. The old priority task to push `489fbf0` is stale: ancestry confirms it is already included in remote main. Planning history was retained and annotated instead of erased.

The ignored `remote/` directory is a separate empty/unborn Git shell: it has no HEAD or remotes. It is a local artifact, not a divergent implementation or an additional active project. It was preserved. The portfolio inventory remains 74 project entries.

## Canonical boundaries

Three uses of eOS must remain distinct:

1. This repository implements the CLI: `boot` invokes the selected Python's `runtime.server`; `health` reads `/health`; `route` asks `/routing/decision` for a recommendation. A routing request does not execute an agent task.
2. `eco/docs/specifications/eos-spec.md` describes a broader scheduler/executor/resource/pipeline design. Its architecture is not implemented by this CLI and was not rewritten.
3. `eco/src/eco/core/eos/` is the separate substrate stub pending NEHI.00. No orchestration code was moved or fabricated.

The actual nearby runtime entry point is `C:/dev/.eco/runtime/server.py`; `C:/dev/eco/.eco` has no such runtime entry point. The CLI wheel deliberately carries no runtime dependencies. FastAPI, uvicorn, cloudevents and httpx are declared by the separate runtime's requirements. The devcontainer's editable CLI install alone therefore does not establish a working runtime environment. README now documents the prerequisite and loopback default explicitly.

Health is a runtime observation, not a complete governance or release certificate. Source inspection of runtime routes and boot setup does not replace a real deployment proof. Signal Radar remains evidence-first event intelligence and EdgeLab downstream market-edge validation; neither boundary changes in this reconciliation.

## Repair and validation

The original explicit-root path check accepted any existing file or directory and launched Python from it. Automatic discovery also accepted a directory named `runtime/server.py`. Both paths now require the runtime entry point to be a file, rejecting invalid roots before process startup. This is a bounded validation repair, not a new runtime implementation.

Seven standard-library tests cover explicit invalid/valid roots, directory-marker rejection, discovery fallback, boot subprocess/port/reload/working-directory behavior, and real loopback HTTP transport with exact health/routing paths and token payload. Running the same tests against the original source produces three expected path-validation failures; the corrected installed wheel passes all seven. Boot execution is mocked, and HTTP responses are fixture responses: no real `.eco` process, scheduler or provider was exercised by this suite.

An isolated source copy builds wheel and sdist successfully. A disposable Python 3.14 environment installs the wheel with no dependencies and runs the real console entry point's help plus the tests. Python 3.11 is declared but was not independently executed here. Packaging success does not establish public publication, OS packaging, developer-container runtime readiness or deployment acceptance. Package-index ownership/publication was not checked; the older plan’s claim of no index publication remains historical rather than newly certified. Distribution metadata and licensing also need review before a public release.

Existing planning files were verified as unchanged byte prefixes with dated appendices; Git diff whitespace checks pass. The Claude adapter's canonical GC onboarding pointer remains intact. Test coverage task EOS.02 is now partial; exhaustive transport/parser/error handling, actual runtime integration, CI and release acceptance remain unresolved.

## Classification and recovery order

| Class | Evidence |
| --- | --- |
| CANONICAL | Current private CLI source and root planning; explicit naming/runtime boundary |
| IMPLEMENTED | CLI commands, setuptools package and console entry; focused path repair and tests |
| PARTIAL | EOS.02 coverage, real runtime deployment, declared-minimum Python verification, CI/release acceptance |
| STALE | Already-satisfied push task; one-line README and invalid-root checks, now annotated/repaired |
| SUPERSEDED | Broad-substrate interpretation of this CLI; retained separate specification and stub |
| CHAT-ONLY | No additional Classic-only eOS capability established; no brainstorm promoted into implementation |

Next eOS work: first agree a bounded runtime integration test and supported Python matrix; then add CI; finally define release acceptance and distribution if this CLI is needed as a product. The broader substrate requires its own eco milestone rather than expanding this package by implication. For the portfolio, continue with Cairn/Sealdex after eOS, preserving the vault/metadata boundary and separating technical release evidence from human installation proof.

## Governance closeout

Nine Level1 validators pass; existing portfolio Level4 CXP4/canonical GC5/duplicate GC10 release gates remain open. Final PLAY validation accepts 31 records with zero errors/warnings. No release readiness is claimed.
