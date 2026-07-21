# Ecosystem Boundary Audit — Claude + Codex Reconciliation

## 2026-07-21

**Session type:** Cross-agent ecosystem boundary audit and roadmap
**Agents:** Claude (hands-on repo audit) + Codex (independent hands-on repo audit)
**Repos evaluated:** marlin, governance-commons, dxp-org, lasso, eco, eco-edge
**PASS:** ECOSYSTEM-BOUNDARY.00 (working name — portfolio-level, not a GC
standard; not registered in `passes/passes.registry.json`, whose scope is
GC-owned standards only)
**Status:** Complete. Composability map, claims matrix, and roadmap drafted
and product-owner approved. See `docs/ecosystem-composability-map.md`,
`docs/ecosystem-claims-matrix.md`, `docs/ecosystem-roadmap.md`.

## Why two agents

Same method as the 2026-06-09 combined synthesis (`docs/sessions/2026-06-09-combined-synthesis.md`):
two independent hands-on reads of the same repos, reconciled before anything
gets drafted as a decision, rather than one agent's read taken at face value.

## Origin

A proposed ecosystem architecture (Marlin as front door, Governance Commons
as portable source of truth, DevXToolkit as deterministic operations
engine, Lasso as the collaboration workspace, eco as the reasoning/planning
layer) was reviewed in two passes:

1. A strategic-boundary review that resolved the Lasso/eco role overlap and
   flagged two risks: the proposed pipeline diagram implying hard
   dependencies that contradict already-locked constraints (Lasso must work
   standalone; eco integration is additive, never required), and
   positioning claims outrunning actual build state.
2. A revised, explicitly compositional architecture plus a four-tier claims
   scale (Proven now / Partially implemented / Target direction /
   Unvalidated aspiration), approved as the strategic direction.

Executing the resulting First Scope — verify, audit, map, classify, define a
contract, produce a roadmap — was itself cross-repo and, by the portfolio's
own Change Playbook (DEV-ACCORD.06) escalation rules, warranted coordinating
more than one agent rather than one agent's read standing alone.

## Method

Claude ran five parallel read-only audits (marlin, governance-commons,
dxp-org, eco, eco-edge) plus a firsthand write-up of lasso from the current
session's own verified state, each answering: can a stranger install it, run
it, produce evidence, verify that evidence, and trust the result? Several
audits went beyond reading documentation — running installers in scratch
directories, executing validators, checking live PyPI/npm registries and
TLS certificates directly — rather than trusting claims in README/DEV-PLAN
files.

Codex ran an independent pass over the same six repos against the same
question set, without seeing Claude's conclusions first.

## Where both agents agreed

High confidence — independent signals converging:

- eco's headline "provides the intelligence" claim is **Unvalidated
  aspiration**: the reasoning mechanism reached through the "LASSO reasoning
  gate" is a two-line echo stub, not policy-aware logic, though the
  surrounding gate/provenance architecture is real.
- eco-edge (the repo) has no implementation of its own; the PyPI package
  that actually installs is sourced from the eco monorepo.
- DCP's `init` path is currently broken outside its own source repo, not
  merely untested.
- Lasso's core workspace (standalone + VS Code) is genuinely proven;
  broader editor integrations are target direction, not current capability.
- Governance Commons is release-weak in the same specific way the
  2026-06-09 synthesis found — publish is paused, zero adopters, signed
  evidence is templates only — confirming that finding still holds three
  weeks later rather than having been resolved.

## Corrections one agent made to the other

- **Marlin signing:** Codex found a real Ed25519 key-generation path enabled
  by default in guided setup, which Claude's initial pass had read as more
  broken than it is. Reconciled as: signing is conditionally proven, not
  universally automatic — bundles stay unsigned only when no principal key
  exists yet.
- **eco:** Claude's stricter classification (Unvalidated aspiration, not
  Target direction) won on reconciliation — a stub that must be replaced
  before production, per the code's own comment, does not meet the bar for
  "designed and underway."
- **eco-edge:** Codex added that the repo's documented quickstart disagrees
  with the actual shipped package's current API and metadata — a second,
  independent reason public package resolution doesn't prove a working
  stranger path, beyond the repo/monorepo mismatch Claude found.

## Outputs

- `docs/ecosystem-composability-map.md` — required/optional/absent
  integrations per product, no mandatory pipeline.
- `docs/ecosystem-claims-matrix.md` — living four-tier claims scale with
  safe public language per product.
- `docs/ecosystem-roadmap.md` — five-phase roadmap, release credibility
  first, eco intelligence explicitly deferred and gated.

No repository other than the portfolio root was modified by this audit.
Per the approved compound-PASS brief, edits to individual repos' own
DEV-PATH.md/DEV-PLAN.md were explicitly out of scope for this PASS.
