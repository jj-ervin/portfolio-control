# C:\dev — Portfolio Control Plane

## What this is

`C:\dev` is the **portfolio control plane** for this developer's local ecosystem.

It is not a monorepo. It is not a project. It is the root from which projects are indexed, navigated, and operated.

## Boundary rules

| Layer | Lives in | Examples |
| --- | --- | --- |
| Portable governance standards | `governance-commons/` | naming, RFCs, trust contracts, schemas |
| Portfolio control plane | `C:\dev` (here) | registry, status tools, validators, sync scripts, env checks |
| Project execution plans | individual project repos | DEV-PLAN.md, DEV-PATH.md, TRACKS.md |
| Live task/agent state | runtime workspace or run records | task queues, agent handoffs, execution traces |

See **DEV-ACCORD.09 (GC:2017)** for the mandatory placement decision gate agents must
apply before creating any script or tooling file.

## What belongs here

- `projects.yaml` — registry and pointers to each project's canonical plan
- `dev-status.ps1` — operational status tooling
- `docs/` — portfolio-level docs, source corpus, research index
- `docs/templates/` — planning templates (not filled-in plans)
- Cross-project indexes and pointers

## What does NOT belong here

- Filled-in project plans (those live in each project repo)
- Live runtime execution state (that belongs in a workspace or database)
- Governance standards (those belong in `governance-commons/`)

## Portability rule

> If a rule or standard should be portable across organizations or other portfolios → `governance-commons/`
>
> If it is local workflow, tooling, or convention for this machine and this portfolio → `C:\dev`

## Naming

In prose and documentation, refer to this directory as the **portfolio control plane**, not as a monorepo or master dev repo.

## Protected Resources

All agents operating in this portfolio must read [`PROTECTED.md`](PROTECTED.md) before making any edits.

`PROTECTED.md` is the authoritative list of files that cannot be overwritten, renamed, or restructured without explicit human instruction. Key protections:

- All `DEV-PATH.md` files are append-only — phase history and design decisions must not be rewritten
- `passchangelog.md` files are append-only audit logs
- File and folder renames require explicit human approval before proceeding
- Feature ideas and queued work in planning docs must not be deleted
- No bulk rewrites of any planning document without surfacing the changes for approval first

The pre-commit hook (`protect-sources.ps1`) enforces source corpus protection at commit time. `PROTECTED.md` extends this doctrine to all planning docs by agent instruction.

## Sandboxed execution accounts

**Rule:** nothing under `C:\dev` may be left owned by a sandbox, service, or CI account
as a side effect of a "temporary" or "test" run. Windows file ownership does not show
up in `git status`, in a normal directory listing, or in an agent's diff — a run that
executes under an alternate account (Codex offline sandbox, a test harness, etc.) can
leave files or folders behind that are silently owned by that account forever, invisible
until someone checks ACLs directly. This happened on 2026-08-17: `.marlin/` and
`register-hygiene-doctor-operations.ps1` were left owned by `CodexSandboxOffline` after
a 2026-08-12 sandboxed Marlin Doctor run, undetected for five days.

Applies to any agent or tool that can execute under a non-interactive account:

- Before a sandboxed/alternate-account run touches anything under `C:\dev`, either run
  it against a throwaway path outside the portfolio, or plan to reset ownership of every
  file and folder it touched back to the interactive owner before the run is considered
  finished.
- A sandboxed run is not done when its task output looks correct — it is done when
  ownership of everything it touched has been verified, not just the content.
- Never leave "it was just a test" as a reason a foreign-owned artifact stays in the
  portfolio. Fix it in the same session it's discovered in, or explicitly flag it to the
  human with a plan to fix it.

Detect drift with [`validate-file-ownership.ps1`](validate-file-ownership.ps1); fix it
with [`normalize-file-ownership.ps1`](normalize-file-ownership.ps1) (requires an
elevated/Administrator shell — `SeTakeOwnershipPrivilege` is not available even to an
Administrators-group account without elevation).
