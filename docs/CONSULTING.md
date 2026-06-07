# DCP Consulting Offering

Status: active
Updated: 2026-06-06

DCP Consulting is a structured setup and governance engagement for solo developers, small teams, studios, and consultancies adopting AI-augmented multi-repo development.

## Offer

Install and normalize a working DevX Control Plane instance for a real portfolio, then train the owner or team to maintain it.

## Target Customers

- solo developers managing 3+ repos
- small teams with fragmented planning and unclear repo ownership
- studios running AI-assisted product work across multiple repos
- consultancies that need repeatable governance for client delivery

## Engagement Levels

### Starter Audit

Scope: 1 session.

Deliverables:

- portfolio inventory
- initial `projects.yaml`
- dashboard baseline
- broken pointer report
- prioritized normalization recommendations

Best for: a developer or lead who wants a fast map of the portfolio.

### Core Setup

Scope: 2 sessions.

Deliverables:

- configured DCP instance
- `projects.yaml` with groups, statuses, and planning pointers
- pre-commit source guard wired
- pointer validation clean or exceptions documented
- onboarding walkthrough

Best for: a solo developer or small team adopting DCP Core and Governance Kit.

### Studio Setup

Scope: 3-5 sessions.

Deliverables:

- Core Setup deliverables
- planning normalization across active repos
- Agent Kit routing table
- handoff protocol
- Team Kit ownership and review routing
- final adversarial audit

Best for: teams using multiple AI agents or sharing work across humans and agents.

## Pricing Model

Use fixed-scope pricing once the portfolio size is known.

Suggested bands:

- Starter Audit: fixed entry package
- Core Setup: fixed package for up to 10 repos
- Studio Setup: fixed package plus per-repo extension above 10 repos
- Retainer: monthly review, normalization, and workflow tuning

Exact pricing should be set per market and customer segment. The package boundaries above are the product definition; the dollar amount is intentionally not hardcoded in the repo.

## Delivery Flow

1. Intake: repo list, goals, team shape, tooling constraints.
2. Audit: run dashboard, inspect planning docs, identify drift.
3. Setup: configure registry, hooks, validation, and templates.
4. Normalize: establish canonical planning files and pointer vocabulary.
5. Agent/team layer: add routing, handoff, ownership, and review conventions if in scope.
6. Handoff: walk through daily operation and maintenance triggers.

## Exit Criteria

An engagement is complete when:

- dashboard reflects the intended portfolio
- `validate-pointers.ps1` passes or exceptions are documented
- active projects have current planning authority
- runtime state is explicitly out of repo
- owner/team can run status, validate, and normalization audit without assistance

## Out Of Scope

- building application features inside customer repos
- hosting runtime orchestration infrastructure
- replacing issue trackers or CI systems
- guaranteeing model output quality
- storing live agent execution traces in DCP
