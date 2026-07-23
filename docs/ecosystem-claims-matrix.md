# Ecosystem Claims Matrix

**Status:** living document — re-run at each release, not re-derived from scratch
**Produced by:** ECOSYSTEM-BOUNDARY.00, Lane .04/.06
**Date:** 2026-07-21
**Updated:** 2026-07-23
**Source:** hands-on audit (Claude + Codex, independently reconciled) — see `docs/sessions/2026-07-21-ecosystem-boundary-audit.md`

## Scale

Every claim about ecosystem capability is classified on one four-tier scale:

| Tier | Meaning |
| --- | --- |
| **Proven now** | Verified working by hands-on test, not just documentation |
| **Partially implemented** | Real mechanism exists but is incomplete, conditional, or unverified end-to-end |
| **Target direction** | Designed intent, not yet built |
| **Unvalidated aspiration** | Asserted publicly or internally with no working mechanism behind it |

A claim only moves up this scale after a hands-on verification pass, not a
documentation update (see the Phase 2 gate in `docs/ecosystem-roadmap.md`).

The right-hand column is the sentence safe to say publicly today. Anything
classified above "Proven now" stays internal roadmap language until it earns
its own row.

## Matrix

### Marlin

| Claim | Tier |
| --- | --- |
| Local CLI install/scaffold; Ed25519 key generation and signature verification | Proven now |
| Evidence signing is automatic and universal | Partially implemented — signing works when a principal key exists; unsigned bundles remain possible by design |
| "Project Architect," public "DXP front door" | Unvalidated aspiration |

**Safe public language:** "Installs and manages governed dev-tooling
packages from source, with optional signed audit evidence when a signing
key is configured." Do not state "Project Architect" or "DXP front door" as
current capability — Marlin's own DEV-PLAN.md pushes back on that framing.

### Governance Commons

| Claim | Tier |
| --- | --- |
| Schemas, ONS reference validators, audit/report tooling | Proven now |
| Portable standards, provenance, conformance | Partially implemented — self-described as "a standard without an implementation" |
| Published, ecosystem-wide source of truth | Unvalidated aspiration |

**Safe public language:** "Defines portable governance schemas and
validators, usable today by cloning the repository; hosted package
distribution is in progress." Do not claim "published source of truth" —
zero adopters, no live package, no working custom domain.

### DevXToolkit (dxp-org)

| Claim | Tier |
| --- | --- |
| v1 module import and scaffolding commands | Proven now |
| Deterministic scaffolding / automation engine | Partially implemented — real commands, no deterministic or hashed output |
| Honest DCP failure handling and target validation | Proven now — corrected in `devx-control-plane` commit `1cbf570` |
| Stranger-safe successful DCP initialization, v2 engine | Unvalidated aspiration |

**Safe public language:** "v1 scaffolding is importable and usable
standalone today. The unified control-plane installer (DCP) is still
pre-release." Do not publicly claim DCP's "5-minute" path: relocated failure
handling is now honest, but successful stranger initialization remains
unproven.

### Lasso

| Claim | Tier |
| --- | --- |
| Human + AI Collaboration Workspace, standalone and inside VS Code | Proven now |
| Public distribution and evidence authenticity | Partially implemented — governance trail is real and validator-checked, not cryptographically signed |
| Governed multi-agent PR review | Target direction — first workflow selected to test willingness to pay |
| Broad "editor-agnostic" claim; hosted/browser expansion | Target direction |

**Safe public language:** "A working multi-agent collaboration workspace,
usable standalone or inside VS Code today." Scope any editor-agnostic
claim to "VS Code and standalone today, broader editor support planned" —
not a bare "editor-agnostic."

### eco

| Claim | Tier |
| --- | --- |
| Structured provenance/telemetry records and gate sequencing around the current stub path | Proven now |
| Policy/runtime infrastructure | Partially implemented — real interface, stub implementation behind it |
| Deterministic provenance | Unvalidated aspiration |
| "Provides the intelligence" | **Unvalidated aspiration** |

**Safe public language:** "Provides policy-enforcement scaffolding and an
audit trail for agent actions; automated reasoning is in active development
and not yet a working capability." Do not state "eco provides the
intelligence" in any public or internal positioning — the reasoning call is
a two-line echo stub today, not logic.

### Cockpit

| Claim | Tier |
| --- | --- |
| Universal operator shell | Partially implemented — real Python package, 156 passing tests; v1 slice (Marlin provider first) not yet complete |
| Provider adapters (eco/marlin/niji/system), provider registry, host bridge | Proven now — 2,346 lines, verified hands-on |
| Provider discovery, command forms, inbox routing, evidence presentation | Target direction |
| Mandatory host for Lasso or any other product | Forbidden architecture |

**Safe public language:** "Cockpit is an early, tested operator shell
(156 passing tests) for discovering and launching independently useful
products; its v1 slice is still incomplete." Do not imply Cockpit is
finished or that it owns product state or is required by any product —
but do not claim it doesn't exist either.

### Niji

| Claim | Tier |
| --- | --- |
| Independently useful color/design utility, shipped v1 | Partially implemented for this matrix — supported by a prior assessment, pending direct re-verification |
| Cockpit creative panels and commands | Target direction |

**Safe public language:** Keep current Niji claims scoped to its own verified
release evidence. Do not claim Cockpit integration before its own provider
adapters cover Niji end-to-end.

### eco-edge

| Claim | Tier |
| --- | --- |
| Core kernel/HAL/telemetry/anomaly modules import and run correctly | Proven now — fixed and verified 2026-07-22 (`eco` commit `2c276e6`); was Unvalidated aspiration through both PyPI releases (0.1.0, 0.1.1) — `import eco.core.edge.kernel` failed on install for everyone, always |
| PyPI package name and device-layer (HAL) code | Partially implemented — the fix (0.1.2) is built and locally verified, not yet published to PyPI; anyone running `pip install eco-edge` today still gets the broken 0.1.1 |
| Standalone governance proof surface | Unvalidated aspiration — blocked on governance-commons' actual PyPI/npm publish, not a code gap |

**Safe public language:** "Device-layer support (kernel, HAL, telemetry,
anomaly detection) is real, tested, and — as of the 0.1.2 fix — actually
importable when installed. It is not yet published to PyPI; the published
0.1.1 remains broken until someone runs the publish step." Do not claim a
dedicated standalone governance proof surface — that repo has no
implementation of its own yet.

## Positioning guardrails

These claims remain forbidden until stranger-proof evidence supports them:

- "HIPAA Mode," "SOC 2 compliant," or "FedRAMP." Use "policy pack" or
  "control mapping"; installing one never implies automatic compliance.
- "eco provides the intelligence, reasoning, or orchestration" in the
  present tense.
- "Enterprise-grade," "zero trust," or "deterministic provenance" as shipped
  ecosystem capabilities.
- "Every line of code has provenance." Begin with provenance per response,
  artifact, change-set, approval, and applied action.
- "Defense in depth" for permissions. Lasso's human-approval gate is the only
  real enforcement layer today; eco's policy and safety gates are stubs.

The differentiation thesis is comparison, explicit approval, preserved
provenance, and traceable handoff. It is not yet a commercially validated
moat.

## Highest-risk item

**eco's "provides the intelligence" claim** is the single highest-risk
overclaim in the matrix. The surrounding enforcement architecture (gates,
provenance, handoff/telemetry) is real and tested; the reasoning mechanism
itself is not. See `docs/ecosystem-roadmap.md` Phase 4 for the explicit gate
before this claim may move.
