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
- Lasso may consume provider information for agent selection, routing, and
  orchestration. Lasso is not the distribution shell for either budget-bar app.

## Implementation Constraint

Do not fork the Claude extension into a second diverging codebase prematurely.
Build a real second provider first, then extract only contracts proven common:
snapshot identity, units, source, confidence, freshness, reset time, and warning
state. Provider credentials, log formats, pricing, and quota semantics remain
inside provider-specific adapters.

## Activation Gate

Create a repository and add this product to `projects.yaml` only after its first
provider-neutral scope, data sources, privacy boundary, and release target are
approved. Until then, this document is the portfolio record of the concept.
