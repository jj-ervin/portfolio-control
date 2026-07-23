# Ecosystem Composability Map

**Status:** active reference
**Produced by:** ECOSYSTEM-BOUNDARY.00, Lane .03
**Date:** 2026-07-21
**Updated:** 2026-07-23
**Source:** hands-on audit (Claude + Codex, independently reconciled) — see `docs/sessions/2026-07-21-ecosystem-boundary-audit.md`

## Purpose

Marlin, Governance Commons (GC), DevXToolkit, Lasso, eco, eco-edge, Niji, and
Cockpit form a composable ecosystem. This map records what each product
actually needs, what it can optionally consume or substitute for, and — the
load-bearing column — what's currently absent or broken regardless of design
intent. It replaces any framing of these products as a mandatory linear
pipeline.

Dependency requirements are distinguished from optional integrations
throughout. A product with nothing in "Requires" is independent by design;
the evidence table below says whether that independence is actually proven.

## Composability principle

> Independent utility, integrated advantage. No product requires Cockpit or
> eco to deliver its core value; Marlin and Cockpit make independently useful
> products easier to assemble and operate together. Cockpit depends on
> provider contracts; core products do not depend on Cockpit.

This is an architectural requirement, not a blanket present-tense claim.
Marlin is intended to assemble products and Cockpit is intended to present
them together. Those behaviors are proven today only in narrow slices:
Marlin installs one real package end-to-end; Cockpit is a real, tested early
implementation (156 passing tests) whose v1 slice (Marlin provider first) is
not yet complete.

The ecosystem's differentiation thesis is trusted collaboration between one
human and multiple AI agents today, extending to multiple humans later, with
comparison, explicit approval, and preserved provenance. That thesis still
has to be proven commercially.

## Map

### Marlin
- **Requires:** Nothing — runs standalone once built.
- **Optional / replaceable:** Intended to install and manage GC files,
  DevXToolkit modules, or Lasso itself as packages. Proven end-to-end for one
  real package (`marlin install niji`, verified against a real on-disk
  install).
- **Absent / broken:** Unpublished — no global install (`npm install -g
  @marlin/cli` fails; the package has never been published). Evidence signing
  is conditional: it works when a principal key exists, and guided setup can
  generate one; bundles remain unsigned otherwise by design.

### Governance Commons
- **Requires:** Nothing to exist — it is files, schemas, and PASS
  conventions, not a running service.
- **Optional / replaceable:** Any repo can adopt GC incrementally. Marlin's
  `dotgovernance` installer is one real, verified distribution path. ONS
  reference validators are narrow in scope but genuinely usable standalone.
- **Absent / broken:** No published package (PyPI/npm publish paused, zero
  git tags), no live custom domain (TLS cert mismatch on
  `governancecommons.org`), empty `ADOPTERS.md`, signed evidence bundles
  exist only as illustrative templates, not generated artifacts.

### DevXToolkit (dxp-org)
- **Requires:** Nothing for the v1 module — imports and runs standalone.
- **Optional / replaceable:** v1 scaffolding is usable independently of
  Marlin/GC/Lasso/eco, and could be invoked by Marlin as an installable
  package.
- **Absent / broken:** DCP's relocated `init` now fails loudly instead of
  falsely reporting success, and `validate` checks the requested target
  correctly (`devx-control-plane` commit `1cbf570`). That corrects failure
  handling and validation; successful stranger initialization remains
  unproven. The v2 engine is an empty scaffold (`.gitkeep` files only). No
  manifest, checksum, or evidence output exists anywhere in either installer
  path.

### Lasso
- **Requires:** Nothing — the standalone browser server and the VS Code
  extension host both work today, independently verified this session
  (122 passing tests, live embedded-server smoke test).
- **Optional / replaceable:** Any agent provider is swappable — Claude,
  Codex, Gemini, and Ollama adapters are already interchangeable. eco
  integration is additive by design and never a hard dependency.
- **Absent / broken:** Not published to the VS Code Marketplace or npm.
  JetBrains, Visual Studio, and terminal hosts don't exist yet — the
  "editor-agnostic" claim holds for two hosts (VS Code, standalone browser),
  not all.

### eco
- **Requires:** Nothing external — the enforcement/provenance scaffolding
  (`NehiOrchestrator`, `autonomy_plane.py`) runs on its own.
- **Optional / replaceable:** Policy and safety gates are built as a
  swappable interface — genuine composability, even though today's
  implementation behind that interface is a stub (the gate's own code
  comment reads "must be replaced before production").
- **Absent / broken:** No working `pip install eco` — the `eco` name on
  PyPI belongs to an unrelated third-party package, and this repo's own
  package has never been published. The reasoning call reached through the
  "LASSO reasoning gate" is a two-line echo (`ReasoningEngine.think()`
  returns `[{"action": "respond", "content": f"Processed: {content}"}]`),
  not policy-aware logic.

### eco-edge
- **Requires:** N/A — this repo currently has no implementation of its own.
- **Optional / replaceable:** Intended as a standalone extraction of eco's
  HAL/CAPS device-layer code; that extraction has not yet been performed.
- **Absent / broken:** The package ships from the eco monorepo, not this
  repository. Published versions 0.1.0 and 0.1.1 are broken on import. The
  0.1.2 packaging and quickstart fixes are locally verified in eco commit
  `2c276e6` but are not yet published. This repository still has no
  installable code and must not be conflated with the monorepo package.

### Niji
- **Requires:** Nothing, per the prior v1 assessment.
- **Optional / replaceable:** Can remain an independent color/design utility
  and may eventually contribute creative commands or panels to Cockpit.
- **Absent / broken:** Niji was not part of the 2026-07-21 six-repo hands-on
  audit. Its v1 status requires direct re-verification before this map treats
  stranger readiness as proven.

### Cockpit
- **Requires:** No product is allowed to require Cockpit for its core value.
  Cockpit itself consumes neutral provider contracts — provider adapters for
  eco/marlin/niji/system already exist (2,346 lines), plus a provider
  registry and host bridge.
- **Optional / replaceable:** Intended to discover, launch, monitor, and
  deep-link into independently useful products through a consistent operator
  shell.
- **Absent / broken:** Real Python package with 156 passing tests, verified
  hands-on — not "not yet built." Own `DEV-PLAN.md` status is "SCAFFOLD /
  ACTIVE PRODUCT DIRECTION"; the v1 slice (Marlin provider first) is not yet
  complete. Cockpit does not own product domain state, approvals, identity
  authority, or evidence. Its target system of record is operator-shell state
  only: preferences, provider discovery, and inbox routing.

## Independent utility and stranger readiness

These are separate axes. "Independent" means the product has useful core
behavior without Cockpit or eco. "Stranger-ready" means someone outside this
session can install, run, produce evidence, and verify it today.

| Product | Independent core utility | Stranger-ready installation |
| --- | --- | --- |
| Marlin | Proven narrowly — one real package | Partial — clone/build only; unpublished |
| Lasso | Proven | Partial — clone/build works; no one-line public install |
| Niji | Proven per prior assessment | Pending direct re-verification |
| DevXToolkit | Proven for v1 | Partial — `dotgovernance` works; successful relocated DCP init remains unproven |
| Governance Commons | Proven | Not proven — publication paused |
| eco | Partial — records/sequencing real; reasoning is a stub | Not proven |
| eco-edge repository | Target — no installable code | Not applicable |
| eco-edge package from eco | Proven locally for 0.1.2 | Partial — fixed package not yet published |
| Cockpit | Partially implemented — real package, 156 passing tests; v1 slice incomplete | Not proven — no packaged/published install yet |

## Reading this map

- Nothing in this ecosystem is a hard dependency of anything else today.
- The only proven cross-product composition is Marlin installing a
  third-party package (niji) — the Marlin→GC/DevXToolkit/Lasso installable
  paths described in the original architecture proposal are designed but
  not yet exercised end-to-end.
- eco's gate interfaces are real composability points worth preserving even
  while their current implementations are stubs — don't discard the
  architecture while fixing the mechanism behind it.
- Marlin and Cockpit are optional assembly and presentation points. A product
  may use either, both, or neither.
- Cockpit surfaces products; it does not reimplement their navigation,
  settings, workspace state, or domain logic.
