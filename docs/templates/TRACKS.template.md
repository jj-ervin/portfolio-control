# TRACKS — {{Project Name}} Portfolio Overview

**Last updated:** {{YYYY-MM-DDThh:mm:ssZ}}
**Authority:** Master product/release portfolio view. For governance history see `DEVPATH.md`; for active execution planning see `DEVPLAN.md`.

---

## Portfolio Status

| Track | Name | Goal | Status | Next Milestone |
|-------|------|------|--------|----------------|
| [A](tracks/TRACK-A.md) | {{Name}} | {{Goal}} | 🔴 Not started | {{milestone}} |
| [B](tracks/TRACK-B.md) | {{Name}} | {{Goal}} | 🔴 Not started | {{milestone}} |

**Status key:** 🟢 Shipped · 🟡 Release prep · 🔵 Active dev · 🔴 Not started / planning

---

## Dependency Map

```text
Track A ({{name}})
  └── {{PROJ.00}} ──► {{output/release}}

Track B ({{name}})
  └── {{PROJ.01}} ──► {{output/release}}
        └── depends on Track A: {{condition}}
```

---

## Track Details

### Track A — {{Name}}

**Goal:** {{goal}}
**Owner:** {{team/role or "unassigned"}}
**Status:** 🔴 Not started

| ID | Task | Priority | Status |
|----|------|----------|--------|
| {{PROJ.00}} | {{description}} | P0 | ⬜ |

---

### Track B — {{Name}}

**Goal:** {{goal}}
**Owner:** {{team/role or "unassigned"}}
**Status:** 🔴 Not started

| ID | Task | Priority | Status |
|----|------|----------|--------|
| {{PROJ.01}} | {{description}} | P1 | ⬜ |

---

*(Add tracks as needed. Keep this file as the single portfolio overview; detail lives in individual track files under `tracks/`.)*
