# Product Identity Kit (PIK)

A small, portable scaffold for brand reference, design tokens, and asset
inventory — deliberately smaller than a "design system." Copy this
directory into a project as `design/identity/`, fill in the placeholders,
delete what doesn't apply.

## What PIK covers vs. what it doesn't

```text
Product Identity Kit = brand voice, tokens, logo/mark, illustration, release assets
Design System        = reusable UI components and interaction patterns
Frontend App          = the code that implements those rules
```

A project should adopt PIK the moment it has *any* real brand/token input —
even one color palette is enough. Do not adopt PIK to invent brand decisions
that don't exist yet; an empty PIK with placeholder files is worse than no
PIK, because it implies decisions were made when they weren't. See Lasso's
`docs/layers/design-system.md` for how that boundary was reasoned through
before real input existed.

A project should build an actual component library only once it has more
than one surface sharing the token layer, or ad-hoc per-element styling is
causing real inconsistency — not just because PIK exists.

## Layout

```text
design/
  identity/
    BRAND.md
    TOKENS.json
    ASSETS.md
    ASSETS-RELEASE.md
    assets/
      README.md
      logo.svg
      mark.svg
      icons/
      illustrations/
```

`ASSETS.md` and `ASSETS-RELEASE.md` are named with the "assets" prefix
first (not `RELEASE-ASSETS.md`) so they alphabetize and scan next to each
other and next to the `assets/` folder in a directory listing.

## Files in this template

| File | Purpose |
| --- | --- |
| `identity/BRAND.template.md` | Product signal, voice, visual direction, identity rules |
| `identity/TOKENS.template.json` | Machine-consumable color/radius/space values — the single source of truth an app fetches or imports, never duplicated into hand-maintained CSS |
| `identity/ASSETS.template.md` | Usage rules for logo/mark/icon files once they exist: sizing, clear-space, do/don't |
| `identity/ASSETS-RELEASE.template.md` | Tracks exported, ready-to-ship formats (favicons, packaged-app icons, extension marketplace icons, social previews) |
| `identity/assets/README.md` | Inventory note for the raw asset files themselves |

Drop the `.template` suffix when copying into a real project
(`BRAND.template.md` → `BRAND.md`).

## Reference implementation

Lasso (`lasso/design/identity/`) is the first real instance of this
template — see `lasso/DEV-PATH.md`'s "Design Contract Layer Migrated to
Product Identity Kit Layout" entry (2026-07-07) for how it was applied and
how an app consumes `TOKENS.json` at runtime (fetch once at startup, apply
each leaf value as a CSS custom property on `:root`).

## Promotion

This lives in `docs/templates/` (portfolio-level, not yet a governance-commons
standard) until a second project actually adopts it. Promote to
`governance-commons/product-identity-kit/` only once that happens — don't
promote a one-project pattern preemptively.
