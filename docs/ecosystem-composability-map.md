# Ecosystem Composability Map

**Status:** active reference
**Produced by:** ECOSYSTEM-BOUNDARY.00, Lane .03
**Date:** 2026-07-21
**Source:** hands-on audit (Claude + Codex, independently reconciled) — see `docs/sessions/2026-07-21-ecosystem-boundary-audit.md`

## Purpose

Marlin, Governance Commons (GC), DevXToolkit, Lasso, and eco form a coherent
ecosystem, but none of them requires another to function. This map records
what each product actually needs, what it can optionally consume or
substitute for, and — the load-bearing column — what's currently absent or
broken regardless of design intent. It replaces any framing of these
products as a mandatory linear pipeline.

Dependency requirements are distinguished from optional integrations
throughout: a product with nothing in "Requires" is fully standalone today.

## Map

### Marlin
- **Requires:** Nothing — runs standalone once built.
- **Optional / replaceable:** Can install and manage GC files, DevXToolkit
  modules, or Lasso itself as packages. Proven end-to-end for one real
  package (`marlin install niji`, verified against a real on-disk install).
- **Absent / broken:** Unpublished — no global install (`npm install -g
  @marlin/cli` fails; the package has never been published). Evidence
  signing works only when a principal key already exists; there is no CLI
  path to generate/register one for a fresh user by default.

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
- **Absent / broken:** DCP's `init` is **broken**, not merely untested,
  outside its own source repo (verified: it self-copies one file, then the
  very next command fails because the files it should have provisioned
  don't exist). The v2 engine is an empty scaffold (`.gitkeep` files only).
  No manifest, checksum, or evidence output exists anywhere in either
  installer path.

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
- **Absent / broken:** The PyPI package published under this name (`eco-edge`
  0.1.1, real and working) actually ships from the eco monorepo, not from
  this repo. This repo's own quickstart disagrees with that package's
  current API and metadata.

## Reading this map

- Nothing in this ecosystem is a hard dependency of anything else today.
- The only proven cross-product composition is Marlin installing a
  third-party package (niji) — the Marlin→GC/DevXToolkit/Lasso installable
  paths described in the original architecture proposal are designed but
  not yet exercised end-to-end.
- eco's gate interfaces are real composability points worth preserving even
  while their current implementations are stubs — don't discard the
  architecture while fixing the mechanism behind it.
