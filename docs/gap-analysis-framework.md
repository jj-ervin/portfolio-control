# Gap Analysis Framework — Eco Ecosystem

Version: 1.1  
Created: 2026-06-09  
Updated: 2026-06-09 — corrections applied from ChatGPT comparison session  
Origin: Claude synthesis across 102 source documents + ChatGPT repo-reality review  
Status: Cross-agent comparison complete. See combined synthesis at [`sessions/2026-06-09-combined-synthesis.md`](sessions/2026-06-09-combined-synthesis.md).

---

## Purpose

A reusable 12-question framework for evaluating gaps in the eco ecosystem (and any AI governance platform). Designed to be taken into any AI session — Claude, ChatGPT, Gemini, or others — for independent gap analysis and comparison.

---

## The Stranger Test

Before applying the 12 questions, apply this single-sentence test first. It collapses Q6/Q7/Q8/Q10/Q11 into one observable outcome and is the hardest question to answer honestly:

> **Can a stranger install this, run it, produce evidence, verify that evidence, and trust the release artifact?**

If the answer is no, or "not without asking someone," all other gap work is secondary. The 12 questions tell you *what* to fix. The stranger test tells you *whether you're done*.

---

## Eco Ecosystem Context (for independent AI sessions)

The eco ecosystem is an AI governance platform with these components:

- **eco** — core runtime/platform. Key primitives: CAPS packs (capability packs loaded/unloaded at runtime), HAL adapters (hardware abstraction for edge), NEHI (safety gates / policy enforcement), LASSO (agent orchestration), PASS (Planned Action Stage States — the governance/audit trail system). eco sits ABOVE MCP (Model Context Protocol) as the orchestration and governance layer. Currently mid-migration; production safety gates are declared as future work (SEC.00).
- **eco-edge** — physical/edge AI integration (Track A). Has the clearest install/use story in the ecosystem today; the better proof surface for eco's architecture.
- **governance-commons** — shared governance artifacts: agent-dossier (per-agent identity and capability specs), agent-matrix (multi-agent coordination standard), ONS (Object Naming Standard), project-orchestrator-agent. Spec/schema/test-vector quality is high; release mechanics (publishing, provenance, conformance packaging) are the remaining gaps.
- **DCP / .eco** — Device Control Plane / runtime kernel — the local execution substrate; local-first, sovereign compute.
- **dxp-org** — workspace normalization and portfolio control-plane planning repo. Best asset: OSS 5-minute readiness doctrine. Currently a planning repo, not a product repo. Core value proposition is stranger-proof onboarding; still needs to prove that loop outside the author's own machine.
- **eos** — runtime services.

Design philosophy: governance baked into the protocol layer; local-first execution; eco as a standard (like HTTP or Kubernetes), not a product.

---

## Gap Completion States

When evaluating a gap, distinguish between these states. A gap is not closed until it reaches **runtime-complete**:

| State | Meaning | Example |
|---|---|---|
| `open` | Not started or only informally described | A gap mentioned in planning docs with no implementation |
| `spec-complete` | A spec, schema, or test-vector exists | JSON schema written; RFC draft exists; test vectors defined |
| `release-complete` | Spec is published, packaged, and installable | PyPI package published; GitHub release with SBOM attached |
| `runtime-complete` | Mechanism runs, emits observable signals, and is tested | CI enforces it; telemetry fires; a test would fail if it broke |

The most common false closure: calling a gap "done" when it is spec-complete but not release-complete or runtime-complete. Governance-commons has many gaps in this state as of 2026-06-09.

---

## The 12 Gap Questions

Use these questions to evaluate any system, component, or feature area. Apply to eco, governance-commons, DCP, and dxp-org individually and as a whole.

---

### Q1 — Regulatory Compliance
**What laws or regulations does this violate or leave unaddressed?**

Target areas: EU AI Act (entered into force August 1, 2024; generally fully applicable **August 2, 2026**), GDPR data subject rights, US state laws (Colorado SB26-189 — revised ADMT regime effective **January 1, 2027**, replacing the earlier SB-205; CA/NY ADM transparency requirements; Delaware neural data expansion), OECD AI Principles, antitrust (AI bundling), training-data licensing (CNN v. Perplexity precedent), NIST GenAI profile.

> **Correction from v1.0:** Colorado enforcement date was previously listed as 2026. SB26-189 superseded SB-205; the revised ADMT regime is January 1, 2027. EU AI Act August 2026 date is confirmed correct.

*A system can be NIST-compliant and still be legally non-compliant. These are different gap types.*

---

### Q2 — Standards Compliance
**What formal standards (ISO, NIST, RFC, IETF) does this not conform to?**

Target areas: ISO 42001 (AI Management Systems), NIST AI RMF, RFC 2119 (normative language in specs), SLSA (build provenance), SPDX/CycloneDX (SBOM), AIBOM, OpenTelemetry semantic conventions, CloudEvents (CNCF), JWT/OIDC (agent identity), SOC 2 Type II.

*Conformance to formal standards is distinct from "doing things the right way." Standards are cited in procurement documents and legal audits.*

---

### Q3 — Industry Standard (De Facto)
**What is widely adopted across the industry that we don't implement?**

Target areas: OpenTelemetry for observability, CloudEvents for event envelopes, MCP (Model Context Protocol) as I/O layer, A2A (Google Agent-to-Agent protocol, April 2025), JWT/OIDC for identity, Kustomize-style overlay composability, YAML-first declarative configuration, GitOps, serverless execution semantics, content-addressed artifact identifiers.

*De facto standards aren't written by standards bodies but are adoption blockers if missing.*

---

### Q4 — Industry Best Practice
**What do well-run teams building at this level do that we don't?**

Target areas: continuous adversarial verification (not just pre-deployment gates), steady-state contracts per module, fault injection as a native capability, metadata maturity admission gates, deletion cascade engines, network-layer (non-bypassable) policy enforcement, content-addressed compiled artifacts, dreaming-loop memory consolidation, multi-provider model routing, matrix composability (overlay/profile system).

*Best practices are the gap between "it works" and "it's production-hardened."*

---

### Q5 — Security Posture
**What is the attack surface, has it been threat-modeled, what's the blast radius of a compromise?**

Target areas: prompt injection (OWASP #1 AI risk) — hidden instructions in HTML comments, CSS, metadata, image alt text; confusable deputy attacks; supply-chain compromise (SLSA Level 0 artifacts); agent permission accumulation; hardcoded credentials/paths; replay/forgery-vulnerable handoff envelopes; ungoverned autonomy expansion; fine-tuning-induced safety regression; PKI and key discovery gaps; revocation propagation.

*Design-time best practice and runtime security posture are different. Threat modeling is a specific artifact, not an attitude.*

---

### Q6 — Operational Maturity
**What breaks at 2am and does no one know what to do?**

Target areas: long-running agent failure recovery; self-healing health loops; thermal/load-aware scheduling; checkpointing for resumable execution; runbooks; SLOs and error budgets; rollback procedures; incident postmortem schema; blast-radius minimization procedures; resilience gates as pre-flight checks; GitOps-native chaos hooks blocking environment promotion.

*Operationally immature systems work in demos and break in production.*

---

### Q7 — Developer Experience / Adoption Friction
**Where does adoption stall for a new user?**

Target areas: PyPI/npm packages not published (requires cloning repo); TypeScript and Go SDKs missing (Python-only); no LSP/editor tooling for ONS or governance specs; no getting-started guide under 15 minutes; no conformance test suite; no "hello world" agent that uses governance-commons end-to-end; CAPS pack authoring friction; no sandbox environment; installer lacks dry-run/manifest/audit output.

*Adoption friction is often invisible to the builders. The question is: what does a developer who has never heard of eco need to do to ship their first governed agent?*

---

### Q8 — Ecosystem Interoperability
**What do target users already have installed that we don't work with?**

Target areas: LangChain, AutoGen, CrewAI, LlamaIndex, Semantic Kernel (existing agent frameworks); Kafka, EventBridge, Pub/Sub (existing event buses); Kubernetes / Helm (existing deployment infrastructure); Prometheus/Grafana (existing observability stacks); OIDC providers (existing identity infrastructure); VS Code / JetBrains (existing IDE tooling); GitHub Actions / GitLab CI (existing CI/CD pipelines); Codex, Copilot, Cursor (AI coding tools the target user is already running).

*The question is not "do we have our own version of this" but "do we interoperate with the version they already have."*

---

### Q9 — Organizational / Process Maturity
**What process or governance structure is missing that blocks external adoption?**

Target areas: RFC/proposal process (external contribution path); WG or steering committee structure; conformance certification program (badge, registry, test vectors); versioned deprecation policy; security disclosure process; public roadmap with commitment levels; community forum or issue triage policy; governance-of-governance (who governs governance-commons?); maintainer roles and succession.

*For a governance standard, the absence of a governance process for the standard itself is a first-order credibility problem.*

---

### Q10 — Documentation / Discoverability
**What can't someone find or understand without insider knowledge?**

Target areas: no unified architecture diagram; no glossary of terms (CAPS, HAL, NEHI, LASSO, PASS are undefined for newcomers); specs that reference each other without a reading order; ONS spec assumes familiarity with the cluster hierarchy; agent-dossier format not discoverable without reading source; no "why eco instead of X" positioning document; no migration guide from raw LangChain/AutoGen to eco-governed agents; "which repo do I need?" guide missing; active-vs-legacy doc map missing.

*Great architecture with poor discoverability is effectively absent from the ecosystem.*

---

### Q11 — Testing Strategy
**What failure modes are we not detecting?**

Target areas: conformance test suite not packaged (`gc-conformance-suite` with fixtures across dossier, matrix, ONS, APO); no property-based testing for governance invariants; no fuzz testing for prompt injection surfaces; no chaos engineering harness; no adversarial simulation (red team); no performance regression detection; no cross-provider model behavior consistency testing; timestamp-embedded compiled artifacts break reproducibility verification; installer has no systematic test suite (blank project, existing files, force mode, bad path).

*Test coverage percentage is a proxy metric. The real question is: which failure modes would survive your current test suite?*

---

### Q12 — Ahead of the Curve
**What could we ship that would define the category before anyone else names it?**

Target areas: constitutional governance layer (`constitution.yaml`) — inviolable rules cryptographically committed at project inception; Language Server Protocol for ONS (no naming standard has ever shipped one); governance diff + audit replay tied to PASS (standard format for diffing governance states; replaying past decisions against new policy — recommended Q12 pick for eco); federated agent trust network (inter-org trust without sharing internal policy); temporal governance with quorum-required renewal; human-agent teaming protocol (formal spec for human principals entering/exiting agentic loops); economic governance / FinOps binding (cost overruns trigger governance escalations); operator upskilling as a workflow output (skill delta as first-class telemetry); regulatory sandbox participation as organizational strategy.

---

## Gap Closure Verification

For each gap identified, a gap is not closed until:

1. **There is a mechanism** — not a document saying it should exist, but code, schema, or spec that enforces it
2. **The mechanism is tested** — a test exists that would fail if the mechanism broke
3. **The mechanism is observable** — a governance signal (telemetry, audit record, or validation output) is emitted when the mechanism runs
4. **The mechanism is discoverable** — someone new to the system can find and understand it without insider knowledge

A governance rule that exists only as documentation is not a governance rule. It is a wish.

---

## Current Gap Inventory (updated 2026-06-09 after cross-agent synthesis)

See full synthesis at [`sessions/2026-06-09-combined-synthesis.md`](sessions/2026-06-09-combined-synthesis.md).

**Status column key:** `open` | `spec-complete` | `release-complete` | `runtime-complete`  
Spec-complete means a schema, spec, or test-vector exists but is not yet published/packaged/enforced.

### Tier 1 — Standards Compliance Gaps

| Gap | Repo | Status | Blocking |
| --- | --- | --- | --- |
| SLSA Level 1+ build provenance | all repos | open | Enterprise security questionnaires |
| SBOM (SPDX / CycloneDX) | all published artifacts | open | Supply-chain audits |
| AIBOM generation | eco / agent-dossier | open | Multi-agent delegation trust |
| PyPI + npm published packages | governance-commons | open | Ecosystem visibility |
| TypeScript + Go SDKs | governance-commons | open | Enterprise adoption |
| ADM transparency schema | eco | open | CA, CO, NY law; EU AI Act August 2026 |
| GDPR data subject rights + retention | governance-commons | open | GDPR compliance surface |
| Agent revocation + expiry model | agent-dossier | open | Compromised agent containment |
| Steering / WG structure | governance-commons | open | Enterprise dependency listing |
| Full governance record schema | governance-commons | spec-complete (partial) | Machine-checkable PASS contracts |
| RFC 2119 normative language in ONS | governance-commons | spec-complete | External citation, formal adoption |
| RFC/proposal process | governance-commons | spec-complete | External contribution path |
| Conformance certification program | governance-commons | spec-complete | "Conformant" has no verifiable meaning |
| ISO 42001 control mapping | governance-commons | spec-complete | Enterprise procurement |
| SOC 2 Type II control mapping | governance-commons | spec-complete | Enterprise procurement |
| OpenTelemetry semantic conventions | governance-commons | spec-complete | Observability ecosystem interop |
| CloudEvents event envelope | governance-commons | spec-complete | Event bus interoperability |
| Cryptographic envelope signing (JWS/Ed25519) | governance-commons | spec-complete | Audit validity; replay/forgery prevention |
| Multi-provider SKU routing in agent-matrix | governance-commons | spec-complete | Heterogeneous adoption |
| Matrix overlay/profile system | governance-commons | spec-complete | Adoption/composability |
| Agent registry spec | governance-commons | spec-complete | Runtime agent discovery |
| A2A protocol binding | governance-commons | spec-complete | Cross-vendor agent coordination |
| MCP integration | governance-commons | spec-complete | Protocol interoperability |
| STRIDE threat model | governance-commons | spec-complete | Security posture documentation |
| Prompt-injection test vectors | governance-commons | spec-complete | Security testing surface |

> **Note:** Items marked `spec-complete` for governance-commons were confirmed by ChatGPT repo review (2026-06-09). They are NOT open gaps — they are release/runtime gaps. The work needed is publication, packaging, and runtime enforcement, not design.

### Tier 2 — Best Practice Gaps (hardening and completeness)

| Gap | Repo | Status |
|---|---|---|
| Continuous Verification Loop (CVL) | eco | open |
| Prompt Firewall as constitutional layer | eco | open |
| Network-layer (non-bypassable) enforcement | eco | open |
| Steady-state contracts as module admission gate | eco / DCP | open |
| Fault injection as a native DCP capability | DCP | open |
| Dreaming loop for memory consolidation | eco / DCP | open |
| Resilience Gate as pre-flight check | eco | open |
| Metadata maturity admission gate | eco | open |
| Deletion cascade engine | eco | open |
| Content-addressed compiled artifacts | DCP | open |
| Formal Reasoning Contract (FRC) per component | eco | open |
| eco.compute.profile (hardware introspection) | DCP | open |
| Edge/offline governance profile | DCP | open |
| Heartbeat contracts for long-running tasks | DCP / governance-commons | open |
| Multi-island evolution pattern | eco | open |
| Jurisdiction-adaptive policy compiler | eco | open |
| Event-driven execution substrate | DCP | open |
| One reference integration (MCP → CloudEvent/OTel → PASS) | eco | open |
| gc-conformance-suite packaged with fixtures | governance-commons | open |
| Reference verifier service (signed evidence + audit chains) | governance-commons | open |
| PKI / key discovery / revocation propagation | governance-commons | open |
| Runbooks: validator failure, compromised key, revoked agent | governance-commons | open |
| dxp-org installer: dry-run, manifest, checksum, overwrite safety | dxp-org | open |
| dxp-org: 5-minute readiness test automated as script/fixture | dxp-org | open |
| dxp-org: repo disposition table + archive policy complete | dxp-org | open |
| dxp-org: installer tests (blank project, force mode, bad path) | dxp-org | open |

### Tier 3 — Ahead-of-Industry Opportunities (category-defining)

| Gap | Repo | Why Novel |
|---|---|---|
| Governance diff + audit replay tied to PASS | eco | No industry parallel; recommended Q12 pick for eco |
| Constitutional governance layer (`constitution.yaml`) | governance-commons | No framework has cryptographically-committed inviolable rules |
| Human-Agent Teaming Protocol | governance-commons / eco | No formal spec for human principals entering/exiting agentic loops |
| Federated Agent Trust Network | governance-commons | Inter-org trust without sharing internal policy |
| Temporal governance (`authority_window`) | governance-commons | Time-bounded authority with quorum-required renewal |
| Language Server Protocol for ONS | governance-commons | No naming standard has ever shipped an LSP |
| Global cluster registry as a governed service | governance-commons | No queryable registry of registered clusters |
| Economic governance / FinOps binding | eco | No framework connects FinOps to agent governance escalations |
| Operator upskilling as a workflow output | eco | Skill delta as first-class telemetry metric |
| Context-specific truth domains as named primitives | eco | Formalizes what eco already has architecturally |
| ADM transparency schema | eco | Regulatory necessity + differentiator |
| Regulatory sandbox participation | organizational | No open-source framework occupies this position yet |
| dxp-org as governance starter kit adoption funnel | dxp-org | Smallest lovable entry point routing serious users to GC/DCP |

---

## Q1-Q12 Matrix by Repo (from ChatGPT repo review, 2026-06-09)

### eco

| Q | Priority | Gap | Suggested Action |
| --- | --- | --- | --- |
| Q1 Regulatory | Critical | ADM/GDPR/EU AI Act not yet a release gate | Add regulatory classification, data-retention, ADM transparency as admission criteria to RELEASE-PLAN.md |
| Q2 Standards | Critical | SLSA/SBOM, OTel conventions, ISO/SOC2 not productized | Add release workflows for SBOM/provenance; map runtime events to `eco.*` OTel profile |
| Q3 De Facto | High | MCP/A2A/CloudEvents in planning, not runtime | Build one reference integration: MCP call → eco governance → CloudEvent/OTel trace → PASS record |
| Q4 Best Practice | Critical | SEC.00, Resilience Gate, CVL, prompt firewall, NEHI migration open | Prioritize SEC.00, RT.10, NEHI.02 before any production positioning |
| Q5 Security | Critical | Safety gate minimal; HMAC in edge paths, not JWS/Ed25519 everywhere | Define unified trust/envelope model across edge, cloud, PASS, and agent handoffs |
| Q6 Ops | High | Recovery/self-heal mid-migration; runbooks/SLO not release-gated | Add operational readiness checklist: runbooks, rollback, SLOs, failure drills, checkpoint restore |
| Q7 DevEx | High | Root eco is migration-era; eco-edge is clearer | Make eco-edge the first installable proof path; add root 5-minute "governed run" quickstart |
| Q8 Interop | High | Needs proof with Kubernetes, Prometheus/Grafana, GitHub Actions, OIDC | Ship adapters/templates for one CI path and one observability path first |
| Q9 Process | Medium | Public RFC/security disclosure/release channels unclear for eco | Mirror governance-commons RFC/security/release process for eco |
| Q10 Docs | High | Architecture deep but hard to enter; migration-era docs create confusion | Add "read this first," glossary, architecture diagram, active-vs-legacy map |
| Q11 Testing | High | Tests exist but missing adversarial/fuzz/conformance/chaos/reproducibility gates | Create release test suite organized by failure mode, not module |
| Q12 Ahead | High | Constitutional layer, FinOps governance, audit replay scattered | Pick governance diff + audit replay tied to PASS as the v1 category-defining feature |

### governance-commons

| Q | Priority | Gap | Suggested Action |
| --- | --- | --- | --- |
| Q1 Regulatory | High | Has mappings/evidence schema; not full legal compliance workflow | Add jurisdiction profiles: EU AI Act, GDPR, CO ADMT 2027, CA/NY transparency |
| Q2 Standards | High | ISO/NIST/SOC2/OTel/CloudEvents progress strong; SLSA/SBOM still open | Finish SLSA provenance, SBOM, release attestations for all published packages |
| Q3 De Facto | Medium | MCP/A2A/CloudEvents specified and tested; external adoption proof missing | Publish examples running against real MCP/CloudEvents tooling, not just schemas |
| Q4 Best Practice | Medium | Strong schemas/test vectors; fewer live reference services | Build reference verifier service for signed evidence, conformance, and audit chains |
| Q5 Security | High | STRIDE, zero-trust, JWS/Ed25519, revocation exist; PKI/federated trust immature | Define key discovery, revocation propagation, trust-anchor registry |
| Q6 Ops | Medium | Governance of operations exists; no public operational service model | Add runbooks for validator failure, compromised key, revoked agent, broken evidence chain |
| Q7 DevEx | High | SDK exists locally; publishing and first-user install path open | Finish PyPI/npm publish and 5-minute governed-agent example |
| Q8 Interop | Medium | Good protocol coverage; still needs "works with your stack" proof | Add GitHub Actions, Prometheus/Grafana, OIDC, LangChain/AutoGen/CrewAI examples |
| Q9 Process | Medium | RFC and conformance exist; steering/WG not established | Create lightweight working groups or maintainer roles before enterprise claims |
| Q10 Docs | Medium | Improved, but umbrella vs nested spec repos confuse newcomers | Add ecosystem map and "which repo do I need?" guide |
| Q11 Testing | Medium | ONS/matrix/SDK have tests; cross-spec conformance suite needs packaging | Create `gc-conformance-suite` with fixtures across dossier, matrix, ONS, APO |
| Q12 Ahead | High | Best-positioned repo for category-defining work | Prioritize constitutional governance, federated trust, temporal authority, audit replay as optional PASS-6 profiles |

### dxp-org

| Q | Priority | Gap | Suggested Action |
| --- | --- | --- | --- |
| Q1 Regulatory | Medium | Not a regulated AI system; may govern regulated repos | Add template fields for data class, regulated domain, AI/ADM use, retention, owner |
| Q2 Standards | Medium | ONS naming thinking exists; no SLSA/SBOM/conformance release posture | Add OSS release checklist requiring license, SBOM, provenance, security policy |
| Q3 De Facto | High | Needs GitHub Actions, package managers, shell portability, editor/tool integration | Make `.governance` installer work cleanly from a fresh clone; add CI validation |
| Q4 Best Practice | High | Good 5-minute readiness doctrine; missing automated proof | Turn readiness test into a script/test fixture |
| Q5 Security | Medium | Installer copies governance files; lacks overwrite/preview/audit depth | Add dry-run, manifest of created files, checksum/log output, safer overwrite behavior |
| Q6 Ops | Medium | Workspace state still being normalized; registry/status proof incomplete | Finish DCP registry coverage and status validation across active repos |
| Q7 DevEx | Critical | Core value proposition; still needs stranger-proof onboarding | Run 5-minute test in an empty temp project; fix every stumble |
| Q8 Interop | High | Should integrate with Codex, Claude, Copilot, Cursor, GitHub Actions, VS Code | Keep `.governance` tiny but add tested templates for each tool |
| Q9 Process | Medium | Active/scaffold/archive dispositions still in progress | Complete repo disposition table and archive policy |
| Q10 Docs | High | README explains naming normalization, not product value | Replace root README with "what this is, install, first result, next step" |
| Q11 Testing | High | No visible systematic test suite for installer/readiness | Add installer tests: blank project, existing files, force mode, template mode, bad path |
| Q12 Ahead | Medium | Could become governance starter kit adoption funnel | Make `.governance` the smallest lovable entry point; route serious users to GC/DCP |

---

## Combined Priority Order (Claude + ChatGPT synthesis, 2026-06-09)

1. **Ship governance-commons release mechanics** — PyPI/npm, SLSA/SBOM, tags, release notes, website, `gc-conformance-suite` packaged. The spec work is done; ship the public release before adding Pass6 features.
2. **Make eco-edge the working proof surface** — one complete path: MCP tool call → eco governance → CloudEvent/OTel trace → PASS record → signed evidence bundle. This is the demo that proves the architecture is real.
3. **Make dxp-org/.governance pass the stranger test** — run in an empty temp project, fix every stumble, automate the readiness test.
4. **Close eco production blockers** — SEC.00, RT.10, NEHI.02, unified trust/envelope model, operational readiness checklist. These gate any production positioning claim.
5. **Ahead-of-curve (Phase 2)** — governance diff + audit replay tied to PASS (Q12 for eco); constitutional governance layer (Q12 for governance-commons); temporal governance, federated trust, FinOps binding after these.

---

## ChatGPT Comparison Prompt (v1.1)

Copy the block below into a ChatGPT session. Updated to include dxp-org and eco-edge distinction.

---

```
I'm building an AI governance platform ecosystem. Here is the current state:

Repos:
- eco — core runtime/platform: CAPS packs (capability packs), HAL adapters (hardware abstraction), NEHI (safety gates), LASSO (agent orchestration), PASS (governance/audit trail). eco sits ABOVE MCP as the orchestration and governance layer. Currently mid-migration; production safety gates are future work (SEC.00).
- eco-edge — physical/edge AI integration. Has the clearest install/use story in the ecosystem today.
- governance-commons — shared governance artifacts: agent-dossier (agent identity/capability specs), agent-matrix (multi-agent coordination standard), ONS (Object Naming Standard). Spec quality is high; release mechanics are the remaining gaps.
- DCP (.eco) — Device Control Plane / runtime kernel — local-first, sovereign compute substrate.
- dxp-org — workspace normalization and portfolio control-plane planning repo. Best asset: OSS 5-minute readiness doctrine. Still a planning repo, not a product repo.

Design philosophy: governance baked into the protocol layer; local-first execution; eco as a standard (like HTTP or Kubernetes), not a product.

Please evaluate this ecosystem against each of the following 12 gap categories. For each repo (eco, governance-commons, DCP, dxp-org), give me:
1. What specific gaps you see
2. What the industry or regulatory expectation actually is
3. Priority (Critical / High / Medium / Low)
4. Whether any of these are "ahead of the curve" opportunities
5. Whether a gap is open, spec-complete (spec exists but not published), release-complete (published but not runtime-enforced), or runtime-complete

The 12 gap categories:

Q1 — Regulatory Compliance: EU AI Act (fully applicable August 2, 2026), GDPR, Colorado SB26-189 (ADMT regime January 1, 2027), CA/NY transparency requirements, OECD, antitrust

Q2 — Standards Compliance: ISO 42001, NIST AI RMF, RFC 2119, SLSA, SBOM (SPDX/CycloneDX), AIBOM, OpenTelemetry, CloudEvents, SOC 2

Q3 — Industry Standard (De Facto): OpenTelemetry, CloudEvents, MCP, A2A (Google, April 2025), JWT/OIDC, GitOps, serverless semantics, content-addressed artifacts

Q4 — Industry Best Practice: continuous adversarial verification, steady-state contracts, fault injection, metadata maturity gates, network-layer enforcement, memory consolidation, multi-provider routing

Q5 — Security Posture: attack surface, threat model, blast radius — prompt injection, supply-chain, replay/forgery, permission accumulation, fine-tuning safety regression, PKI gaps

Q6 — Operational Maturity: what breaks at 2am — runbooks, SLOs, checkpointing, self-heal, resilience gates, chaos hooks

Q7 — Developer Experience: where adoption stalls — PyPI/npm, SDKs, LSP tooling, stranger-proof quickstart, conformance test suite

Q8 — Ecosystem Interoperability: what target users already have — LangChain, AutoGen, Kafka, Kubernetes, Prometheus/Grafana, OIDC providers, GitHub Actions, Codex/Copilot/Cursor

Q9 — Organizational / Process Maturity: RFC process, WG/steering committee, conformance certification, security disclosure, governance-of-governance

Q10 — Documentation / Discoverability: architecture diagram, glossary, reading order, positioning doc, active-vs-legacy map, migration guides, "which repo do I need?"

Q11 — Testing Strategy: conformance test suite (gc-conformance-suite), property-based testing, fuzz testing for prompt injection, chaos harness, adversarial simulation, installer tests, reproducibility verification

Q12 — Ahead of the Curve: governance diff + audit replay tied to PASS, constitutional governance layer, Language Server Protocol for ONS, federated agent trust network, temporal governance, human-agent teaming protocol, FinOps binding, regulatory sandbox participation

Be specific and critical. I want gaps I haven't thought of, not validation of what I've already built.
```

---

## See Also

- [`sessions/2026-06-09-research-synthesis.md`](sessions/2026-06-09-research-synthesis.md) — original Claude synthesis across 102 sources
- [`sessions/2026-06-09-combined-synthesis.md`](sessions/2026-06-09-combined-synthesis.md) — combined Claude + ChatGPT synthesis with corrections
- [`c:\dev\eco\DEV-RELEASE.md`](../../eco/DEV-RELEASE.md) — release plan (stub; to be populated from this synthesis)
- [`c:\dev\eco\DEV-PLAN.md`](../../eco/DEV-PLAN.md) — canonical eco execution plan
