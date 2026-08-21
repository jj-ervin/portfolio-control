# Agent Budget Bar

Status: product concept; no repository or implementation exists.

## Decision

Agent Budget Bar will be a separate provider-neutral application. It will not
replace, rename, or become a feature mode inside Claude Budget Bar.

Claude Budget Bar remains the focused Claude Code product and the first
validated reference implementation for local session discovery, configurable
warning states, evidence confidence, compact status-bar presentation, and
handoff preparation.

## Product Boundary

- Claude Budget Bar understands Claude-specific context, auto-compaction,
  transcripts, subscription limits, and handoff workflows deeply.
- Agent Budget Bar presents comparable usage, quota, reset, cost, and staleness
  information across supported coding agents without pretending every provider
  exposes identical measurements.
- COBB (Context Budget Bar / Context Budget Controller) is the shared planning
  concept between them: forecast likely additional task context before
  execution, compare it to current context and model/session boundaries, and
  recommend whether to continue, checkpoint, compact, split, delegate a survey,
  start fresh, or approve a recorded overrun.
- Lasso may consume provider information for agent selection, routing, and
  orchestration. Lasso is not the distribution shell for either budget-bar app.

## Implementation Constraint

Do not fork the Claude extension into a second diverging codebase prematurely.
Build a real second provider first, then extract only contracts proven common:
snapshot identity, units, source, confidence, freshness, reset time, and warning
state. Provider credentials, log formats, pricing, and quota semantics remain
inside provider-specific adapters.

COBB should land first inside Claude Budget Bar as a Claude-specific v0.4
implementation, not as a standalone Agent Budget Bar repo. The first build
should be manual preflight plus automatic display: a command writes a local
forecast artifact, the status bar/detail panel combine that forecast with live
Claude session usage, and an outcome record later calibrates forecast accuracy.
True automatic task capture requires a separate wrapper/hook design once the
Claude Code integration point is proven.

Recommended staged work:

1. Add a forecast data model and local store (`forecast.ts`,
   `forecastStore.ts`, `pricingProfile.ts`, `taskClassifier.ts`).
2. Add a manual **Create Context Forecast** command that reads task text and
   inexpensive repo metadata, then writes a local forecast artifact.
3. Extend status bar and detail panel rendering with current, forecast,
   projected, confidence, cost profile, recommendation, and overrun reason.
4. Add GUI settings for forecast mode, soft/plan/approval/hard thresholds, and
   pricing profile state.
5. Add a **Record Forecast Outcome** path that compares observed session growth
   with the forecast and keeps calibration local-only.
6. Design wrapper/hook integration later for true pre-execution automation.

The automation boundary remains conservative: warn, recommend, copy planning
prompts, and read/write forecast artifacts are in scope; automatically running
`/compact`, `/clear`, switching models, dispatching subagents, or approving
overrun is out of scope until a future automation design is explicitly approved.

## Activation Gate

Create a repository and add this product to `projects.yaml` only after its first
provider-neutral scope, data sources, privacy boundary, and release target are
approved. Until then, this document is the portfolio record of the concept.
