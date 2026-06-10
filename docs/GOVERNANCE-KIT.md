# DCP Governance Kit

Status: active
Updated: 2026-06-06

Governance Kit is the planning normalization layer for DevX Control Plane. It helps a portfolio keep project direction consistent without forcing every repo to use the same internal file names or process.

## Purpose

Governance Kit answers four questions:

1. Which document is authoritative for current work?
2. Which document records phase history and major decisions?
3. Which projects have parallel workstreams that need a tracks view?
4. Which registry pointers prove those documents exist?

It does not define live task queues, model routing, handoff state, or execution traces. Those belong to Agent Kit or runtime infrastructure.

## Package Contents

- `docs/planning-normalization.md` — vocabulary, pointer shape, and canonical planning rules
- `docs/templates/` — project planning templates
- `docs/PLANNING-AUDIT.md` — checklist for normalizing a portfolio
- dashboard plan health conventions in `dev-status.ps1`
- pointer validation through `validate-pointers.ps1`

## Adoption Path

1. Run `dev-status.ps1` and identify active projects with `notes` or blank plan health.
2. Run `validate-pointers.ps1` and fix broken file pointers.
3. For each active repo, choose the minimum planning shape:
   - `PROJECT-STATUS` for scaffold or small projects
   - `DEV-PLAN` + `DEV-PATH` for active single-workstream projects
   - `DEV-PLAN` + `DEV-PATH` + `TRACKS` for active multi-workstream projects
4. Record the chosen files under `planning:` in `projects.yaml`.
5. Run the adversarial audit checklist before publishing or depending on the docs for agent work.

## Normalization Rule

Normalize toward clarity, not bureaucracy. A project should have the fewest planning files that still let a new maintainer answer:

- what is active now
- what is blocked
- what changed recently
- where historical decisions live
- whether the registry pointers are trustworthy

## Exit Criteria For v0.3.0

Governance Kit is package-ready when:

- templates are generic and do not require Agent Kit
- planning pointer vocabulary is documented
- audit checklist exists
- the DCP template repo uses its own checklist
- `validate-pointers.ps1` and `dev-status.ps1` agree on plan health keys
