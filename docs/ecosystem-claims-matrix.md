# Ecosystem Claims Matrix

**Status:** living document — re-run at each release, not re-derived from scratch
**Produced by:** ECOSYSTEM-BOUNDARY.00, Lane .04/.06
**Date:** 2026-07-21
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
| Evidence signing is automatic and universal | Partially implemented — conditional on a principal key already existing |
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
| Stranger-safe DCP, v2 engine | Unvalidated aspiration |

**Safe public language:** "v1 scaffolding is importable and usable
standalone today. The unified control-plane installer (DCP) is still
pre-release." Do not publicly claim DCP's "5-minute" path — it currently
fails outside its own source repository.

### Lasso
| Claim | Tier |
| --- | --- |
| Human + AI Collaboration Workspace, standalone and inside VS Code | Proven now |
| Public distribution and evidence authenticity | Partially implemented — governance trail is real and validator-checked, not cryptographically signed |
| Broad "editor-agnostic" claim; hosted/browser expansion | Target direction |

**Safe public language:** "A working multi-agent collaboration workspace,
usable standalone or inside VS Code today." Scope any editor-agnostic
claim to "VS Code and standalone today, broader editor support planned" —
not a bare "editor-agnostic."

### eco
| Claim | Tier |
| --- | --- |
| Deterministic provenance/telemetry logging and gate sequencing | Proven now |
| Policy/runtime infrastructure | Partially implemented — real interface, stub implementation behind it |
| "Provides the intelligence" | **Unvalidated aspiration** |

**Safe public language:** "Provides policy-enforcement scaffolding and an
audit trail for agent actions; automated reasoning is in active development
and not yet a working capability." Do not state "eco provides the
intelligence" in any public or internal positioning — the reasoning call is
a two-line echo stub today, not logic.

### eco-edge
| Claim | Tier |
| --- | --- |
| PyPI package name and device-layer (HAL) code | Partially implemented — real, but sourced from eco's monorepo, not this repo |
| Standalone governance proof surface | Unvalidated aspiration |

**Safe public language:** "Device-layer support ships today via the eco
project; a dedicated standalone eco-edge package is planned." Do not
present this repo itself as a shipped product — it currently has no
implementation of its own.

## Highest-risk item

**eco's "provides the intelligence" claim** is the single highest-risk
overclaim in the matrix. The surrounding enforcement architecture (gates,
provenance, handoff/telemetry) is real and tested; the reasoning mechanism
itself is not. See `docs/ecosystem-roadmap.md` Phase 4 for the explicit gate
before this claim may move.
