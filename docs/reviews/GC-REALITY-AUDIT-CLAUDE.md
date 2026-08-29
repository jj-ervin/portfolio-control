# GC-REALITY-AUDIT — Claude (independent pass)

**Date:** 2026-08-27
**Auditor:** Claude (Opus 5), adversarial read-only pass
**Mode:** Read-only. No edits, commits, pushes, issues, or repo creation. All audited worktrees verified clean at close.

> **Filename note.** The requested name `GC-REALITY-AUDIT.md` was already occupied by a 28KB
> Codex audit dated the same day at `docs/reviews/GC-REALITY-AUDIT.md`.
> Overwriting it would have destroyed existing work, which the read-only constraint forbids.
> This is the independent Claude pass, written alongside it. I did not read Codex's findings
> before forming my own; overlaps below are convergent, not copied. Divergences are flagged in §11.

## Evidence labels

| Label | Meaning |
| --- | --- |
| **FACT** | Directly observed file content or repository state |
| **TEST** | Result of a command I ran in this session |
| **EXT** | Live external source (HTTP, DNS, package registry, GitHub API) |
| **JUDGMENT** | My interpretation of FACT/TEST/EXT |
| **UNSUPPORTED** | A claim made by the work with no evidence found, or contradicted |
| **REC** | Recommendation — not a current fact |

---

## 0. Scope correction (read this first)

**FACT.** The five repositories named in the brief are **not the live work**. `gh repo list jj-ervin`
returns `agent-matrix` (updated 2026-06-05), `agent-dossier` (2026-06-04), `ons` (2026-06-04),
`agent-project-orchestrator` (2026-06-07). The active development is under a separate
`governancecommons/*` GitHub organization, checked out locally at `c:\dev\governance-commons\`.

**TEST.** I cloned all five `jj-ervin/*` repos and tested shared history against the
`governancecommons/*` checkouts:

| Repo | jj-ervin HEAD | Relationship to governancecommons |
| --- | --- | --- |
| `agent-matrix` | `6c92df4` | Ancestor — 13 commits behind |
| `agent-dossier` | `42677a9` | Ancestor — 10 commits behind |
| `agent-project-orchestrator` | `af7b7c7` | Ancestor — 21 commits behind |
| `ons` | `82f4f6c` | Ancestor — 17 commits behind |
| `governance-commons-www` | `f96f92e` | **Disjoint history — no shared commit** |

**JUDGMENT.** Four of the five are superseded snapshots, safe to treat as history. The fifth is a
real problem: there are **two unrelated website repositories** with the same name in two orgs, and
the `jj-ervin` one is PUBLIC. **EXT:** both serve live content —
`https://jj-ervin.github.io/governance-commons-www/` → 200 and
`https://governancecommons.github.io/governance-commons-www/` → 200. Two public sites, one
governance story.

**Everything below audits the live `governancecommons/*` tree**, which is the only defensible target.
I also inspected the sibling components the brief asked me to find: `agent-team-protocol`,
`agent-roster`, `governance-commons-sdk`, `governance-commons-www`, `agent-dossier-www`, the
`passes/dev-accord/` Accord, `passes/passes.registry.json`, `governance/` framework mappings,
`docs/observability-contract.yaml`, `docs/conformance/`, `rfcs/`, and `gc-audit/`.

---

## 1. Executive verdict

Governance Commons contains **substantial, genuine standards-engineering work that has never been
subjected to a single external reality test, and whose publication layer is comprehensively broken.**
This is not documentation cosplay: 788 tests pass across five repositories, the Agent Dossier
validator implements a real negative-conformance harness with per-fixture expected-error assertions,
the CloudEvents binding is correctly formed against the actual CloudEvents 1.0 attribute rules, the
A2A task-state vocabulary matches the real A2A specification, and the ONS test suite is unit-level
rather than smoke-level. That is more rigor than most self-declared "agent standards" on GitHub.
But the same body of work fails on the things that make a specification a *standard* rather than a
private schema collection: **all 57 canonical `$id` URLs are unreachable** (TLS verification fails on
`governancecommons.org`), **four of six Agent Matrix examples fail Agent Matrix's own validator**
including the minimal one, **CI has been red at HEAD since at least 2026-07-06** on the flagship spec,
**the reference implementation validates against a stale private fork of the schemas rather than the
published ones**, **not one of Governance Commons' own PASS identifiers validates against Governance
Commons' own published PASS schema**, the largest artifact has **no LICENSE file** while claiming MIT
in three places, and the ISO/NIST mappings self-assess **86–94% "full" coverage** of frameworks that
require deployed-system evidence this project does not have. So: a coherent, unusually well-built
**specification family** at the artifact level; **disconnected prototypes** at the integration level;
**mostly documentation** at the governance-institution level; and the publication surface is
**contradicted**, not merely incomplete. The correct description today is *a serious solo
standards-engineering effort that has not yet been published in a form anyone else could implement* —
not a standards body, not an adopted standard, and not a stack.

---

## 2. Evidence inventory

| Artifact | Path | Status | Verification performed | Evidence |
| --- | --- | --- | --- | --- |
| Agent Dossier canonical spec | `agent-dossier/agent-dossier.yaml` | v1.4.0, `status: active` | Ran repo validator at all 3 profiles | **TEST:** `PASS … 0 findings` at advisory/standard/strict |
| Agent Dossier validator | `agent-dossier/tools/validate.py` | Real, 700+ lines | Executed; read source | **TEST:** exit 0. **FACT:** enforces required paths, semver, PASS IDs, ABNF/EBNF grammar, conformance matrix |
| Dossier negative harness | `agent-dossier/examples/invalid/manifest.yaml` | Real | Read + executed | **FACT:** 9 fixtures with `expected_error_contains`; validator errors if an invalid fixture *passes* (`validate.py:435`) |
| Dossier crypto signature spec | `agent-dossier/schemas/handoff-envelope-signature.schema.json` | Spec only | Read; grepped for impl | **FACT:** RFC 8037 EdDSA/JWS, did:key. **TEST:** `grep sign\|verify\|ed25519\|jws\|jose tools/*.py` → **zero matches** |
| Dossier OTel adapter | `agent-dossier/tools/otel_adapter.py` | Real, dependency-free | Read | **FACT:** maps severities to OTel SeverityNumber per Logs Data Model |
| Agent Matrix canonical spec | `agent-matrix/agent-matrix.yaml` | v1.6.0, ~5000 lines | Validated | **TEST:** canonical file `valid` |
| Agent Matrix schemas | `agent-matrix/schemas/` (44 files) | Sections + events + OpenAPI | Parsed all | **FACT:** 33 at `$id` v1.4.0, 9 at v1.5.0, 2 at v1.6.0 |
| Agent Matrix CLI | `agent-matrix/tools/agent_matrix_cli.py` | Real, overlay resolution | Executed | **TEST:** `validate`/`render` subcommands work; profiles resolve |
| Agent Matrix examples | `agent-matrix/examples/` (6) | **4 of 6 INVALID** | Validated each | **TEST:** `minimal-matrix`, `data-pipeline-agents`, `full-stack-dev-team`, `compliance-evidence-export` all fail |
| Agent Matrix tests | `agent-matrix/tests/` (9 files) | Real | `pytest -q` | **TEST:** **232 passed** |
| Agent Matrix CI | `.github/workflows/validate.yml` | **RED at HEAD** | GitHub API | **EXT:** run `31356190210` (2026-08-10) failure; prior 2 runs also failure |
| Agent Matrix OpenAPI | `schemas/openapi/agent-matrix-runtime.yaml` | Well-formed 3.1.0 | Parsed | **FACT:** 6 paths, bearerAuth, declares hosted server `matrix.governancecommons.org` |
| ONS spec | `ons/ons.yaml` | v1.4.0, `status: stable` | Validated | **TEST:** `PASS … 0 findings` |
| ONS validator + rules | `ons/tools/validate.py`, `tools/rules.json` | Real, stable rule IDs | Executed | **TEST:** exit 0; **FACT:** documented rule-code catalog |
| ONS tests | `ons/tests/test_validate.py` | **Strongest suite in family** | `pytest -q` | **TEST:** **112 passed**; unit tests per rule via `tmp_path`, incl. `test_datetime_parsed_as_string` |
| ONS doc-type registry | `ons/registry/doc-types.yaml` | **Project-specific** | Read | **FACT:** `domain: portfolio`, `governed_by: DEV-ACCORD.00`, registers `DEV-PATH`/`DEV-PLAN` |
| APO runtime | `agent-project-orchestrator/` | Real Python orchestrator | `pytest` in its `.venv` | **TEST:** **113 passed** (fails outside venv: no `pydantic`/`opentelemetry`) |
| APO CLI | `agent-project-orchestrator/cli.py` | Real | `--help` | **TEST:** 6 commands: `compile`, `run`, `validate`, `pass-id`, `recommend-next`, `roster-catalog` |
| APO schemas | `agent-project-orchestrator/schemas/` | **Stale private fork** | Diffed vs canonical | **TEST:** both files fully diverged; `$id` = `agent-dossier.org/v/1.0.0` |
| APO CI | — | **NONE** | `gh run list` | **EXT:** zero runs; no `.github/` in tracked files |
| Agent Team Protocol | `agent-team-protocol/` | v0.1, honest pre-release | `pytest -q` | **TEST:** **147 passed**; **FACT:** README states CI + reference impl "remain open" |
| Agent Roster | `agent-roster/` | Real, has CI | Listed | **FACT:** roster schema, health check, README generator, 3 workflows |
| GC SDK | `governance-commons-sdk/` | **Published to PyPI** | `pytest`, PyPI API | **TEST:** **184 passed**. **EXT:** `governance-commons` 0.2.0 live on PyPI |
| GC SDK npm | `governance-commons-sdk/package.json` | **Not published** | npm registry | **EXT:** `registry.npmjs.org/governance-commons` → **404** |
| Website | `governance-commons-www/` | Astro, live on GH Pages | Fetched | **EXT:** 200 on both `*.github.io` URLs; **000 (TLS fail)** on custom domain |
| The Accord | `passes/dev-accord/DEV-ACCORD.00–.10.md` | **Internal, not a standard** | Read | **FACT:** "canonical onboarding protocol for any agent operating in **this portfolio**"; reads `PROTECTED.md`, `projects.yaml` |
| PASS registry | `passes/passes.registry.json` | Real, CANON.02 | Parsed | **FACT:** IDs `GC:0001`, aliases `GC.00`/`APO.00`/`CANON.02` |
| PASS schema | `agent-dossier/schemas/pass-changelog-entry.schema.json` | **Contradicted by practice** | Regex-tested | **TEST:** pattern `^PASS-[0-9]{4}-[0-9]{4}$`; **0 of 12** real GC PASS IDs match |
| Charter | `docs/charter.md` | AL:3, real | Read | **FACT:** GC-CHARTER-002 Apache-2.0 default; GC-CHARTER-003 mandates `governancecommons.org` `$id`s |
| NIST AI RMF mapping | `governance/nist-ai-rmf-mapping.yaml` | **Overclaimed** | Counted | **TEST:** 25 `full` / 4 `partial` / **0 gaps** |
| ISO 42001 mapping | `governance/iso-42001-mapping.yaml` | **Overclaimed** | Counted | **TEST:** 31 `full` / 1 `partial` / 1 `out_of_scope` |
| Observability contract | `docs/observability-contract.yaml` | Real, OTel-shaped | Read | **FACT:** 7 canonical `gc.agent.*` spans, mandatory `gc.time_loc` |
| Adopters registry | `ADOPTERS.md` | **Honest — empty** | Read | **FACT:** `_(none yet — be the first)_` |
| RFC process | `rfcs/RFC-PROCESS.md`, `RFC-0000-template.md` | Template only | Listed | **FACT:** no submitted RFCs |
| IPR / patent / CLA / CoC | — | **ABSENT** | Searched | **TEST:** no `GOVERNANCE.md`, `IPR-POLICY.md`, `PATENT-POLICY.md`, `CLA.md`, `TRADEMARK.md`, `NOTICE`, `CODE_OF_CONDUCT.md` |

**Total test-verified:** 788 passing tests (232 + 184 + 147 + 113 + 112).

---

## 3. Repository scorecards

Scores are 0–5. **They are not averaged** — a repo can be strong on craft and unusable in practice,
and collapsing that into one number is exactly the error this audit exists to avoid.

### 3.1 Agent Dossier

| Dimension | Score | Reason |
| --- | --- | --- |
| Specification coherence | **4** | 21 canonical sections, consistently structured; conformance matrix with `AD-MUST-NNNN` IDs and per-requirement verification method; ABNF/EBNF grammars for envelopes and namespaces. Loses a point because `specification.version` (1.4.0) has drifted from every schema `$id` (1.0.2 / 1.3.0). |
| Implementation depth | **3** | Validator is genuinely substantial and profile-aware. But the v1.3.0 crypto-identity feature — the newest, most security-critical addition — has **zero implementing code** (**TEST:** no `sign`/`verify`/`ed25519`/`jws` anywhere in `tools/`). |
| Test strength | **4** | Best negative-testing design in the family: `examples/invalid/manifest.yaml` pins an `expected_error_contains` per fixture, and `validate.py:435` raises `invalid-fixture-passed` if a bad fixture validates. That is real conformance engineering. **But** (**TEST**) 2 of 11 on-disk fixtures — `handoff-envelope-invalid-signature.yaml` and `agent-dossier-instance-missing-crypto-identity.yaml` — are absent from the manifest and **silently never exercised**. The two dead fixtures are exactly the crypto ones. |
| Interoperability | **1** | **TEST:** `yaml.safe_load` + `Draft202012Validator` on `examples/valid/agent-dossier-instance.yaml` produces `datetime… is not of type 'string'` on `created_at`, `updated_at`, `declared_at`. The examples validate *only* under `AgentDossierLoader`, which strips the `tag:yaml.org,2002:timestamp` implicit resolver (`validate.py:158–164`). An independent implementer using stock tooling gets failures on the spec's own conformant examples, and `parsing_lint_rules` never says to do this. |
| Differentiation | **3** | Per-agent authority/escalation/revocation contract with `revocation_reason` enum and `superseded_by` is a real idea not covered by MCP or A2A. The did:key + JWS handoff envelope is a genuine contribution *as a design*. |
| Documentation accuracy | **2** | README/CHANGELOG say 1.4.0; schemas say 1.0.2; GitHub release says v1.1.0; website says 1.1.0. Four numbers for one standard. |
| Adoption readiness | **1** | Canonical `$id` host unreachable; unimplemented normative MUST ("Receivers MUST verify this signature"); YAML trap above. |
| External evidence | **1** | 5 git tags, GitHub release v1.1.0 (2026-06-18), CI green. Zero adopters, zero citations, zero third-party implementations. |

### 3.2 Agent Matrix

| Dimension | Score | Reason |
| --- | --- | --- |
| Specification coherence | **2** | Individually the 30 sections are careful, and the `compatibility_table` (7 rows pinning `min_orchestrator_version` / `min_dossier_schema_version` per matrix version) is sophisticated standards thinking. But the repo carries **three simultaneous `$id` versions** (1.4.0/1.5.0/1.6.0), and the schema requires **23 mandatory top-level sections** — so there is no minimal conformance tier at all. Compare CloudEvents 1.0: four required attributes. |
| Implementation depth | **4** | Overlay/profile resolution (`overlays/production.yaml`, `business-unit`, `data-residency`) is real composition machinery, not decoration. `render` and `validate` both work. |
| Test strength | **3** | **TEST:** 232 tests pass — the largest suite. But they test *sections in isolation*; they do not catch that the shipped examples are invalid. There is no `examples/invalid/` directory at all, so unlike Agent Dossier there is **no negative-conformance testing**. |
| Interoperability | **2** | Genuinely good: `cloudevents_binding` uses `specversion: "1.0"`, reverse-DNS types (`org.governancecommons.agent-matrix.handoff.v1`), and lowercase-alphanumeric extension names (`traceid`, `matrixversion`) — which is exactly what CloudEvents 1.0 requires of extension attributes. `task-lifecycle.schema.json` uses `submitted/working/input-required/completed/failed/canceled`, which **is** the real A2A `TaskState` vocabulary. Dragged down by: `cloudevents-binding.schema.json:25` sets **`"maxItems": 5`** on `event_type_mappings`, which arbitrarily caps how many event types anyone may bind — and already breaks GC's own `compliance-evidence-export.yaml` (7 mappings, **TEST:** `is too long`). |
| Differentiation | **5** | The strongest original content in the portfolio. `compute_cost_model`, `economic_efficiency`, and `sku_capability_overrides` specify **cost-aware, SKU-aware agent routing** with per-model pricing and provider fallback. I am not aware of any published spec — MCP, A2A, or otherwise — that treats model-SKU economics as a first-class routing input. That is a real gap in the landscape. |
| Documentation accuracy | **2** | README says 1.4.0, `agent-matrix.yaml:15` says 1.6.0, schemas say three things, website says 1.4.0. The site labels it "Stable" while CI is red. |
| Adoption readiness | **0** | **TEST:** `minimal-matrix.yaml` — the artifact a new implementer copies first — fails with 9 errors including `agent_escalation_protocol: missing required top-level section` and `agent_class` missing on all 5 profiles. **EXT:** CI red since ≥2026-07-06. **FACT:** **no LICENSE file** despite MIT claimed in `pyproject.toml`, README, and the website. |
| External evidence | **1** | One tag (v1.4.0), one release (2026-06-09), red CI, no adopters. |

### 3.3 ONS (Ontic Namespace Structure)

| Dimension | Score | Reason |
| --- | --- | --- |
| Specification coherence | **3** | Separator semantics (`.` hierarchy, `-` compound, `_` lexical, `:` qualification), casing domains, and a stable rule catalog (`naming.ts.kebab_case`) are internally consistent and genuinely portable *as a model*. |
| Implementation depth | **3** | Validator plus a documented, stable rule-code catalog in `tools/rules.json` — versioning rule IDs so downstream tools can suppress by code is correct practice. |
| Test strength | **5** | **TEST:** 112 tests, and they are the best-engineered in the family: per-rule unit tests against synthesized `tmp_path` trees (`test_uppercase_directory_produces_error`, `test_one_error_per_offending_path`, `test_git_directory_excluded`), not just "does the repo pass". It even explicitly tests the YAML timestamp behavior that Agent Dossier leaves undocumented. |
| Interoperability | **2** | Self-contained and dependency-light. But `$id` host is dead, and the doc-type registry imports portfolio conventions. |
| Differentiation | **1** | **This is the weakest claim in the family.** Naming conventions, separator semantics, and casing rules are the most conventional thing in software. The genuinely novel piece — "ontic identity", the conditions under which a name is *canonical* within a collision scope — is asserted rather than developed, and nothing in the validator enforces it. Everything the validator actually checks (kebab-case, no spaces, no non-ASCII, lowercase dirs) is covered by existing linters. |
| Documentation accuracy | **1** | **The worst in the portfolio.** **TEST:** five different version claims for one standard — `README.md:3` says **1.1.0**, `README.md:76` example says **1.1.0**, `ons.yaml:14` says **1.4.0**, `ons.yaml:467` says **1.3.0**, schemas `$id` say **1.2.0**, GitHub release says **v1.3.0**, and the installed SDK reports `ONS_SPEC_VERSION = 1.4.0`. |
| Adoption readiness | **2** | Highest of the family — it *is* on PyPI via the SDK and runs standalone. Held back by: README says "not project-specific", while `registry/doc-types.yaml` declares `domain: portfolio`, `governed_by: DEV-ACCORD.00`, and registers `DEV-PATH`/`DEV-PLAN` — the author's own document conventions shipped inside the portable standard. This directly violates Agent Dossier's own lint rule `no-project-specific-content`. |
| External evidence | **2** | 2 tags, 2 GitHub releases, and reachable via a live PyPI package. Best external footprint of the specs. CI red at HEAD (2026-06-29). |

### 3.4 Agent Project Orchestrator

| Dimension | Score | Reason |
| --- | --- | --- |
| Specification coherence | **2** | It is not really a specification — it is an application with a spec label applied by the website. `governance/multi-agent.yaml` + `runtime-contract.yaml` are config, not normative text. |
| Implementation depth | **4** | The most *working software* in the portfolio: dispatcher, escalation, roster, telemetry, recommendation engine, PASS-ID utilities, 3 concrete agents, a task queue, and a 6-command CLI that runs. |
| Test strength | **3** | **TEST:** 113 pass — but only inside `.venv`; from the ambient interpreter all 9 modules fail collection on missing `pydantic`/`opentelemetry`. Reproducibility depends on an untracked local venv. |
| Interoperability | **0** | **This is the central architectural failure of the stack.** **TEST:** `compiler/validate.py:67–76` loads schemas from APO's own `schemas/` directory, never from Agent Dossier. Those copies are a **stale fork**: `$id` = `https://agent-dossier.org/v/1.0.0/…` (**EXT:** that host returns **404**), 165 lines vs the canonical 240, `dossier_metadata.status` enum has 4 values vs the canonical 7 (missing `suspended`, `revoked`, `expired`), and `identity` is `additionalProperties: false` **without** `capability_claims` or `crypto_identity`. **TEST:** feeding Agent Dossier's own `examples/valid/agent-dossier-instance.yaml` to APO's schema yields `Additional properties are not allowed ('capability_claims', 'crypto_identity' were unexpected)`. **The reference implementation structurally rejects conformant artifacts from the standard it claims to implement.** |
| Differentiation | **2** | The `recommend-next` agent/model selection driven by Agent Matrix is a nice idea. The rest is a competent but ordinary task orchestrator. |
| Documentation accuracy | **2** | Website bills it as one of "four interoperable, project-neutral standards". It is neither a standard nor interoperable (above). |
| Adoption readiness | **0** | **No LICENSE file. No CI whatsoever** (**EXT:** `gh run list` returns nothing; no `.github/` tracked). Validates against dead-domain schemas. |
| External evidence | **1** | One tag, one release (v1.1.0, 2026-06-18). No CI, no adopters. |

### 3.5 governance-commons-www

| Dimension | Score | Reason |
| --- | --- | --- |
| Specification coherence | **n/a** | Presentation layer. |
| Implementation depth | **3** | Astro site, typed `standards.ts` data model, per-standard pages, conformance page, versioned schema files under `content/agent-dossier/v/1.0.2/schemas/`. |
| Test strength | **0** | No tests, no link-checking, no schema-endpoint verification. |
| Interoperability | **0** | **EXT:** it is supposed to be the schema-resolution endpoint for all 57 `$id`s and it does not serve them at the canonical host. |
| Differentiation | **1** | Conventional standards-org marketing site. |
| Documentation accuracy | **1** | Presents four "Stable" standards; one has red CI, two have no license, one is not a standard. |
| Adoption readiness | **1** | Content ships; canonical domain is broken. |
| External evidence | **2** | **EXT:** genuinely live and 200 at two `*.github.io` URLs. |

### 3.6 governance-commons-sdk (found, in scope as related material)

| Dimension | Score | Reason |
| --- | --- | --- |
| Implementation depth | **4** | Python + TypeScript sources, `gc-validate` / `gc-report` / `gc-discover` entry points, capability-contract validation, conformance-report builder, `py.typed`. |
| Test strength | **4** | **TEST:** 184 pass, including clean-install smoke tests and unicode-filename fixtures. |
| Interoperability | **2** | **TEST:** `gc-validate --spec` accepts only `choices=["ons", "capabilities"]` (`governance_commons/cli.py:119`). It cannot validate Agent Dossier, Agent Matrix, or APO. |
| Adoption readiness | **3** | **EXT:** `governance-commons` **0.2.0 is live on PyPI** (releases 0.1.0, 0.1.1, 0.2.0). This is the single most real external artifact in the whole portfolio. npm side is **404**. |
| Documentation accuracy | **1** | `ADOPTERS.md` instructs adopters to run `gc-validate --spec <spec-name>` and `gc-report` as the conformance path for the four standards. The CLI supports two specs, neither of which is Dossier/Matrix/APO. The published adoption procedure does not work. |

---

## 4. Cross-repository consistency findings

Every item below is a concrete, reproducible conflict.

**C-1 — Dossier instance schema forked (SEVERE).**
`agent-dossier/schemas/agent-dossier-instance.schema.json` (`$id` …`governancecommons.org/agent-dossier/v/1.0.2/`…, 240 lines) vs
`agent-project-orchestrator/schemas/agent-dossier-instance.schema.json` (`$id` …`agent-dossier.org/v/1.0.0/`…, 165 lines).
`dossier_metadata.status`: canonical `[draft, active, suspended, revoked, expired, deprecated, retired]`; APO `[draft, active, deprecated, retired]`. A **revoked** agent — the security-critical state — is unrepresentable in the orchestrator. `identity` in APO is closed and omits `capability_claims` and `crypto_identity`.

**C-2 — Runtime contract schema forked.** Same two repos, `runtime-contract.schema.json`, 151 lines each but fully divergent, different `$id` hosts.

**C-3 — PASS identifier: three incompatible formats, and the published schema matches none.**

- `agent-dossier/schemas/pass-changelog-entry.schema.json` requires `^PASS-[0-9]{4}-[0-9]{4}$`, and `agent-dossier/.github/workflows/validate.yml` runs a dedicated CI step to enforce 4-digit PASS IDs.
- `docs/observability-contract.yaml` requires `gc.agent.pass_id` to match `PASS-YYYY-NNNN`.
- `passes/passes.registry.json` actually uses `GC:0001` with aliases `GC.00`, `APO.00`, `CANON.02`.
- `passchangelog.md` uses `GC-PASS-0022.00` and explicitly instructs: *"Do not use it as a PASS reference in docs, code, or links."*

**TEST:** of 12 real GC PASS identifiers drawn from the live registry, **zero** match the published schema pattern. The organization does not conform to its own published, versioned identity format.

**C-4 — Trust levels: two different models, same field name.**
`agent-matrix` uses an ordinal clearance scale `T0…T4` across 8 schemas (`trust-levels`, `a2a-binding`, `mcp`, `capability-matrix`, `task-routing-rules`, `agent-profiles`, `agent-specializations`, `validation-requirements`).
`agent-team-protocol/schemas/sections/trust-topology.schema.json` defines `trust_levels[].name` as `[orchestrator, coordinator, worker]` — a **role** taxonomy, not a clearance scale.
ATP's README states it *"Consumes `agent-matrix` … as a runtime primitive."* Two incompatible semantics under one field name in a declared consumer relationship.

**C-5 — Two task-state vocabularies inside Agent Matrix.**
`schemas/events/handoff.schema.json` → `[in_progress, blocked, ready_for_review, completed]` (matches `agent-dossier/schemas/handoff-envelope.schema.json`).
`schemas/events/task-lifecycle.schema.json` → `[submitted, working, input-required, completed, failed, canceled]` (A2A). No mapping table between them exists. A consumer receiving `completed` cannot tell which state machine it came from.

**C-6 — Two severity scales.** `[warning, error, critical]` in `safety-violation` and `sla-qos`; `[low, medium, high, critical]` in `failure-modes` and `prompt-injection-defense`.

**C-7 — Log-level enum is an asymmetric union.**
`observability-signals.schema.json` accepts `[debug, info, warning, error, critical, DEBUG, INFO, WARN, ERROR, CRITICAL]`. The lowercase set uses `warning`; the uppercase set uses `WARN`. So `warning` and `WARN` are valid but `WARNING` and `warn` are not. That is not a vocabulary, it is an accumulation.

**C-8 — Schema `$id` path convention diverges.** Everything else uses `/{standard}/v/{version}/schemas/{name}.schema.json`. ATP uses `/schemas/agent-team-protocol/0.1.0/trust-topology` — reordered, and no file extension.

**C-9 — Charter violations.** `docs/charter.md` GC-CHARTER-003: *"All schema `$id` URLs MUST use the `governancecommons.org` base domain."* Two APO schemas use `agent-dossier.org`. Same entry: *"Per-standard subdomains (`agent-dossier.org`, etc.) redirect to `governancecommons.org/{standard}/`"* — **EXT:** `agent-dossier.org` returns **404**, no redirect.

**C-10 — Licensing incoherence.** `docs/charter.md` GC-CHARTER-002 declares Apache-2.0 the default unless a sub-repo LICENSE says otherwise.

| Repo | LICENSE file | Declared elsewhere |
| --- | --- | --- |
| `agent-dossier` | Apache-2.0 | `pyproject.toml` Apache-2.0 ✓ |
| `agent-matrix` | **NONE** | `pyproject.toml` MIT, README MIT, website MIT ✗ |
| `ons` | MIT | README MIT ✓ |
| `agent-project-orchestrator` | **NONE** | nowhere ✗ |
| `agent-team-protocol` | **NONE** | nowhere ✗ |
| `agent-roster` | Apache-2.0 | — |
| `governance-commons-sdk` | MIT | — |

Under the charter's own rule, `agent-matrix`, `agent-project-orchestrator`, and `agent-team-protocol` are Apache-2.0 — which contradicts Agent Matrix's three MIT declarations. Absent a LICENSE file, a third party's safe reading of a public repo is "all rights reserved." Also: Apache-2.0 carries an express patent grant, MIT does not; a specification family split across both without an IPR policy has an unresolved patent posture.

**C-11 — Version identity.**

| Standard | Canonical YAML | README | Schema `$id`s | Git tag / release | Website | SDK |
| --- | --- | --- | --- | --- | --- | --- |
| Agent Dossier | 1.4.0 | — | 1.0.2, 1.3.0 | v1.1.0 | 1.1.0 | — |
| Agent Matrix | 1.6.0 | 1.4.0 | 1.4.0, 1.5.0, 1.6.0 | v1.4.0 | 1.4.0 | — |
| ONS | 1.4.0 (and 1.3.0 at `ons.yaml:467`) | 1.1.0 | 1.2.0 | v1.3.0 | 1.3.0 | 1.4.0 |
| APO | — | — | 1.0.0 | v1.1.0 | 1.1.0 | — |

*In fairness:* the website consistently reflects **released** versions, which is defensible. The indefensible part is intra-repo disagreement — ONS's own README contradicting its own canonical YAML contradicting its own schemas.

**C-12 — Agent Matrix declares a dependency that does not exist.** `agent-matrix.yaml:30` requires `min_dossier_schema_version: "1.4.0"` and `dossier_specification_alignment: "1.4.0"`. **TEST:** Agent Dossier publishes schema `$id`s at only 1.0.2 and 1.3.0. Matrix 1.6.0 cannot be satisfied by any published Dossier schema.

---

## 5. Claim audit

| # | Claim | Source | Verdict | Evidence |
| --- | --- | --- | --- | --- |
| 1 | "The canonical umbrella domain is `https://governancecommons.org`" | `ons/README.md:14`, charter | **CONTRADICTED** | **EXT:** HTTPS → *"curl failed to verify the legitimacy of the server"* (TLS verification failure). HTTP → **404**. DNS resolves to GitHub Pages IPs (185.199.108–111.153) but `gh api repos/…/pages` returns `"cname": null` — the custom domain was never bound, so no certificate was ever issued. |
| 2 | 57 schemas are identified by `governancecommons.org/...` URLs | all `schemas/*.json` | **CONTRADICTED** | **EXT:** every one unreachable. `$ref` resolution by any standards-compliant JSON Schema tooling fails. |
| 3 | "Four interoperable … standards" | website index | **CONTRADICTED** | **TEST:** C-1 — the reference implementation rejects the canonical spec's own valid examples. Not interoperable. |
| 4 | "Project-neutral … without importing project-specific business logic" | website index | **PARTIALLY SUPPORTED** | The specs *are* largely portable. But `ons/registry/doc-types.yaml` is `domain: portfolio`, `governed_by: DEV-ACCORD.00`, registering `DEV-PATH`/`DEV-PLAN`. (Credit where due: the `eco` profile in `ons.yaml:464` is correctly labelled a *reference* profile — that is legitimate spec practice, not leakage.) |
| 5 | Agent Matrix "Stable v1.4.0" | website | **CONTRADICTED** | **EXT:** CI red at HEAD and for the 3 most recent runs. **TEST:** 4 of 6 shipped examples fail its own validator. |
| 6 | ONS "This repository is not a linter implementation and is not project-specific" | `ons/README.md:11` | **PARTIALLY SUPPORTED** | It ships `tools/validate.py` (a linter) and a portfolio-scoped registry. Violates `agent-dossier`'s own `no-project-specific-content` rule. |
| 7 | "Receivers MUST verify this signature against the from_agent's declared crypto_identity" | `handoff-envelope-signature.schema.json` | **UNSUPPORTED** | **TEST:** zero signing/verification code anywhere in the family; both crypto negative fixtures unexercised. A normative MUST with no implementation and no test. |
| 8 | NIST AI RMF coverage: 25 subcategories `full`, **0 gaps** | `governance/nist-ai-rmf-mapping.yaml` | **UNSUPPORTED** | **TEST:** MEASURE.2.8 — *"Risks or impacts associated with a **deployed** AI system are **monitored** and the deployment state is validated"* — marked `coverage: full`, evidenced by a YAML that *"**recommends** a dedicated audit sink"*. MEASURE.4.1 (*"results … **shared** with relevant AI actors"*) marked `full`, evidenced by a schema for sharing. A schema describing evidence is not evidence. NIST AI RMF outcomes are organizational practices; a document set cannot fully satisfy them with zero deployments and zero adopters. |
| 9 | ISO/IEC 42001 coverage: 31 `full`, 1 `partial` | `governance/iso-42001-mapping.yaml` | **UNSUPPORTED** | Same defect. ISO 42001 is an auditable management-system standard; conformity is determined by an accredited certification body against operating evidence, not by self-assessment against one's own YAML. |
| 10 | "Run the source validators and retain the report required by your profile" / `gc-validate --spec <spec-name>` | `ADOPTERS.md` | **CONTRADICTED** | **TEST:** `cli.py:119` — `choices=["ons", "capabilities"]`. The documented adoption path cannot validate three of the four advertised standards. |
| 11 | Adopters: "_(none yet — be the first)_" | `ADOPTERS.md` | **SUPPORTED** | Honest and accurate. Worth saying plainly: this file does not overclaim. |
| 12 | Agent Team Protocol: "CLI validation, CI, and the runtime reference implementation remain open" | `agent-team-protocol/README.md` | **SUPPORTED** | Accurate self-description. The most honest status line in the portfolio. |
| 13 | Hosted runtime at `https://matrix.governancecommons.org/v1` | `openapi/agent-matrix-runtime.yaml` `servers[0]`, described as "Governance Commons hosted runtime" | **CONTRADICTED** | **EXT:** `000` — does not exist. An OpenAPI `servers` entry describing a non-existent hosted service is a live-service claim. |
| 14 | CloudEvents delivery target `https://events.governancecommons.org/agent-matrix/cloudevents`, `enabled: true` | `agent-matrix.yaml` | **CONTRADICTED** | **EXT:** `000`. |
| 15 | Normative reference `https://a2a-protocol.org/specification` | `agent-matrix.yaml:2220` | **CONTRADICTED** | **EXT:** **404** (host root is 200 — the cited path has moved). A dead normative reference. |
| 16 | Normative reference `https://modelcontextprotocol.io/specification/2025-03-26` | `agent-matrix.yaml:4383` | **SUPPORTED** | **EXT:** **200**. Correctly version-pinned, though 2025-03-26 is now a superseded MCP revision. |
| 17 | Agent Matrix is MIT licensed | `pyproject.toml`, README, website | **CONTRADICTED** | **FACT:** no LICENSE file; charter's default is Apache-2.0. |
| 18 | "Governance Commons" is a commons / standards organization | naming, charter, site framing | **UNSUPPORTED** | **TEST:** no `GOVERNANCE.md`, `IPR-POLICY.md`, `PATENT-POLICY.md`, `CLA.md`, `TRADEMARK.md`, `NOTICE`, or `CODE_OF_CONDUCT.md`. `docs/charter.md` GC-CHARTER-001 names a single founding maintainer and states *"There is no other mechanism for changing charter entries."* `rfcs/` holds a template and zero submitted RFCs. **This is a single-maintainer project with standards-shaped vocabulary. I found no evidence supporting standards-body status, and per the brief I do not assert it.** |
| 19 | Independently versioned specifications adoptable separately | website, `ons/README.md` | **PARTIALLY SUPPORTED** | The *architecture* genuinely supports this — separate repos, tags, changelogs, and a real compatibility table. Undermined by C-11 version drift and C-12's unsatisfiable dependency. |
| 20 | 788 tests pass across the family | (my measurement) | **SUPPORTED** | **TEST:** 232 + 184 + 147 + 113 + 112, all green locally. |

---

## 6. External landscape comparison

### 6.1 Where GC duplicates existing work

**OpenTelemetry — and gets the model wrong.** `docs/observability-contract.yaml` defines seven canonical
**spans** including paired `gc.agent.scaffold.started` / `gc.agent.scaffold.completed`. In OpenTelemetry a
span *is* an interval — it carries start and end timestamps and covers the operation's duration. Emitting
"started" and "completed" as two separate spans is the log/event model wearing span vocabulary; the
correct OTel expression is one span `gc.agent.scaffold` (or span events on it). Relatedly, the contract
makes `gc.time_loc` a mandatory attribute that *"Implementations MUST reject or quarantine"* events
without — but every OTel span already carries required start/end timestamps and every log record carries
`Timestamp`/`ObservedTimestamp`. GC is re-mandating a field the transport guarantees. The severity mapping
in `agent-dossier/tools/otel_adapter.py` (to OTel `SeverityNumber`) is, by contrast, correct.

**JSON Schema.** Conventional and competent — Draft 2020-12 throughout, `additionalProperties: false`
where appropriate, `$defs` reuse, `Draft202012Validator.check_schema` self-validation in the validators.
The one non-conventional choice is harmful: `"maxItems": 5` on an extension point.

**Naming/lint rules (ONS).** kebab-case, no spaces, no non-ASCII, lowercase directories — covered by
existing linters, `.editorconfig`, and language-native style tools. The differentiated idea (canonical
"ontic identity" within a collision scope) is asserted but not implemented.

**PASS records.** A dated, ID'd decision log with authority levels. This is ADR (Architecture Decision
Record) practice with different vocabulary. That is not a criticism of its usefulness — see §6.3.

### 6.2 Where GC combines existing work usefully

**One artifact spanning MCP + A2A + CloudEvents + OTel + compliance mappings.** `agent-matrix.yaml`
carries an `mcp` section pinned to a real MCP revision, an `a2a_binding` whose task states match the
actual A2A `TaskState` vocabulary, a CloudEvents 1.0 binding with correctly-formed reverse-DNS types and
lowercase-alphanumeric extension attributes, an OTel-shaped observability section, and a
`compliance_mapping` section with `[mapped, partially-mapped, not-applicable, gap]` status. No single
external spec does that joining. **JUDGMENT:** the *integration* is the contribution, not the parts.

**Negative-conformance harness as a portable pattern.** `agent-dossier/examples/invalid/manifest.yaml` +
`validate.py:435` (`invalid-fixture-passed`) is a small, clean, genuinely reusable design: a
machine-readable list of what must fail and the exact error it must produce, with the validator failing if
a bad fixture passes. Most schema projects test only the happy path. This pattern is worth more than the
specification it currently serves.

**Version compatibility table.** `agent-matrix.yaml` `compatibility_table` pins, per matrix version, the
minimum orchestrator version, minimum dossier schema version, and support status. That is the kind of
thing real interop specs need and most young projects omit entirely.

### 6.3 Where GC may hold a real gap or contribution

1. **Cost/SKU-aware agent routing.** `compute_cost_model`, `economic_efficiency`, and
   `sku_capability_overrides` treat model pricing and provider SKU as first-class routing constraints.
   MCP governs tool/context exposure; A2A governs inter-agent task exchange; neither specifies routing
   economics. **JUDGMENT:** this is the most defensible original contribution in the portfolio, and it is
   the piece I would take to an external audience.
2. **Per-agent authority + revocation lifecycle.** `dossier_metadata.status` with `suspended`/`revoked`/
   `expired`, plus a structured `revocation` block with `revocation_reason` and `superseded_by`, applies
   PKI-style lifecycle thinking to agent authority. MCP and A2A have no revocation model. This is a real
   gap in the landscape. It is also, ironically, the exact field the reference implementation cannot
   represent (C-1).
3. **Machine-checkable governance decision records.** PASS-as-schema (not PASS-as-prose) — a decision
   record with an authority level, dependency links, supersession edges, and a validator — is a
   contribution ADRs do not make. The idea is sound; the current execution contradicts itself (C-3).
4. **Signed handoff envelopes.** Ed25519/JWS over a canonical envelope with `did:key` identity is the
   right shape for cross-organizational agent handoff, and nothing in MCP or A2A covers it. It is
   currently a design document, not a mechanism.

**Where an independent implementer would be blocked.** The signature spec says the payload is *"the full
envelope serialized as JSON with keys sorted lexicographically and no extraneous whitespace."* That is
underspecified for a cryptographic signature: it does not define number serialization (`1.0` vs `1` vs
`1e0`), string escaping, Unicode normalization, or handling of non-ASCII keys. Two correct implementations
will produce different bytes and fail to verify each other's signatures. **RFC 8785 (JSON Canonicalization
Scheme) exists precisely for this** and should be cited normatively instead of hand-rolling. Adjacent
blocker: the YAML timestamp trap (§3.1) means an implementer using stock `yaml.safe_load` cannot even
reproduce the examples.

---

## 7. Real-world pathways

| Pathway | Verdict | Evidence required | Institutional capacity required | Gap today |
| --- | --- | --- | --- | --- |
| **Open specification family** | **Viable, nearest-term** | Reachable canonical URLs; a LICENSE in every repo; green CI; examples that validate; one version number per standard | One maintainer, sustained | All five missing. Every one is a bug fix, not a research problem. |
| **Reference implementation project** | **Viable after C-1** | An implementation that consumes the *published* schemas and demonstrably round-trips conformant artifacts | One maintainer | APO validates a stale private fork against a 404 domain and has no CI. Deleting APO's `schemas/` and importing Agent Dossier's is the whole fix. |
| **Conformance toolkit** | **Strongest fit** | Validators + negative fixtures + machine-readable reports that run against *someone else's* artifacts | One maintainer; PyPI presence | Already 80% there: `gc-validate`/`gc-report`, `conformance-report.schema.json`, the dossier negative harness, 788 tests, live PyPI package. Blocked mainly by `--spec` supporting only 2 of 4 standards. |
| **Standards incubator** | **Premature** | Multiple independent implementers; public RFC traffic; a change process others use | Working group, IPR policy, CoC | **TEST:** zero RFCs submitted, zero adopters, no IPR/CLA/CoC, charter states a single person holds AL:3 with "no other mechanism". |
| **Submission to an established process** (IETF I-D, W3C CG, CNCF/LF sandbox, OpenSSF) | **Possible for one narrow piece only** | A tightly scoped document solving one problem, with prior-art analysis and ideally two implementations | Willingness to cede editorial control; patent-grant clarity | The 23-required-section Agent Matrix is far too large. A ~10-page "Cost-aware agent routing metadata" or "Agent authority revocation" draft is plausibly submittable. Blocked first by the missing IPR/patent posture (C-10). |
| **Open-source governance research project** | **Viable and honest** | A stated hypothesis, an artifact, and a published negative result if it fails | One maintainer; no institution | Requires reframing "Stable standards" as "research artifacts". Cheapest credible path. |
| **Recognized standards-development organization** | **Not supported by any evidence** | Legal entity with IPR regime, membership, patent policy, appeals, independent editors, external recognition | Board, counsel, funding, multi-party participation | Absent entirely, and the brief correctly forbids recommending spending toward it. **I do not describe Governance Commons as a standards body anywhere in this report.** |

---

## 8. Salvage classification

Exactly one category per component.

| Component | Class | Justification |
| --- | --- | --- |
| **Agent Dossier (spec + validator + negative harness)** | **REPAIR** | Highest-quality engineering in the family and the only one with a real conformance harness. Needs: (a) reconcile 1.4.0/1.0.2/1.3.0/v1.1.0 to one number; (b) reachable `$id` host; (c) document the YAML timestamp requirement normatively, or quote timestamps in all examples; (d) add the 2 orphan crypto fixtures to `manifest.yaml`; (e) either implement Ed25519/JWS verification citing RFC 8785 or demote the signature spec to `status: draft`. |
| **Agent Matrix — cost/SKU routing + compatibility table** | **RESEARCH** | The genuinely novel hypothesis: agent routing should be economically aware. Coherent, unvalidated, and worth external testing on its own merits. Extract as a short standalone document. |
| **Agent Matrix — the other 20+ mandatory sections** | **REPAIR** | 23 required top-level sections is why `minimal-matrix.yaml` cannot validate. Needs a small required core (5–7 sections) with the rest optional. Also: add a LICENSE, fix `maxItems: 5`, green the CI. Do not delete — the content is good; the conformance model is wrong. |
| **Agent Matrix CloudEvents + A2A bindings** | **SHIP** | **TEST/EXT:** correctly formed against the real CloudEvents 1.0 attribute rules and the real A2A `TaskState` vocabulary. The most externally-defensible artifact today. Only fix: `maxItems: 5`, and make `data_schema` an absolute URI. |
| **ONS — separator/casing/rule-catalog core** | **REPAIR** | Excellent tests (best in family), conventional subject matter. Fix the five-way version contradiction and move `registry/doc-types.yaml` out of the standard. Value is real but modest; do not oversell it as a standard. |
| **ONS — "ontic identity" claim** | **RESEARCH** | The one differentiated idea, currently asserted rather than specified or enforced. |
| **governance-commons-sdk / `gc-validate`** | **SHIP** | **EXT:** already published (PyPI 0.2.0), 184 tests, clean-install smoke tests, works standalone with no GC branding required. The most externally real thing here. |
| **agent-project-orchestrator** | **REPAIR** | Real working software (113 tests, 6-command CLI) crippled by one decision: vendored fork schemas pointing at a dead domain. Delete `schemas/`, import from `agent-dossier`, add CI and a LICENSE. Until then it demonstrates nothing about the specs. |
| **agent-team-protocol** | **RESEARCH** | Honest v0.1 pre-release, 147 tests, no CI, no reference impl. Its trust model (C-4) conflicts with the spec it claims to consume — that must be resolved before it is more than a hypothesis. |
| **agent-roster** | **ARCHIVE** | Real and tested, but it is portfolio tooling (model roster + health checks), not a standard. Useful internally; not part of any external story. |
| **governance-commons-www** | **REPAIR** | Content is fine; the publication layer is the single highest-leverage broken thing in the portfolio (57 dead `$id`s). Also: the disjoint `jj-ervin` twin should be resolved. |
| **NIST AI RMF / ISO 42001 / SOC 2 mappings** | **RETIRE (as coverage claims)** | 25 `full`/0 gaps and 31 `full`/1 partial are self-assessments of frameworks requiring operating evidence. Published as-is they are the most reputationally damaging artifacts here — any reader with ISO 42001 familiarity will discount everything else on sight. The *underlying* work (tracing artifacts to control outcomes) is legitimate; **relabel `coverage:` as `intended_coverage:` and re-classify honestly**, or keep them private. |
| **DEV-ACCORD (the Accord)** | **ARCHIVE (as internal doctrine — keep using it)** | **FACT:** `DEV-ACCORD.03.md` is *"The canonical onboarding protocol for any agent operating in this portfolio"*, whose reading order is `PROTECTED.md`, `DEV-CONTROL-PLANE.md`, `projects.yaml`, `dev-docs/_root/contracts/`. It governs **agent behavior inside `c:\dev`** — not technical conformance, not community participation, not institutional behavior. It is a genuinely good internal operating manual and should stay in use. It is not a Governance Commons standard, and housing it inside the `governance-commons` repo is the main reason the umbrella looks larger than the external work actually is. |
| **PASS (as practiced: `GC:NNNN` registry + changelog)** | **ARCHIVE (internally valuable)** | 123 commits of real decision history with authority levels, supersession edges, and dependency links. Genuinely more useful than a changelog *for this portfolio*. No demonstrated external value. |
| **PASS (as published schema: `pass-changelog-entry.schema.json`)** | **RETIRE** | **TEST:** zero of GC's own PASS IDs validate against it. Its author abandoned the format in practice while continuing to publish and CI-enforce it. Shipping a versioned schema your own organization violates is worse than shipping nothing. |
| **`jj-ervin/*` repo copies** | **ARCHIVE** | Superseded ancestors (§0). The public `jj-ervin/governance-commons-www` with disjoint history should be reconciled or made private — two public sites for one project is a live inconsistency. |

**Strongest component independent of the Governance Commons brand:** the **`governance-commons-sdk` validator core** (published, tested, standalone, no brand dependency) for *shipping*; and the **Agent Matrix cost/SKU routing model** for *intellectual differentiation*. Neither needs the umbrella to be interesting. The umbrella is currently a liability to both.

---

## 9. Single recommended external test

**Artifact under test:** `agent-dossier` at tag **v1.1.0** — the only component that is simultaneously
tagged, released, licensed (Apache-2.0), CI-green, and equipped with a negative-conformance harness. I
deliberately did **not** pick Agent Matrix (red CI, unlicensed, 4/6 examples invalid) or invent anything.

**Intended tester:** two backend/platform engineers who have shipped a JSON-Schema-validated config
format, have **no** prior exposure to Governance Commons, and are not in the author's network. Not AI
governance specialists — the claim under test is implementability, not agreement.

**Exact use case:** *"Here is a specification for declaring what an AI agent is allowed to do and how it
hands work to another agent. Using only its published documentation, write a valid dossier for one real
agent in your own system, plus one valid handoff envelope from that agent to another. Then produce one
artifact you believe should be rejected, and confirm the validator rejects it."*

**Test procedure.**

1. Give them the repo URL at tag v1.1.0 and nothing else. No walkthrough, no answers to design
   questions during the attempt.
2. They work independently, timeboxed to **4 hours each**, recording a timestamped log of every point
   where they had to guess, re-read, or look at `examples/` to resolve ambiguity in the prose.
3. They use **their own** tooling — whatever YAML parser and JSON Schema validator they normally reach
   for. This is the point of the test, not an incidental detail.
4. Afterwards, run each artifact through `agent-dossier/tools/validate.py --profile strict`.
5. Debrief: *what did you think `authority_scope` meant? what is `trust_level` for? would you use this?*

**Success evidence.** Both testers produce artifacts that pass `--profile strict`; both correctly
construct a rejected artifact; **fewer than 5 recorded guess-points each**; and both independently
describe `authority_scope` and the escalation protocol the way the spec intends. That is evidence the
document is a specification rather than a personal notation.

**Failure evidence.** Either tester's valid-looking artifact fails validation for a reason not stated in
the docs — I predict the **YAML timestamp trap** (§3.1) hits both within the first 30 minutes, because
writing `created_at: 2026-08-27T00:00:00Z` unquoted is the obvious reading of the spec's own
`timestamps-rfc3339-utc` rule and it produces a `datetime` that fails `type: string`. Also failure:
more than 10 guess-points, or the two testers give incompatible accounts of what `authority_scope` means.
A "we could not finish in 4 hours" result is a **valid and useful** outcome, not a wasted test.

**Maximum preparation work (hard cap, ~6 hours, no spending):**

1. Bind the custom domain in GitHub Pages settings so the 57 `$id` URLs resolve over HTTPS — **or**,
   if that stalls, repoint `$id`s at the already-working `governancecommons.github.io` URL. *(This is
   the single highest-leverage fix in the entire portfolio and it is a settings change.)*
2. Quote every timestamp in `examples/` **and** add one normative sentence to `parsing_lint_rules`
   stating that timestamps are strings and parsers must not coerce them to native date types.
3. Add the 2 orphan crypto fixtures to `examples/invalid/manifest.yaml`.
4. Set the signature spec to `status: draft` (it has no implementation) so testers are not asked to
   implement an unimplementable canonicalization.
5. Reconcile the version number to one value.

Nothing else. No new docs, no site work, no tooling, no fixes to any other repo.

**Stop condition.** Stop the moment both testers have finished or hit 4 hours — whichever comes first —
and **do not fix anything mid-test**; a guess-point is data, and repairing it destroys the measurement.
Abort the entire test if prep exceeds 6 hours: that would itself be the finding, i.e. that the artifact
is not close enough to external readiness to be worth testing yet.

---

## 10. Thirty-day recommendation

**One workstream: make exactly one standard externally implementable — Agent Dossier — and run §9.**

Nothing else. Not four standards, not the website redesign, not ATP, not the compliance mappings.

**Effort cap:** ~20 hours total over 30 days. **Spending cap: $0.** No new domains, no entity, no
community launch, no paid tooling — the domain is already owned and the fix is a GitHub Pages setting.

**Sequence.**

1. **(2h)** Bind `governancecommons.org` in Pages settings and verify TLS; confirm 3 schema `$id`s return
   200 with `content-type: application/json`. If the domain cannot be bound this month, repoint `$id`s
   to the working `*.github.io` host instead. *This one fix converts 57 broken references into working
   ones and unblocks every other pathway in §7.*
2. **(4h)** Apply the §9 prep cap to `agent-dossier` only.
3. **(2h)** Recruit two independent testers.
4. **(8h)** Run the test; observe; do not intervene.
5. **(4h)** Write up the result — **including if it fails**. A documented negative result is the most
   valuable artifact this project could produce this month, because it would be the first piece of
   external evidence of any kind.

**Explicitly frozen for 30 days:**

- Agent Matrix (all of it — including the red CI, the invalid examples, the missing LICENSE, and the
  `maxItems: 5` bug; they are real but they are not this month's question)
- ONS (including the five-way version contradiction)
- APO (including the forked-schema defect C-1)
- agent-team-protocol, agent-roster
- The website beyond the domain binding in step 1
- NIST / ISO / SOC 2 mappings — **freeze in place and do not publish or cite externally** until
  re-labelled (§8)
- The PASS schema question (C-3)
- npm publication
- Any new spec, section, RFC, or repository

**Rationale.** Every finding in this audit is downstream of one gap: **no one outside the author has ever
tried to use any of this.** 788 passing tests measure internal consistency; they cannot detect that the
minimal example is unusable, that the reference implementation forked its schemas, or that the canonical
URLs are dead — all of which a single external implementer finds in an afternoon. Fixing 40 defects
without that signal risks fixing the wrong 40. Buy the signal first; it is the cheapest thing on the list.

---

## 11. Unknowns

Things I could not determine from repository inspection, and would not assert:

1. **Whether `governancecommons.org` can actually be bound.** DNS points at GitHub Pages IPs and the
   Pages API reports `"cname": null, "status": null`. I did not attempt to change settings (read-only).
   Whether this is an unverified domain, a stalled cert issuance, or a registrar/DNS problem is unknown.
2. **Why the two `governance-commons-www` repositories have disjoint history**, which is authoritative,
   and whether the public `jj-ervin` copy is intentional.
3. **Whether any private/internal system consumes these specs.** `ADOPTERS.md` is empty, but internal
   use inside `c:\dev` (e.g. Cockpit, Marlin, Cairn) would not appear there. I did not audit those repos.
4. **Whether `agent-matrix`'s red CI is known and deliberately deferred**, or unnoticed since July.
5. **Whether APO's schema fork was intentional pinning or drift.** The `$id` host (`agent-dossier.org`)
   predates the `governancecommons.org` consolidation, which suggests drift — but I cannot prove intent.
6. **Whether the ISO/NIST mappings were ever intended for external publication** or are internal
   planning aids that acquired `coverage: full` labels informally. This materially changes how damaging
   they are.
7. **Trademark status of "Governance Commons."** No filing evidence in-repo; I did not search registries,
   and the brief forbids recommending spending on one. Note the term is generically descriptive and in
   use elsewhere in the governance/commons space.
8. **Whether the author wants external adoption at all.** Much of this reads as excellent tooling for a
   solo multi-agent workflow that was subsequently given standards packaging. If external adoption is
   *not* the goal, roughly half of these findings become irrelevant and the correct action is to drop the
   standards framing rather than repair it. **I cannot determine this from the repositories, and it is
   the single question that most changes the recommendation.**
9. **Whether MCP/A2A alignment has drifted.** MCP is pinned to revision 2025-03-26 (live, but
   superseded); the A2A citation 404s. I verified the A2A `TaskState` vocabulary matches what
   `task-lifecycle.schema.json` encodes, but did not diff every binding field against current upstream.
10. **Codex's divergent findings.** Codex's audit reports auditing `agent-team-protocol`, `agent-roster`,
    and a `governance-commons-vscode` component, and reports "no tracked worktree changes." I confirmed
    clean worktrees independently. I did **not** reconcile our two reports; where we disagree, treat both
    as independent observations rather than assuming either is authoritative.
11. **Long-run CI history.** I inspected the 3 most recent runs per repo. Whether Agent Matrix has ever
    been green at HEAD since v1.4.0 is unverified.

---

## 12. Self-critique

**Did I confuse implementation with adoption?**
I checked. 788 passing tests, five working CLIs, and a live PyPI package are *implementation*, and I
scored them as such under "implementation depth" and "test strength" — not under adoption. Adoption
scores are near-zero across the board, on the separate evidence that `ADOPTERS.md` is empty, no RFCs have
been submitted, and no third-party implementation exists. The two axes are scored separately and I
declined to average them precisely to keep this error out.

**Did I confuse documentation volume with quality?**
Partly guarded against, and this is where I most had to correct myself. My first impression of the
~5000-line `agent-matrix.yaml` was favorable; testing the examples inverted it. Conversely I nearly
under-rated ONS because its subject matter is dull, then found its test suite is the best-engineered in
the family and scored it a 5 on that axis alone. Where I credit quality (the negative-fixture manifest,
the compatibility table, the CloudEvents attribute rules) I cite the specific mechanism, not the page count.

**Did I punish an early-stage project merely for being early?**
I tried hard not to, and I want to be explicit about the line I drew. Zero adopters: **not** counted
against it — that is the expected state and the brief rightly forbids it. Empty `ADOPTERS.md`: counted
as a **point in its favor**, because it is honest. ATP having no CI: not penalized, because its README
says so plainly. What I *did* penalize is a different category: shipped examples that fail their own
validator, a published schema the author's own organization violates, a reference implementation that
forked its schemas, `Stable` labels over red CI, and ~90% self-assessed ISO/NIST coverage. Those are not
symptoms of earliness — an early project with three sections and one working example would score better
on every one of them. They are claims outrunning evidence, which is the specific failure mode a standards
effort cannot afford.

**Did I accept self-declared standards status?**
No. §7 and claim 18 state that no evidence supports standards-body status, and I checked for the
concrete artifacts (IPR policy, patent policy, CLA, CoC, trademark policy, working group, submitted RFCs)
rather than reasoning from impressions. All absent. I use "specification family" and "specification"
throughout and never "standards body". I also did not let the *absence* of those artifacts contaminate my
assessment of the engineering, which is scored separately and often scored well.

**Did I suggest unnecessary new work?**
The 30-day plan proposes no new products, frameworks, entities, domains, communities, or spending, and
caps effort at 20 hours. Its largest single item is *observing two strangers use an existing artifact*.
Its second-largest is a GitHub Pages settings change. The §9 test uses an existing tagged release rather
than anything invented. The one place I recommend new writing — a public negative result — is a write-up
of a test outcome, not a new artifact. I did flag ~40 defects; I explicitly recommend fixing **five** of
them this month and freezing the rest, including several I consider serious.

**Can every important conclusion be traced?**
Spot-checking my own strongest claims: dead canonical URLs → `curl` TLS failure + `gh api …/pages`
`"cname": null`; invalid examples → per-file `agent_matrix_cli.py validate` output; forked schemas →
`diff` plus a cross-validation run producing the exact `capability_claims`/`crypto_identity` rejection;
PASS conflict → regex test over the live `passes.registry.json`; unimplemented crypto → `grep` returning
empty plus the manifest-vs-disk fixture diff; overclaimed compliance → parsed `coverage:` counts with
the MEASURE.2.8 text quoted verbatim; missing licenses → file listing per repo. Every table row carries
a path, a command result, or an external response.

**Where I am least confident:** unknowns 1, 3, and 8. If Governance Commons is internal tooling that was
given standards packaging aspirationally, this report is materially too harsh about the packaging — though
the technical defects (C-1, the version drift, the red CI) would remain real and worth fixing regardless.
