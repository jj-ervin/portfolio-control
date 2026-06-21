# CLAUDE.md — Agent Instructions for C:\dev

This file is read by Claude at the start of every session in this directory.

---

## First: Read PROTECTED.md

Before making any edits, read [`PROTECTED.md`](PROTECTED.md). It lists files that cannot be overwritten, renamed, or restructured without explicit human instruction. These rules apply to every session.

---

## What this portfolio is

`C:\dev` is a **portfolio control plane** — not a monorepo or single project. Each subdirectory is an independent project with its own planning docs. See [`DEV-CONTROL-PLANE.md`](DEV-CONTROL-PLANE.md) for the boundary doctrine.

---

## Agent reading order (before working on any project)

1. `PROTECTED.md` — what you cannot touch without permission
2. `DEV-CONTROL-PLANE.md` — boundary doctrine
3. `projects.yaml` — the registry and pointers to each project's canonical plan
4. The specific project's `DEV-PATH.md` and `DEV-PLAN.md`

---

## Key rules for this session

**Do not rewrite.** Append to planning docs. Do not restructure them.

**Do not rename files.** If a rename seems necessary, ask first.

**Do not delete feature ideas or queued work.** If unsure, append to `DEV-PLAN.md` under `## QUEUED IDEAS`.

**Do not bulk-edit multiple planning docs** without surfacing the changes for approval.

**Ask before touching** any file marked AL:1 beyond the permitted operations in `PROTECTED.md`.

---

## Ecosystem overview

| Folder | What it is |
|--------|-----------|
| `governance-commons/` | Portable governance standards (Agent Dossier, Agent Matrix, ONS, POA) |
| `dxp-org/` | DevXToolkit — developer experience tools portfolio |
| `eco/`, `eco-edge/`, `eos/` | Eco ecosystem — AI governance platform |
| `arche/`, `cockpit/`, `elan/` | Other active projects |
| `docs/` | Portfolio-level research, source corpus, planning templates |

---

## Planning doc roles

| Doc | Owns |
|-----|------|
| `DEV-PATH.md` | Phase history, design decisions, PASS registry — **append-only** |
| `DEV-PLAN.md` | Current execution state, active milestones, priority work queue |
| `TRACKS.md` | Parallel workstreams and dependencies |
| `passchangelog.md` | Ecosystem-level governance decisions — **append-only** |

---

*This file is read automatically by Claude Code at session start.*
