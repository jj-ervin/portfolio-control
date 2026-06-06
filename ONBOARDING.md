# DevX Control Plane — Onboarding

Get DCP running on your portfolio in about 15 minutes.

---

## What you're setting up

A local portfolio control plane — a registry-driven layer that sits above your project repos and gives you:

- a live dashboard showing git status, project lifecycle, and planning health across all repos
- a typed registry (`projects.yaml`) as the single source of truth for your portfolio
- planning templates so every project has consistent, agent-readable direction docs
- integrity tooling that catches broken pointers and bulk corpus overwrites before they commit

---

## Step 1 — Clone and place

Clone this repo into the root that contains your project repos:

```
C:\your-dev-root\                ← your portfolio root
  devx-control-plane\            ← clone here (or copy files directly to root)
  my-app\
  my-lib\
  ...
```

**Option A — dedicated subfolder (recommended for clean separation):**
```powershell
cd C:\your-dev-root
git clone <repo-url> devx-control-plane
```

**Option B — files at root:**
Copy the Core files directly into your portfolio root so `dev-status.ps1` sits alongside your project folders.

The tools use `$PSScriptRoot` so they work from wherever they live.

---

## Step 2 — Edit projects.yaml

Open `projects.yaml` and replace the example entries with your actual projects.

Each entry needs at minimum:

```yaml
- name: my-app
  path: my-app          # folder name relative to projects.yaml location
  group: my-group
  description: "What it does"
  status: active        # active | wip | scaffold | stable | archive
  branch: main
```

Add a `planning:` block when you have plan files:

```yaml
  planning:
    canonical: my-app/DEV-PLAN.md
    path: my-app/DEV-PATH.md
    tracks: my-app/TRACKS.md
```

Or a note if you don't yet:

```yaml
  planning:
    notes: "No active plan — scaffold phase."
```

See `docs/planning-normalization.md` for the full pointer vocabulary.

---

## Step 3 — Run the dashboard

```powershell
.\dev-status.ps1
```

You should see all your projects listed with branch, git status, lifecycle status, and planning health.

```powershell
.\dev-status.ps1 -Help       # all flags and column explanations
.\dev-status.ps1 -DirtyOnly  # only repos with uncommitted changes
.\dev-status.ps1 -Group my-group
```

---

## Step 4 — Wire the pre-commit hook (optional but recommended)

The source corpus guard fires before every commit and blocks bulk writes to `docs/sources/source_*.md` (your research assets). Wire it once:

```powershell
$hook = ".git\hooks\pre-commit"
"#!/bin/sh`npwsh -File `"`$(git rev-parse --show-toplevel)/protect-sources.ps1`"" | Set-Content $hook
```

---

## Step 5 — Validate your pointers

After editing `projects.yaml`, run:

```powershell
.\validate-pointers.ps1
```

This checks every file path under every `planning:` block resolves on disk. Run it any time you add or rename plan files.

---

## Step 6 — Add plan files to your projects (optional)

Four templates are in `docs/templates/`:

| Template | Use for |
|---|---|
| `DEV-PLAN.template.md` | Active project — milestones, blockers, release targets |
| `DEV-PATH.template.md` | Phase history, decisions, task registry |
| `TRACKS.template.md` | Parallel workstreams and dependency map |
| `PROJECT-STATUS.template.md` | Scaffold or small projects |

Copy the relevant template into your project repo, fill in the `{{placeholders}}`, and add the path to `projects.yaml`. The dashboard will show `plan` in green once the pointer resolves.

---

## Boundary doctrine

Three rules that keep the portfolio clean:

1. **Governance standards** (naming, contracts, schemas) → a dedicated governance repo, not here
2. **Project execution plans** (DEV-PLAN, DEV-PATH, TRACKS) → inside each project repo
3. **Live agent/task state** (queues, handoffs, run records) → runtime workspace or database, never committed

See `DEV-CONTROL-PLANE.md` for the full boundary doctrine.

---

## Updating DCP

When new versions of the tools or templates are released, copy the updated files over your existing ones. `projects.yaml` and anything you've customised will not be overwritten — those are yours.

---

## Getting help

```powershell
.\dev-status.ps1 -Help
.\validate-pointers.ps1 -FixNotes # also report notes-only planning entries
.\protect-sources.ps1            # run manually to check current staged files
```
