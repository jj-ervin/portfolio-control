# Adversarial Audit Log

Status: active
Updated: 2026-06-06

This log records adversarial review findings from normalization runs. Findings should be direct, testable, and resolved or intentionally deferred.

## 2026-06-06 — Governance Kit Normalization

Scope:

- `projects.yaml`
- `dev-status.ps1`
- `validate-pointers.ps1`
- `DEV-PLAN.md`
- `DEV-PATH.md`
- `docs/planning-normalization.md`
- `docs/templates/`
- `docs/SKU-BOUNDARIES.md`

Findings:

| ID | Severity | Finding | Resolution |
|----|----------|---------|------------|
| AUDIT.01 | Medium | Governance Kit was named in roadmap and SKU boundaries but lacked a package overview. | Added `docs/GOVERNANCE-KIT.md`. |
| AUDIT.02 | Medium | The docs promised a planning audit checklist but no checklist existed. | Added `docs/PLANNING-AUDIT.md`. |
| AUDIT.03 | Medium | `validate-pointers.ps1` and `dev-status.ps1` did not share the same pointer vocabulary. | Added missing pointer keys to `dev-status.ps1`. |
| AUDIT.04 | Low | Baseline templates mixed project planning with optional agent/model workflow language. | Moved agent-specific language behind optional sections and made baseline text tool-neutral. |
| AUDIT.05 | Low | The template repo did not point at the Governance Kit and audit docs from its own registry. | Added planning pointers in `projects.yaml`. |
| AUDIT.06 | Low | README and onboarding still described `DEV-PATH` as agent onboarding rather than baseline phase/task lineage. | Updated template descriptions to keep agent workflow optional. |
| AUDIT.07 | Low | A template named a specific editor assistant and old handoff filename in baseline docs. | Replaced with generic placeholders. |
| AUDIT.08 | Low | `PROJECT-STATUS.template.md` still used an old product-specific handoff changelog filename. | Replaced with generic `changelog.md` placeholder. |

Residual risks:

- Governance Kit is documented but not yet separated into its own installable package.
- Agent Kit vocabulary still appears in product positioning docs because DCP's broader market thesis includes agent workflows.
- The YAML parser remains intentionally lightweight and should be replaced if the registry schema grows more complex.
