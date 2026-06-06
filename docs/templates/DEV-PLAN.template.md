# DEVPLAN — {{Project Name}}

**AUTHORITY LEVEL: AL:{{1|2|3}}**
**Status:** ACTIVE
**Updated:** {{YYYY-MM-DD}}

---

## CANONICAL DOC RULE

`DEVPLAN.md` owns: current execution state, active milestones, priority work queue, release targets.
`DEVPATH.md` owns: phase history, design decisions, and task registry.

Do not create competing root planning files with alternate names (`devplan`, `DEV-PLAN`, etc.).
Non-canonical copies must either redirect here or be archived.

---

## CURRENT POSITION

**Active phase:** {{Phase N — Name}}
**Active tracks:** {{Track A, Track B, ...}}
**Current version:** {{vX.Y.Z}}
**Next release target:** {{vX.Y.Z}} ({{milestone description}})

**P0 blockers — must resolve before any new feature work:**

- {{blocker description}}
- *(none)* — unblock when applicable

---

## RELEASE STATUS

| Item | Target | Track | Status |
|------|--------|-------|--------|
| {{milestone/feature}} | {{vX.Y.Z}} | {{A/B/C}} | ⬜ |
| {{milestone/feature}} | {{vX.Y.Z}} | {{A/B/C}} | ✅ |

Status key: ✅ Done · 🔄 In progress · ⬜ Planned · ❌ Blocked

---

## PRIORITY WORK ITEMS

| ID | Task | Track | Priority |
|----|------|-------|----------|
| {{PROJ.00}} | {{description}} | {{A}} | P0 |
| {{PROJ.01}} | {{description}} | {{B}} | P1 |

---

## RECENTLY COMPLETED

- {{PROJ.00}} — {{description}}

---

## DEFERRED / OUT OF SCOPE

- {{item}} — deferred to {{vX.Y.Z}} or reason

---

## NORMALIZATION NOTES

- Registry pointer: `planning.canonical`
- Companion history file: `DEVPATH.md`
- Tracks file required: {{yes/no}}
