# DevX Control Plane (DCP)

> A local AI-augmented portfolio control plane for multi-repo development.

---

## What is this?

DCP is the governance and operational layer that sits above a collection of project repos. It is not a monorepo. It is not a project. It is the root from which projects are indexed, navigated, validated, and operated — with first-class support for AI agent workflows.

`C:\dev` is the reference implementation. The pattern is portable and replicable.

---

## Why it exists

Most developers using AI agents today are working in a chaotic, untracked way — one chat, one task, no audit trail, no routing, no governance. As agent-assisted development matures, the gap between "prompting an LLM" and "running a governed multi-agent workflow" becomes the primary productivity and reliability differentiator.

DCP is a coherent answer to the question most teams haven't asked yet:

> **How do I run multiple AI agents across multiple repos without losing control?**

The combination of a typed registry, boundary doctrine, planning templates, integrity tooling, and a live dashboard is the closest thing to a platform engineering stack for a solo developer or small AI-augmented team. It borrows from enterprise service catalog patterns (Backstage, internal developer platforms) and applies them at individual and studio scale.

You are not behind. Most teams doing this work are still cobbling it together. This is a level above.

---

## Architecture

Three layers. Hard boundaries between them.

```
governance-commons/         Portable governance standards
                            Naming, contracts, schemas, RFCs, trust boundaries
                            Portable across organizations and portfolios

C:\dev  ← you are here     Portfolio control plane
                            Registry, status tools, indexes, planning templates,
                            pointers to canonical plans, local operational conventions

project repos/              Project execution
eco/ eco-edge/ niji/ ...    Canonical DEV-PLAN, DEV-PATH, TRACKS per project
                            Project owns its own execution state

runtime workspace           Live agent state
                            Task queues, agent handoffs, execution traces, run records
                            Not committed — ephemeral by design
```

**Portability rule:**
If a standard should be portable across organizations → `governance-commons/`
If it is local to this portfolio and machine → `C:\dev`

---

## Core Components

| Component | File | Purpose |
|-----------|------|---------|
| Registry | `projects.yaml` | Single source of truth for all projects — status, group, planning pointers |
| Dashboard | `dev-status.ps1` | Live portfolio view: git status, project status, planning health |
| Pointer validator | `validate-pointers.ps1` | Verifies all planning file pointers in registry resolve on disk |
| Source guard | `protect-sources.ps1` | Pre-commit hook — blocks bulk writes to research corpus |
| Boundary doctrine | `DEV-CONTROL-PLANE.md` | Defines what belongs in each layer and why |
| Planning templates | `docs/templates/` | DEV-PLAN, DEV-PATH, TRACKS, PROJECT-STATUS templates |
| Planning standard | `docs/planning-normalization.md` | Vocabulary, pointer shape, and canonical patterns |

---

## Quick Start

```powershell
# Portfolio status
.\dev-status.ps1

# Filter to a group
.\dev-status.ps1 -Group eco-ecosystem

# Show only repos with uncommitted changes
.\dev-status.ps1 -DirtyOnly

# Verify all planning pointers resolve
.\validate-pointers.ps1

# Help
.\dev-status.ps1 -Help
```

---

## Dashboard Columns

```
  name             status    branch     dirty       plan    ahead/behind  hash    commit msg               time
  eco              active    main       ✓ clean     plan                  c3f4497 feat: add governance...  3h ago
  agent-matrix     active    main       ● 4 work    notes                 6c92df4 chore: ignore .vscode   15h ago
  elan             scaffold  main       ✓ clean                           8944204 Add devcontainer...      3mo ago
```

- **status** — `active` (green) · `wip` (yellow) · `scaffold` / `stable` (gray/cyan)
- **plan** — `plan` (has file-based planning docs) · `notes` (notes-only, no plan file) · blank (undocumented)

---

## Project Registry Shape

```yaml
- name: my-project
  path: my-project
  group: my-group
  description: "What this project does"
  status: active          # active | wip | scaffold | stable | archive
  branch: main
  planning:
    canonical: my-project/DEV-PLAN.md
    path: my-project/DEV-PATH.md
    tracks: my-project/TRACKS.md
```

---

## Planning Templates

Four templates in `docs/templates/` derived from real project conventions:

| Template | Use for |
|----------|---------|
| `DEV-PLAN.template.md` | Active project — milestones, release targets, blockers |
| `DEV-PATH.template.md` | Phase history, PASS registry, agent onboarding |
| `TRACKS.template.md` | Parallel workstreams, dependency map |
| `PROJECT-STATUS.template.md` | Scaffold or small projects (minimum viable plan) |

---

## SKUs / Modules

DCP is designed to be modular. Each layer is independently useful.

| Module | Contents | Audience |
|--------|----------|---------|
| **DCP Core** | Registry schema + dashboard + boundary doctrine | Any multi-repo developer |
| **DCP Governance Kit** | Planning templates + normalization standard + validator | Teams with 3+ active projects |
| **DCP Agent Kit** | PASS templates + model routing patterns + agent onboarding | AI-augmented development workflows |
| **DCP Studio** | All modules bundled | Solo developers running multi-agent workflows |
| **DCP Consulting** | Custom setup, training, workflow design | Teams adopting AI-augmented development |

---

## File Map

```
C:\dev\
  README.md                     This file
  DEV-CONTROL-PLANE.md          Boundary doctrine
  DEVPLAN.md                    DCP execution plan and release roadmap
  DEVPATH.md                    DCP development path and phase history
  projects.yaml                 Portfolio registry
  dev-status.ps1                Portfolio dashboard
  validate-pointers.ps1         Planning pointer integrity checker
  protect-sources.ps1           Research corpus pre-commit guard
  docs/
    planning-normalization.md   Planning standard
    templates/                  Planning templates
    sources/                    Research corpus (protected)
  governance-commons/           Portable governance standards (separate repo)
  [project repos]/              Individual projects (separate repos, gitignored here)
```

---

## Status

See `DEVPLAN.md` for current release targets and roadmap.
See `DEVPATH.md` for phase history and design decisions.

---

*DCP — DevX Control Plane. Built for AI-augmented multi-repo development.*
