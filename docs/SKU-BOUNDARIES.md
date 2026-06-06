# DevX Control Plane — SKU Boundaries

Status: active
Updated: 2026-06-06

This file defines what ships in each DCP package. The boundary is intentionally strict so DCP Core stays small, portable, and useful without adopting the full governance or agent workflow.

## DCP Core

Core is the free/open portable template.

Ships in v0.2.0:

- `projects.yaml` schema and starter registry
- `dev-status.ps1` dashboard
- `validate-pointers.ps1` pointer checker
- `protect-sources.ps1` source corpus guard
- `DEV-CONTROL-PLANE.md` boundary doctrine
- `README.md`
- `ONBOARDING.md`
- `DEVPLAN.md` and `DEVPATH.md` for the template repo itself

Core may include short examples and links to optional modules, but it must not require any external governance framework, agent runtime, model vendor, database, or hosted service.

## DCP Governance Kit

Governance Kit is the planning normalization layer.

Ships separately after Core:

- `docs/templates/`
- `docs/planning-normalization.md`
- `docs/GOVERNANCE-KIT.md`
- `docs/PLANNING-AUDIT.md`
- reusable planning vocabulary
- plan health conventions
- project planning audit checklist

Governance Kit can be used without Agent Kit. Its job is to make project direction consistent and easy to inspect across repos.

## DCP Agent Kit

Agent Kit is the AI-agent workflow layer.

Ships separately after Governance Kit:

- task governance templates
- model routing pattern library
- agent onboarding template
- multi-agent handoff protocol
- audit trail conventions

Agent Kit must not place live task queues, handoff state, run records, or execution traces in the DCP repo. Runtime state belongs in a workspace, queue, database, or orchestration service.

## DCP Studio

Studio bundles Core, Governance Kit, and Agent Kit into a complete setup for solo developers and small teams running multi-agent workflows across several repos.

## DCP Consulting

Consulting is a service wrapper around the packages.

Typical deliverables:

- portfolio audit
- configured `projects.yaml`
- planning baseline
- pointer validation
- optional Agent Kit routing and handoff setup
- team walkthrough

Consulting deliverables can customize a user's DCP instance, but reusable standards or templates should flow back into the relevant package instead of remaining hidden in one-off setup notes.
