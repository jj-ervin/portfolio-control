# Planning Audit Checklist

Status: active
Updated: 2026-06-06

Use this checklist during a normalization run. Run it before publishing a release, onboarding agents, or changing planning structure across a portfolio.

## Inputs

- `projects.yaml`
- `DEV-PLAN.md`
- `DEV-PATH.md`
- `docs/planning-normalization.md`
- project planning files referenced by `projects.yaml`

## Normalization Pass

For each project:

- Confirm `name`, `path`, `group`, `status`, and `branch` are present.
- Confirm `path` resolves relative to the DCP root.
- Confirm active projects have either file-based planning pointers or an explicit `notes` explanation.
- Confirm scaffold/archive projects do not carry stale active-work language.
- Confirm file names in the repo and pointers in `projects.yaml` agree.
- Confirm each pointer key uses the documented vocabulary.
- Confirm no generated output, website copy, changelog, or snapshot is the only current plan for an active project.

## Authority Pass

For each planning document:

- Confirm the document declares what it owns.
- Confirm it does not claim authority already owned by another file.
- Confirm current execution state lives in the current plan.
- Confirm phase history and decisions live in the development path.
- Confirm parallel workstreams live in tracks docs when needed.
- Confirm live runtime state is absent from committed planning docs.

## Adversarial Questions

Ask these as if you are trying to break the planning system:

- Could two reasonable readers choose different next actions?
- Does any file claim to be canonical while another file silently disagrees?
- Is any package boundary vague enough that future work could land in the wrong module?
- Does any active project hide behind `notes` when it needs a real plan?
- Do the tools validate the same pointer vocabulary that the docs teach?
- Could an agent write execution state into the repo because the docs imply it belongs there?

## Exit Criteria

A normalization run is complete when:

- `validate-pointers.ps1` passes.
- `dev-status.ps1` shows expected plan health.
- all active P0 work has a current plan pointer.
- any remaining `notes` entries are intentional and documented.
- adversarial findings are either fixed or recorded with owners.
