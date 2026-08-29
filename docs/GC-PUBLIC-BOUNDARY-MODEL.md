# Governance Commons Public Boundary Model

Status: Draft; proposed charter clarification and amendment map
Date: 2026-08-28
Publication: Not effective public doctrine until G-1 through G-5 of the Activation and Publication Gate are verified. RFC acceptance authorizes the transition; it does not activate it.
Graduation path: If adopted, the amendment map in the final section becomes the boundary-model RFC under the existing `rfcs/RFC-PROCESS.md`, at a path of the form `governance-commons/rfcs/RFC-NNNN-public-boundary-model.md`. The number is not assigned until the process issue is opened; this document refers to it as **proposed RFC-0001** and must not imply the number is held.

Purpose: Define the public boundaries of Governance Commons without overriding existing charter, naming, release, or conformance rules.

## Scope Note

This document is a draft boundary model. It does not create a new naming authority, release policy, conformance program, or adoption claim.

Where this document conflicts with existing charter entries, release manifests, schemas, or governance records, the conflict should be treated as a proposed clarification or amendment, not as an automatic override. The Proposed Amendments section at the end lists each conflict explicitly and routes it through the existing RFC process rather than a new one.

## Core Position

Governance Commons is the public standards and social mission umbrella for independently adoptable AI governance specifications.

It is not a single runtime, SDK, website, repository, package, validator, or required toolchain.

A user should be able to adopt one Governance Commons specification without claiming adoption of the entire Governance Commons ecosystem.

Preferred language:

> This project uses Agent Dossier, a Governance Commons specification.

Avoid required all-or-nothing language:

> This project has adopted Governance Commons.

## Layer Model

### 1. Public Umbrella

Governance Commons is the public-facing commons: the mission, standards home, shared vocabulary, publication identity, and social impact frame.

It is what people cite when a specification, method, profile, or tool belongs to the GC ecosystem.

### 2. Independently Adoptable Specifications

Component specifications are the primary adoption units.

Current or candidate components include:

- Agent Dossier: agent identity, provenance, authority, expiry, and revocation.
- Agent Matrix: agent roles, routing, capability matching, workflow structure, and cost/SKU-aware coordination.
- ONS: namespace and identifier structure.

Potential future or clarification-needed components:

- PASS: currently an internal governance/evidence practice; not yet externally adoptable as a stable public specification.
- Accord: currently an internal maintainer/agent onboarding protocol; not an external adoption unit.
- Agent Project Orchestrator: currently appears closer to a reference runtime/application than a specification; if existing charter text classifies it as a standard, that should be reviewed explicitly.
- Agent Team Protocol: specification-shaped and pre-release by its own README, but not enumerated in the charter's standards family, and its trust model does not currently reconcile with Agent Matrix. Classification and reconciliation both need review.
- Agent Roster: appears to be maintainer or reference tooling rather than a specification. Classification needs confirming.

### 3. Reference Tooling

GC Toolkit is the preferred public name for optional reference tooling.

Tooling may include SDKs, CLIs, validators, runtime helpers, schema checkers, and package integrations. "SDK" remains a useful implementation term for a language-specific package; it is not the public name of the tooling layer.

The tooling helps users validate, inspect, or produce GC-compatible artifacts. It is not Governance Commons itself.

Preferred language:

> GC Toolkit validates Governance Commons specifications.

Avoid broad package language:

> Install Governance Commons.

Existing exception:

The PyPI package `governance-commons` already exists as a published reference-tooling package. That package should be treated as a transitional/current exception unless and until it is renamed, aliased, or clarified through a release plan.

Future package names should avoid making the installable tool appear identical to the public umbrella.

### 4. Website And Publication Infrastructure

`governancecommons.org` is the intended public publication surface.

Website repositories such as `governance-commons-www` are implementation infrastructure. They should not be treated as standards source-of-truth unless a specific artifact is explicitly designated as website-authored.

The website should clearly distinguish:

- published standards,
- draft standards,
- schemas,
- release manifests,
- conformance profiles,
- reference tooling,
- governance/process documents,
- community or social mission material.

### 5. Maintainer Workspace

The local or private `governance-commons` workspace is maintainer infrastructure.

It may contain planning records, release records, private coordination, experiments, scripts, generated artifacts, and cross-repository governance material.

It should not be presented publicly as the product a user adopts.

## Current Adoptability

This table is intentionally conservative. It describes what a careful outside user could reasonably adopt or verify today, and names the hardest blocker per component rather than the most easily fixed one.

| Component | Current public posture | Adoptability today | Main blocker |
| --- | --- | --- | --- |
| Agent Dossier | Specification and release exist | Partial | Canonical `$id` / schema URLs are unreachable over `governancecommons.org` (TLS verification fails), so the published schemas cannot be fetched or `$ref`-resolved. Examples additionally depend on non-standard YAML timestamp handling. |
| Agent Matrix | Specification and release exist | Not cleanly adoptable | No LICENSE file in the repository despite MIT claimed elsewhere — this stops most organizational adoption before any technical review. Shipped examples also fail the repository's own validator, and CI is failing at HEAD. |
| ONS | Specification and release exist | Strongest current candidate | Version and documentation alignment still needs cleanup; the README, canonical YAML, schemas, and release currently disagree. |
| PASS | Internal governance/evidence practice | Not externally adoptable yet | Internal PASS identifiers and the published PASS schema disagree, so the public format does not describe actual practice. |
| Accord | Internal maintainer/agent protocol | Not externally adoptable | It governs the GC maintainer workspace, not outside adopters. |
| Agent Project Orchestrator | Reference/runtime candidate | Not a clean specification adoption unit | Boundary with standards needs clarification; it also validates against vendored schema copies rather than the published ones. |
| Agent Team Protocol | Pre-release specification candidate | Not adoptable yet | Declares that it consumes Agent Matrix, but defines `trust_levels` as role names against Matrix's ordinal `T0`–`T4` scale. Conflict unresolved. No CI or reference implementation. |
| Agent Roster | Maintainer/reference tooling | Not a specification adoption unit | Layer classification unconfirmed — likely Layer 3 or Layer 5, not Layer 2. |
| GC Toolkit | Reference tooling | Partial | `gc-validate` does not currently verify Agent Dossier or Agent Matrix; it covers ONS and capability contracts only. Public docs and package availability remain inconsistent across ecosystems. |
| Governance Commons umbrella | Public mission and standards home | Citeable, not directly adoptable | Adoption should happen through component specifications or named profiles. |

## Adoption Model

Governance Commons adoption should be modular.

Valid adoption claims should be scoped and specific, such as:

- Agent Dossier compatible
- Agent Matrix compatible
- ONS compatible
- uses GC Toolkit for validation
- implements a named Governance Commons conformance profile

A project should not imply full Governance Commons conformance unless every required component, schema, evidence record, and runtime behavior for that profile has been verified.

If no tool currently exists to verify a claim, the claim should be marked as manual, provisional, or not yet verifiable.

## Human-Governance Purpose

Governance Commons is intended to become a sociotechnical standards project for AI-human work governance.

The current specifications help answer some questions today:

- Who or what is acting?
- What authority was declared?
- What tools or systems were allowed?
- What namespace or identifier is being used?
- What expiry or revocation state is declared?

Partially supported today:

- What evidence or record supports a claim? Evidence records and reports exist, but public PASS schema and conformance coverage are incomplete.

Other questions belong to the intended roadmap and are not yet fully supported by published specifications:

- Who approved the action in a human-legible way?
- How are disputes, appeals, overrides, and exceptions handled?
- How are affected workers or teams represented?
- How does agentic automation affect accountability, opportunity, displacement, and workplace experience?
- How can external participants influence governance without relying on a single maintainer?

The technical work is being shaped to serve these questions, but several of them are not yet addressed by any published specification.

## Naming Guidance

Recommended public language:

- Governance Commons: public umbrella, mission, and standards home.
- Governance Commons specifications: the standards family.
- Agent Dossier, Agent Matrix, ONS: component-level adoption units.
- GC Toolkit: optional reference tooling.
- SDK: implementation term for language-specific packages.
- `gc-*` commands: current CLI command family.
- `governancecommons.org`: public publication site.

Avoid using Governance Commons to mean:

- a local maintainer workspace,
- a Python package,
- an npm package,
- a runtime,
- a website repo,
- a single validator,
- a required platform.

CLI note:

The current command family uses names such as `gc-validate`, `gc-report`, and `gc-discover`. A future `gc` umbrella command may be considered, but `gc` is a contested short binary name and should not be assumed without a naming review.

## Release Guidance

Umbrella GC release versions should be generated or validated from component compatibility data wherever possible, rather than manually maintained as independent truth.

This keeps the adopter benefit of a citable milestone without asking a maintainer to hold six version coordinates in sync by hand. Where a compatibility table already exists in a component specification, that table should be the source and the umbrella version should be derived from it.

Component specifications may have their own versions.

Schemas, SDKs, CLIs, websites, and reference runtimes may also have their own versions.

A public release matrix should distinguish:

- umbrella GC release version,
- component specification versions,
- schema versions and URLs,
- package/toolkit versions,
- reference runtime versions,
- website publication commit or version.

If this conflicts with existing charter language, release manifests, or compatibility tables, the conflict should be resolved through an explicit charter or release-policy amendment. See Proposed Amendments.

## Boundary Rule

Governance Commons is the place and promise.

Specifications are what people adopt.

Tooling is what people install.

The website is where people learn and verify.

The maintainer workspace is where the work is coordinated.

These layers should remain distinct in public language, documentation, package naming, release notes, and conformance claims.

## Proposed Amendments

This draft is not binding. To make it binding, the following charter or release-policy changes would need explicit approval.

Governance Commons already has a mechanism for this. `rfcs/RFC-PROCESS.md` is Active at AL:2 and requires an RFC for, among other things, "adding or removing a spec from the GC release manifest" and "changing the authority model." Two of the amendments below fall squarely inside that trigger. This document therefore proposes no new approval process; it routes through the one that exists and currently has no submissions.

Charter entries at AL:3 additionally require founding-maintainer approval and a new charter entry per `GC-CHARTER-001`.

| # | Target | Decision required | Route | If unresolved |
| --- | --- | --- | --- | --- |
| A-1 | `GC-CHARTER-004` | Is Agent Project Orchestrator a standard or a reference runtime? The charter currently enumerates it in the standards family; this document classifies it as a runtime candidate. | RFC required — removing a spec from the release manifest is an explicit RFC trigger. AL:3 charter amendment also needed. | The website, the charter, and this boundary model continue to disagree about how many standards exist. |
| A-2 | `GC-CHARTER-004` | Are umbrella GC releases informational pinning contracts (current charter text) or compatibility milestones (this document's framing)? These differ in the strength of the commitment to adopters. | RFC required — affects the release manifest and cross-spec compatibility. AL:3 charter amendment also needed. | Release guidance in this document reads as a stronger promise than the charter authorizes. |
| A-3 | `GC-CHARTER-003` | Record the published PyPI package `governance-commons` as a transitional exception to the naming rule, or schedule a rename to a GC Toolkit-aligned name. | Release-policy note; no RFC trigger, since this is tooling naming rather than normative specification behavior. | This document remains non-conformant with a shipped artifact, and the naming rule is unenforceable in practice. |
| A-4 | `GC-CHARTER-003` | Review the third-party name-use restriction against the "commons" framing. A commons that reserves its name by maintainer consent invites an obvious objection, and the restriction is difficult to enforce without a registered mark. | AL:3 charter review. No RFC trigger. | Public mission language and charter language pull in opposite directions. |
| A-5 | `GC-CHARTER-004` | Should Agent Team Protocol be enumerated in the standards family, and how is its trust model reconciled with Agent Matrix's? | RFC required if added to the manifest — and the trust-model conflict is an inter-spec contract question in its own right. | A specification-shaped component with real schemas and tests stays outside the family with no stated reason. |

Nothing in this document should be cited publicly, referenced in adoption guidance, or treated as doctrine until the amendments above are resolved and the publication condition in the status block is met.

## Maintainer Positions

Recorded 2026-08-28, revised same day after a second pass. These are the founding maintainer's answers to the amendment map above. They are positions, not ratified charter entries; ratification requires the routes named below and the gate at the end of this section.

The second pass changed amendment language only. The boundary model itself is unchanged.

| # | Revised position | Route |
| --- | --- | --- |
| A-1 | Agent Project Orchestrator becomes a **reference-runtime candidate**, earning the label only once it consumes canonical released Agent Dossier schemas. Vendoring remains permitted for offline use provided each vendored schema carries its source version and digest and an automated check detects drift. The defect is the stale private fork, not vendoring. | RFC (removal from release manifest) + AL:3 charter entry |
| A-2 | Split the compatibility table into **normative standards compatibility**, used to derive umbrella releases, and **non-normative "tested with"** runtime and tooling versions. `min_orchestrator_version` must not determine an umbrella standards release once APO is a reference runtime. The nonexistent Dossier `1.4.0` input must be corrected before generation is possible. Draft with A-1. | RFC + AL:3 charter entry + Agent Matrix schema change |
| A-3 | PyPI `governance-commons` is a **transitional exception**. The exception ends once a GC Toolkit package exists, reaches functional parity, ships migration documentation, and the old package has carried a deprecation notice for at least one release cycle. For npm, use a scoped name such as `@governancecommons/toolkit` rather than occupying another broad name with a placeholder. | Release-policy note |
| A-4 | Replace "soften" with a concrete naming-policy objective: **permit accurate nominative statements** such as "compatible with Agent Dossier," while **prohibiting implied endorsement, certification, or official affiliation**. | AL:3 charter review |
| A-5 | Reclassify the blocker from "trust-model conflict" to **"terminology collision plus an unwritten composition rule."** Rename the Agent Team Protocol field to `delegation_tiers` — it describes delegation position, not general role identity. Agent Team Protocol must additionally state that delegation cannot expand Agent Matrix privileges or bypass required human approval. | RFC (new inter-spec contract) + RFC if added to manifest |

### Notes carried forward from the second pass

**A-1 — vendoring is not the defect.** The earlier framing ("consumes the published schemas or it is neither") was too broad. Vendoring with a recorded source version, a digest, and automated drift detection is standard practice and remains legitimate; the defect is an unversioned fork whose `$id` points at a host that does not resolve. One refinement worth considering: pin against the **release artifact** rather than the served URL, so drift detection does not itself depend on the canonical endpoint being reachable. That decouples A-1 from gate item G-1. Each vendored schema should record four values, not one — a tag alone can move unless repository controls prevent it:

- release tag
- immutable commit SHA
- schema path within the repository
- content digest

**A-2 — the split is a schema change, not only a policy change.** `compatibility_table` is currently a single schema-constrained array in Agent Matrix. Splitting it into normative and non-normative halves modifies Agent Matrix's own schema, which is an independent RFC trigger beyond the charter question. Scope A-2 accordingly.

**A-5 — the composition rule is the substantive part.** The field rename is cosmetic; the inter-spec rule is not, and it is a security property. Without it, delegation under Agent Team Protocol could be used to route around an Agent Matrix `requires_human_approval_for` constraint. Consider stating the rule in two clauses rather than one:

1. A delegation grant may include only authority the delegator holds under Agent Matrix, and the recipient must satisfy the Agent Matrix trust requirements for every delegated capability.
2. Prohibited-action and `requires_human_approval_for` constraints remain attached to the delegated action and may not be weakened or bypassed.

These are expressed through effective authority rather than ordinal trust level, because Agent Matrix's enforceable substance is its per-level `permitted_capabilities` and `prohibited_actions` lists, not the `T0`–`T4` ordinal itself. An ordinal comparison would permit a delegation between two agents at the same nominal level whose effective capability sets differ. Clause 2 attaches the constraint to the action rather than to the agent, so it survives the handoff.

Because this introduces a normative inter-spec contract, A-5 is an RFC trigger in its own right — independent of whether Agent Team Protocol joins the family.

**A-4 — no certification program currently exists.** `ADOPTERS.md` states conformance is self-declared until a certification program exists. The naming policy should say so plainly, so that prohibiting certification claims is grounded in the fact that none can be truthfully made, rather than reserving a status that has never been defined.

**A-3 — the npm scope must be claimed.** `@governancecommons` does not yet exist as an npm scope. Claiming it is free but is a prerequisite step, not an automatic consequence of choosing the name.

For the underlying evidence behind the terminology-collision finding, the two models remain orthogonal:

| | Agent Matrix `trust_levels` | Agent Team Protocol `trust_levels` |
| --- | --- | --- |
| Governs | `permitted_capabilities`, `prohibited_actions`, `requires_human_approval_for` | `max_outbound_delegation_depth`, `can_delegate_to_levels` |
| Shape | Privilege/clearance scale, `T0`–`T4`, fixed at exactly five levels | Delegation topology, `hierarchical`/`mesh`/`ring`, rooted at `root_authority_agent_id` |
| Answers | What may this agent do, and when must a human approve? | Who may this agent delegate to, and how deep? |

## Activation and Publication Gate

**Acceptance of the boundary-model RFC authorizes the transition described here. The boundary model does not become effective public doctrine until G-1 through G-5 have been verified.**

This separation is procedurally necessary, not stylistic. `rfcs/RFC-PROCESS.md` states that implementation "MAY begin after acceptance; it MUST NOT begin before." Treating the gate as a precondition of acceptance would therefore be circular in at least two places:

- **G-5** corrects cross-spec compatibility data, which is itself an RFC trigger. It cannot be required before accepting the RFC that authorizes it.
- **G-4** depends on A-1 removing Agent Project Orchestrator from the standards family. The website cannot honestly present a three-member family before the amendment establishing three members is accepted.

The work therefore splits into two milestones:

| Milestone | What it does | Effect |
| --- | --- | --- |
| **1. RFC acceptance** | Accepts the boundary direction and authorizes implementation of A-1 through A-5 and G-1 through G-5. | The existing public classification remains in effect. The accepted RFC describes a **pending transition**. |
| **2. Boundary activation and publication** | Occurs only after G-1 through G-5 pass. | The boundary model becomes effective public doctrine. |

Governance Commons already has a name for the intermediate state. `RFC-PROCESS.md` provides that where an RFC "requires coordinated changes across multiple specs, the maintainer records a compat-hold in `DEV-PLAN.md` until all named consumers confirm compatibility (DDR-1)." The boundary-model RFC touches Agent Dossier, Agent Matrix, ONS, Agent Team Protocol, and Agent Project Orchestrator, so a compat-hold applies by default. Milestone 1 to Milestone 2 is that compat-hold window. No new process term is needed.

Activation minimally requires all five of the following, each of which is binary and independently checkable:

| # | Condition | Verified by |
| --- | --- | --- |
| G-1 | Agent Dossier canonical schema URLs resolve. | HTTP fetch of a published `$id` returns the schema |
| G-2 | Agent Matrix has an actual license file. | `LICENSE` present in the repository |
| G-3 | ONS canonical version surfaces agree. | README, canonical YAML, schema `$id`s, and release tag report one version |
| G-4 | The website accurately presents the three-member family. | Site data lists Agent Dossier, Agent Matrix, ONS; APO not presented as a standard |
| G-5 | The Agent Matrix compatibility row no longer references nonexistent Dossier `1.4.0`. | `compatibility_table` current row cites a published Dossier schema version |

This gate is deliberately narrower than "resolve the audit findings." It tests whether the boundary model can be **published honestly**, not whether the standards are good. Agent Matrix's failing CI and non-validating examples sit outside the gate by design, because the Current Adoptability table discloses them; the missing license is inside the gate because publishing a document that invites adoption of an unlicensed artifact is a different class of problem.

On activation, the boundary model establishes **Agent Dossier, Agent Matrix, and ONS as the current standards family**, with Agent Team Protocol explicitly identified as the next candidate, and Agent Project Orchestrator outside the family until it satisfies the A-1 reference-runtime condition.

### Promotion prerequisites

A complete seven-section RFC candidate now exists privately at `docs/GC-BOUNDARY-RFC-CANDIDATE.md`, including the Prior Art and Alternatives Considered sections scoped below. It is unsubmitted and unnumbered.

Two procedural steps stand between this draft and the boundary-model RFC, neither yet taken:

1. **Number assignment requires a public action.** `RFC-PROCESS.md` assigns numbers by opening a GitHub issue titled `RFC: <slug>` in `governancecommons/governance-commons`. That is an external, public step and is deliberately not taken until explicitly authorized.
2. **The draft does not yet match the required RFC shape.** Every RFC MUST carry seven sections: header block, problem statement, proposal, alternatives considered, prior art, compatibility impact, and implementation notes. This document supplies the substance of most of them, but **alternatives considered** and **prior art** are absent entirely and would need to be written before promotion. Both are scoped below so they are not written open-ended.

#### Prior art — scope

This section answers one question and should not expand into a feature-by-feature protocol audit:

> How do other standards ecosystems separate the umbrella organization, independently versioned specifications, reference implementations, tooling, compatibility claims, and publication infrastructure?

Comparators, and why each is included:

| Comparator | Relevance |
| --- | --- |
| Model Context Protocol | Adjacent protocol in the same problem space; useful for scope boundaries |
| Agent-to-Agent protocols | Adjacent protocol; also a governance-transfer precedent |
| CloudEvents | Specification/tooling separation and independent versioning |
| OpenTelemetry | Specification/tooling separation, independent versioning, and umbrella-to-component structure at scale |
| AAIF | Umbrella-governance comparison |

The existing audit at `docs/reviews/GC-REALITY-AUDIT-CLAUDE.md` provides starting evidence for the first four, but the RFC MUST cite current primary sources rather than the audit, since the audit's external checks were point-in-time. The AAIF reference in particular has not been verified against a primary source in this workspace and its scope and current status should be confirmed before it is cited.

#### Alternatives considered — candidates

Four alternatives, of which the fourth is the proposal:

1. **Monolithic installable product.** Governance Commons as one thing a user installs and adopts wholesale.
2. **Loose brand, no umbrella releases.** Governance Commons as naming only, with no coordinated compatibility milestones.
3. **Internal maintainer governance only.** No public standards family; the specifications remain workspace doctrine.
4. **Public umbrella, independently adoptable specifications, optional tooling, generated compatibility milestones.** The model proposed in this document.

Each alternative should be recorded with the reason it was not chosen, not merely listed.

A two-week comment window also applies once the RFC is marked `open-for-comment`, and the maintainer may extend it. Acceptance therefore cannot precede that window's close, which sets the floor on Milestone 1.

### Consequence to accept deliberately

Four of the five positions reduce what Governance Commons publicly claims, and the fifth gates an addition. That is the correct direction on the evidence. It also means that on activation, the public standards family is **three**.

The gate permits honest publication; it does not establish clean adoptability. Agent Matrix's failing CI and non-validating examples remain outside the gate by design and remain disclosed defects after activation. Clean adoptability is a later and larger milestone, and nothing in this document should be read as claiming the gate delivers it.

This is the honest outcome and should be a chosen one rather than a discovered one.
