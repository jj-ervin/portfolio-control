# Governance Commons Repository Reconciliation - 2026-08-28

Read-only reconciliation of the local Governance Commons portfolio under `C:\dev`
against the `governancecommons/*` and `jj-ervin/*` GitHub surfaces, package
registries, and the public GC v1.2 publication story.

No commit, merge, push, publish, tag, branch creation, or repair was performed.
The only intentional write from this reconciliation is this report.

## Executive Verdict

Governance Commons v1.2 exists as a real release train with public component
releases, a PyPI SDK package, and a public GitHub Pages site. It does not yet
exist as a clean, single-source, machine-valid public release artifact.

The active local work is the `governancecommons/*` ownership set under
`C:\dev\governance-commons`. The older `jj-ervin/*` component repositories are
not safe to treat as canonical. Several `jj-ervin/*` public sites still exist,
which creates discoverability and authority confusion.

Most engineering value is in the specs, validators, test fixtures, evidence
grammar, and release discipline. The biggest risks are publication coherence:
custom-domain TLS failure, invalid GC v1.2 manifest under its own schema,
README/version drift, npm package claims without a live npm package, and Matrix
examples failing the Matrix validator.

## Scope And Method

Read first, per `C:\dev\AGENTS.md`:

- `C:\dev\governance-commons\passes\dev-accord\DEV-ACCORD.03.md`
- `C:\dev\PROTECTED.md`
- `C:\dev\DEV-CONTROL-PLANE.md`
- `C:\dev\docs\REVIEW-GRAMMAR.md`
- `C:\dev\governance-commons\passes\dev-accord\DEV-ACCORD.02.md`
- `C:\dev\governance-commons\passes\dev-accord\DEV-ACCORD.06.md`
- `C:\dev\governance-commons\passes\dev-accord\DEV-ACCORD.10.md`
- `C:\dev\governance-commons\projects.yaml`

Read-only evidence gathered:

- Local Git inventory from every `.git` directory under
  `C:\dev\governance-commons`.
- Local release, SDK, package, website, schema, governance, and planning files.
- Live GitHub repo, release, Pages, head, and tag data through `gh`, read-only.
- Live PyPI/npm registry metadata, read-only.
- Public website/schema HEAD requests, read-only.
- Safe local tests/builds/validators where already installed dependencies made
  this feasible.

Important limitation: I did not run `git fetch`, clone missing remotes, or
modify remote-tracking refs. Ahead/behind values below are against the local
tracking refs already present. Live remote heads and tags were checked with
`git ls-remote`/`gh`, so remote head identity is still recorded.

## Local Repository Topology

All local GC-related Git repositories found under `C:\dev\governance-commons`:

| Role | Absolute path | Local origin | Branch | Upstream | Local ahead/behind | Head |
| --- | --- | --- | --- | --- | --- | --- |
| Umbrella GC/source governance | `C:\dev\governance-commons` | `https://github.com/governancecommons/governance-commons.git` | `main` | `origin/main` | `0/0` | `234cc73a71a8e84490eea71c2e5a8dc9a41f9d4d` |
| Agent Dossier | `C:\dev\governance-commons\agent-dossier` | `https://github.com/governancecommons/agent-dossier.git` | `main` | `origin/main` | `0/0` | `c87c8b72cadd244ce0b66e8b8de89c8887eb0d68` |
| Agent Dossier website | `C:\dev\governance-commons\agent-dossier-www` | `https://github.com/governancecommons/agent-dossier-www.git` | `main` | `origin/main` | `0/0` | `b7cddf3d2b43e8369f96291d279640b16afd58c7` |
| Agent Matrix | `C:\dev\governance-commons\agent-matrix` | `https://github.com/governancecommons/agent-matrix.git` | `main` | `origin/main` | `0/0` | `1702df8c9a06861a0dead5209b97758b95f8c503` |
| Agent Matrix nested clone/placeholder | `C:\dev\governance-commons\agent-matrix\remote` | none | `master` | none | n/a | reported as `HEAD` |
| Agent Project Orchestrator | `C:\dev\governance-commons\agent-project-orchestrator` | `https://github.com/governancecommons/agent-project-orchestrator.git` | `main` | `origin/main` | `0/0` | `33e4e7bd8caa7c33b838620c9e0c34770b139007` |
| APO nested clone/placeholder | `C:\dev\governance-commons\agent-project-orchestrator\remote` | none | `master` | none | n/a | reported as `HEAD` |
| Agent Roster | `C:\dev\governance-commons\agent-roster` | `https://github.com/governancecommons/agent-roster.git` | `main` | `origin/main` | `0/0` | `782a4656d9e36e189cdaea67f8498204ae7d7ea0` |
| Agent Team Protocol | `C:\dev\governance-commons\agent-team-protocol` | `https://github.com/governancecommons/agent-team-protocol.git` | `main` | `origin/main` | `0/0` | `7cdbf18a36777d5dfe6585f6dbaf805deeb7deab` |
| GC SDK/package | `C:\dev\governance-commons\governance-commons-sdk` | `https://github.com/governancecommons/governance-commons-registry.git` | `main` | `origin/main` | `0/0` | `2ac683492b4bb519c90005f26df62b23bec368a6` |
| GC website | `C:\dev\governance-commons\governance-commons-www` | `https://github.com/governancecommons/governance-commons-www.git` | `main` | `origin/main` | `0/0` | `fe0f2bd97c5388b6469672c449a7c4942262ab24` |
| GC website nested clone/placeholder | `C:\dev\governance-commons\governance-commons-www\remote` | none | `master` | none | n/a | reported as `HEAD` |
| ONS | `C:\dev\governance-commons\ons` | `https://github.com/governancecommons/ons.git` | `main` | `origin/main` | `0/0` | `a620966513d0eb5a67c0b7b6df92c40620ebb094` |
| ONS nested clone/placeholder | `C:\dev\governance-commons\ons\remote` | none | `master` | none | n/a | reported as `HEAD` |

All audited worktrees reported clean on `git status --short --branch`, with
PowerShell warnings about inaccessible global Git ignore files and one
inaccessible `.pytest_cache` directory. The status output did not show
uncommitted tracked changes in the audited repositories.

Latest local commits:

| Repo path | Latest commit |
| --- | --- |
| `C:\dev\governance-commons` | `234cc73` - `feat(gc-audit): activate gc-audit.verify, was a planned stub since creation` |
| `C:\dev\governance-commons\agent-dossier` | `c87c8b7` - `Normalize DEV-ACCORD docs and bootstrap` |
| `C:\dev\governance-commons\agent-dossier-www` | `b7cddf3` - `chore: exclude DEV-DOCS (repo is public; docs live in private dev-docs repo)` |
| `C:\dev\governance-commons\agent-matrix` | `1702df8` - `feat(workflows): expand agent workflow pattern metadata` |
| `C:\dev\governance-commons\agent-project-orchestrator` | `33e4e7b` - `docs: fix version claim contradicting tagged v1.1.0 release` |
| `C:\dev\governance-commons\agent-roster` | `782a465` - `feat(roster): generate ranked README tables from roster data` |
| `C:\dev\governance-commons\agent-team-protocol` | `7cdbf18` - `docs(protocol): align repository guidance and planning` |
| `C:\dev\governance-commons\governance-commons-sdk` | `2ac6834` - `feat: implement capability contract MVP` |
| `C:\dev\governance-commons\governance-commons-www` | `fe0f2bd` - `chore: exclude DEV-DOCS (repo is public; docs live in private dev-docs repo)` |
| `C:\dev\governance-commons\ons` | `a620966` - `Normalize DEV-ACCORD docs and bootstrap` |

Subfolders/components under the umbrella tree that are not independent Git
repositories but were included in the topology scan: `.github`, `docs`,
`gc-audit`, `governance`, nested `governance-commons`, `governance-commons-vscode`,
`passes`, `profiles`, `registry`, `releases`, `review-templates`, `rfcs`,
`schemas`, `scripts`, and `tools`.

## Remote Ownership Reconciliation

`governancecommons/*` is the active ownership set found locally and remotely.

Live `governancecommons` repositories relevant to GC:

| Repo | Visibility | Default branch | Latest known remote head/tag state |
| --- | --- | --- | --- |
| `governancecommons/governance-commons` | private | `main` | `main` = `234cc73a71a8e84490eea71c2e5a8dc9a41f9d4d`; no GitHub releases found |
| `governancecommons/agent-dossier` | private | `main` | `main` = `c87c8b72cadd244ce0b66e8b8de89c8887eb0d68`; tags `v1.0.0` through `v1.1.0`; latest release `v1.1.0` |
| `governancecommons/agent-matrix` | private | `main` | `main` = `1702df8c9a06861a0dead5209b97758b95f8c503`; tag/release `v1.4.0` |
| `governancecommons/ons` | private | `main` | `main` = `a620966513d0eb5a67c0b7b6df92c40620ebb094`; releases `v1.2.0`, `v1.3.0` |
| `governancecommons/agent-project-orchestrator` | private | `main` | `main` = `33e4e7bd8caa7c33b838620c9e0c34770b139007`; tag/release `v1.1.0` |
| `governancecommons/agent-team-protocol` | private | `main` | `main` = `7cdbf18a36777d5dfe6585f6dbaf805deeb7deab`; no releases found |
| `governancecommons/agent-roster` | private | `main` | `main` = `782a4656d9e36e189cdaea67f8498204ae7d7ea0`; tag `v1.0.0`; no releases found |
| `governancecommons/governance-commons-registry` | private | `main` | `main` = `2ac683492b4bb519c90005f26df62b23bec368a6`; tags `sdk-v0.1.1`, `sdk-v0.2.0`; no GitHub releases found |
| `governancecommons/governance-commons-www` | public | `main` | `main` = `fe0f2bd97c5388b6469672c449a7c4942262ab24`; GitHub Pages public URL live |
| `governancecommons/agent-dossier-www` | private | `main` | `main` = `b7cddf3d2b43e8369f96291d279640b16afd58c7`; no releases found |
| `governancecommons/governance-commons-vscode` | private | no default branch | remote exists but no default branch was reported |

Relevant `jj-ervin/*` repositories still exist and must not be treated as
canonical without an explicit decision:

| Repo | Visibility | Default branch | Remote head | Reconciliation finding |
| --- | --- | --- | --- | --- |
| `jj-ervin/governance-commons-www` | public | `main` | `f96f92e875e3cc9c8d68d4520f2a742f9b7db86a` | Public duplicate website exists; history is not proven aligned with `governancecommons/governance-commons-www` in local clones |
| `jj-ervin/agent-dossier-www` | public | `main` | `5f8b66cb600f1dc6e24719f27a3ffd42cd1cdb1c` | Public duplicate/spec-site surface exists |
| `jj-ervin/agent-dossier` | private | `main` | `42677aecefe7e53df3f1b5edcb895b95add3d7e1` | Older component repo; tags stop at `v1.0.3`, while `governancecommons` has `v1.1.0` |
| `jj-ervin/agent-matrix` | private | `main` | `6c92df488dbb10a6cd398b9916194ca7639dc7fa` | Older component repo; no remote tags returned in this check |
| `jj-ervin/ons` | private | `main` | `82f4f6c30b75f693d8b2a8a96d937f7051b65991` | Older component repo; corresponds to ONS `v1.2.0` era, not current `v1.3.0` release |
| `jj-ervin/agent-project-orchestrator` | private | `main` | `af7b7c7b13eb26b47ebce7f87aac3e46f2431c67` | Older component repo relative to `governancecommons` head |

I tested whether those `jj-ervin` commit objects existed in the local
`governancecommons/*` clones. They did not, so ancestry was not proven locally
without fetching. The safe statement is: `jj-ervin/*` and `governancecommons/*`
currently expose different remote heads, and the `governancecommons/*` repos
match the local origins.

## GC v1.2 Release Source

The exact local GC v1.2 release manifest is:

- `C:\dev\governance-commons\releases\gc-v1.2.0.yaml`
- Current umbrella repository head: `234cc73a71a8e84490eea71c2e5a8dc9a41f9d4d`
- Release manifest history:
  - `4a8817a750c47fdeb50fe5507152c626fb0e1f27` - initial release train batch artifacts
  - `b742b17fe5b144249ea106e2139ff89aa0ebec68` - advanced `gc-v1.2.0` to ready
  - `c5641b5e7c59c1c3442828095c45c0f7afd0f117` - changed PASS ID format

Manifest content:

- `release_id: GC-v1.2.0`
- `gc_version: "1.2.0"`
- `status: ready`
- `milestone: M2`
- `gc_pass_id: GC-PASS-0015.00`
- Component pins:
  - `governancecommons/agent-dossier`, min `1.1.0`, pinned `1.1.0`
  - `governancecommons/agent-matrix`, min `1.3.0`, pinned `1.4.0`
  - `governancecommons/ons`, min `1.2.0`, pinned `1.3.0`
  - `governancecommons/agent-project-orchestrator`, min `1.1.0`, pinned `1.1.0`
  - `agent-team-protocol` explicitly not included; targeted for GC v1.3.0

Critical defect: the release manifest does not validate against its declared
schema `C:\dev\governance-commons\schemas\gc-release-manifest.schema.json`.
The executable validation returned three errors:

- Root `gc_schema_version` is required.
- Root additional properties are not allowed: `ready_at` and BOM-prefixed
  `gc_schema_version` were seen.
- `gc_pass_id: GC-PASS-0015.00` does not match the schema pattern
  `^GC-PASS-[0-9]{4}-[0-9]{4}$`.

This means the manifest is a human-readable release source and planning record,
but not currently a machine-valid authoritative release artifact.

No GitHub Release or root tag for umbrella `governancecommons/governance-commons`
GC v1.2.0 was found. Public proof of GC v1.2 is therefore distributed across
the component releases, website, and PyPI package rather than one umbrella
release object.

## Version Matrix

| Layer | Artifact/source | Current evidence | Reconciliation |
| --- | --- | --- | --- |
| Umbrella GC release | `releases/gc-v1.2.0.yaml` | `gc_version: "1.2.0"`, `status: ready` | Release train exists, but manifest is schema-invalid and no root GitHub release was found |
| Agent Dossier release pin | GC v1.2 manifest | pinned `1.1.0`; GitHub release `v1.1.0` exists | Public component release aligns with GC v1.2 pin |
| Agent Dossier spec head | `agent-dossier\agent-dossier.yaml` | `version: 1.4.0` | Head spec is ahead of GC v1.2 public pin |
| Agent Dossier package/runtime | `agent-dossier\pyproject.toml` | `agent-dossier-validator` version `1.1.0` | Runtime/package aligns with public release pin, not spec head |
| Website Dossier | `governance-commons-www\site\src\data\standards.ts` | displays version `1.1.0`; schema path `/agent-dossier/v/1.0.2/...` | Website version and schema version are intentionally or accidentally split |
| Agent Matrix release pin | GC v1.2 manifest | pinned `1.4.0`; GitHub release `v1.4.0` exists | Public component release aligns with GC v1.2 pin |
| Agent Matrix spec head/package | `agent-matrix\agent-matrix.yaml`, `pyproject.toml` | spec/package `1.6.0` | Head development is ahead of public release; public site also exposes `v/1.6.0` schema path |
| Website Matrix | `standards.ts` plus public schema HEAD | displays `1.4.0`; public schemas at `/v/1.4.0/` and `/v/1.6.0/` return 200 | Published website mixes stable release and newer schema exposure |
| ONS release pin | GC v1.2 manifest | pinned `1.3.0`; GitHub release `v1.3.0` exists | Public component release aligns with GC v1.2 pin |
| ONS spec head | `ons\ons.yaml` | `version: 1.4.0`; example `ons_version: "1.3.0"` | Head spec is ahead of public release; examples lag head |
| Website ONS | `standards.ts` | displays `1.3.0`; schema path `/ons/v/1.2.0/...` | Website release version and schema version are split |
| APO release pin | GC v1.2 manifest | pinned `1.1.0`; GitHub release `v1.1.0` exists | Public component release aligns with GC v1.2 pin |
| APO runtime | `agent-project-orchestrator\pyproject.toml` | package `agent-project-orchestrator` version `1.1.0`; description still says Dossier v1.0.0 | Runtime version aligns with GC pin; dependency wording is stale |
| Governance Commons SDK Python | PyPI + `pyproject.toml` | PyPI `governance-commons` version `0.2.0`; local `pyproject.toml` version `0.2.0` | Published and aligned |
| Governance Commons SDK npm | npm registry + `package.json` | npm `governance-commons` returned 404; local `package.json` version `0.1.1` | Package claim exists locally, but npm publication is absent |
| Website custom domain | Pages API + HEAD | GitHub Pages URL returns 200; `governancecommons.org` TLS fails and HTTP returns 404; Pages `cname: null` | Canonical domain publication is broken |

## Registry And Package Verification

Read-only registry checks:

- PyPI `governance-commons`: 200 OK, latest version `0.2.0`, releases
  `0.1.0`, `0.1.1`, `0.2.0`, repository URL
  `https://github.com/governancecommons/governance-commons-registry`.
- PyPI `governance-commons-py`: 404.
- npm `governance-commons`: 404.
- npm `governance-commons-js`: 404.
- npm `@governance-commons/governance-commons`: 404.

Local package declarations:

- `C:\dev\governance-commons\governance-commons-sdk\pyproject.toml` declares
  package `governance-commons`, version `0.2.0`, CLI entries `gc-validate`,
  `gc-report`, and `gc-discover`.
- `C:\dev\governance-commons\governance-commons-sdk\package.json` declares npm
  package `governance-commons`, version `0.1.1`, bins `gc-validate` and
  `gc-report`.
- The SDK README still instructs `npm install governance-commons`, but that
  package is not published.

## Publication Surface

Live public checks:

- `https://governancecommons.github.io/governance-commons-www/` returned 200.
- `https://jj-ervin.github.io/governance-commons-www/` returned 200.
- `https://governancecommons.org/` failed TLS connection.
- `http://governancecommons.org/` returned 404.
- Public schema URLs under GitHub Pages returned 200 for:
  - `/agent-dossier/v/1.0.2/schemas/agent-dossier.schema.json`
  - `/agent-matrix/v/1.4.0/schemas/agent-matrix.schema.json`
  - `/agent-matrix/v/1.6.0/schemas/agent-matrix.schema.json`
  - `/ons/v/1.2.0/schemas/ons.schema.json`

The website public JSON tree contains 88 `$id` values pointing at
`https://governancecommons.org/...`. Since the custom domain fails TLS and is
not attached as a Pages CNAME, those canonical `$id` URLs are not currently
resolvable through the canonical host even when their GitHub Pages copies exist.

## Safe Executable Checks

Safe checks run during reconciliation:

- Umbrella governance validators:
  - `validate-registry.ps1`: passed.
  - `validate-planning.ps1`: 27 docs checked, passed.
  - `validate-playbook.ps1`: 19 records checked, passed with 0 warnings.
  - `validate-ci-invariants.ps1`: 49 unique IDs, passed.
  - `validate-review-grammar.ps1`: passed.
- GC v1.2 release manifest schema validation: failed with 3 errors listed
  above.
- Agent Dossier strict validator on its canonical spec: passed with 0 findings.
- ONS validator on canonical spec: passed with 0 findings.
- ONS test suite: 112 passed, with a pytest-cache permission warning.
- APO test suite: 113 passed, with a pytest-cache permission warning.
- APO static checks:
  - `ruff check .`: failed with 35 errors, 34 fixable.
  - `mypy`: failed with 43 errors in 13 files.
- Governance Commons SDK:
  - Python tests: 184 passed, with a pytest-cache permission warning.
  - npm tests: passed.
- Governance Commons website:
  - `npm run build`: passed after one earlier timeout; generated the normal
    Astro `dist` output.
- Agent Matrix examples against Matrix's validator:
  - `mcp-enabled-matrix.yaml`: passed.
  - `multi-provider-sku-routing.yaml`: passed.
  - `compliance-evidence-export.yaml`: failed because schema requires exactly
    5 CloudEvents `event_type_mappings`, while the example has 7.
  - `data-pipeline-agents.yaml`: failed required section/profile fields.
  - `full-stack-dev-team.yaml`: failed required section/profile fields.
  - `minimal-matrix.yaml`: failed required section/profile fields.

The Matrix CloudEvents schema requires `event_type_mappings` and sets
`minItems: 5` and `maxItems: 5`; this is enforced, and it is the direct cause
of one shipped example failure.

## Classification Of Findings

### Already Implemented

- Active local repos are aligned with `governancecommons/*` origins and local
  tracking branches.
- Four GC v1.2 component releases exist publicly as GitHub releases:
  Agent Dossier `v1.1.0`, Agent Matrix `v1.4.0`, ONS `v1.3.0`, APO `v1.1.0`.
- Python SDK/package `governance-commons` version `0.2.0` is published on PyPI.
- Agent Dossier strict validation and ONS validation pass locally.
- ONS, APO, and SDK test suites pass locally.
- GC root planning/registry/playbook/review validators pass locally.
- Website builds locally and public GitHub Pages site returns 200.
- Agent Matrix includes real, detailed bindings for cost/SKU routing,
  CloudEvents, MCP policy, A2A task binding, approval gates, idempotency, and
  trace context.
- Dossier includes schema/spec fields for status, expiry, revocation,
  crypto identity, and signed messages.

### Specified But Not Enforced

- GC v1.2 release readiness is specified, but the release manifest fails its own
  schema and no umbrella GC GitHub release/tag was found.
- Dossier revocation/signature/crypto identity rules are specified, but this
  reconciliation did not prove live cryptographic verification or runtime
  rejection of revoked identities across adopters.
- Matrix MCP/A2A/approval/CloudEvents policies are specified, but four of six
  shipped examples fail validation and no live multi-agent runtime conformance
  harness was proven here.
- NIST/ISO mapping files label many controls `full`, but several cited
  artifacts are recommendation/specification files, not proof of deployed
  operational controls.
- The website and schema `$id` values specify `governancecommons.org` as
  canonical, but that host is not correctly published.
- npm package availability is documented, but no npm package is live.
- `ADOPTERS.md` defines conformance-profile intake, but the adopters table is
  empty.

### Partially Implemented

- GC v1.2 public release: component releases, PyPI, and GitHub Pages exist; npm,
  custom domain, manifest validity, and umbrella release closure are incomplete.
- SDK/reference implementation: Python supports ONS and capability contract
  paths; local docs still say broader Dossier/Matrix/APO validation is planned
  or inconsistent.
- Capability Contract: the capability declaration/discovery layer exists, but
  prior local docs explicitly say discovery does not grant execution authority.
- APO runtime: tests pass, but static quality gates fail and Dossier dependency
  references remain stale.
- Governance coverage mappings: NIST/ISO/SOC2 mapping files exist, but the
  evidence grading is too strong for several controls.

### Missing

- No umbrella `governancecommons/governance-commons` GitHub release/tag for
  GC v1.2.0 was found.
- No live npm package was found for the checked package names.
- No working `governancecommons.org` Pages CNAME/TLS publication was found.
- No external adopters are listed in `ADOPTERS.md`.
- Several repos lack repo-root governance files:
  - `agent-matrix`: no `LICENSE` file despite README claiming MIT.
  - `agent-project-orchestrator`: no `LICENSE`, `CONTRIBUTING.md`, or
    `SECURITY.md`.
  - `agent-team-protocol`: no `LICENSE`, `CONTRIBUTING.md`, or `SECURITY.md`.
  - `governance-commons-www` and `agent-dossier-www`: no repo-root license or
    security files.

### Inconsistent

- `releases/gc-v1.2.0.yaml` has BOM/schema/PASS-ID issues against
  `schemas/gc-release-manifest.schema.json`.
- DEV-PLAN says GC v1.2.0 is ready while DEV-RELEASE still labels the public
  release in progress and has unchecked release criteria.
- Agent Dossier README still presents version `1.0.0` and links badges to
  `jj-ervin/agent-dossier`, while the active release pin is `v1.1.0` under
  `governancecommons/agent-dossier`.
- Agent Matrix README presents `1.4.0`, while spec/package head is `1.6.0`.
- ONS README presents `1.1.0`, while GC v1.2 pins `1.3.0` and spec head is
  `1.4.0`.
- Website version rows and schema paths do not always match the same component
  version.
- Both `governancecommons.github.io/governance-commons-www/` and
  `jj-ervin.github.io/governance-commons-www/` are public and live.

### Obsolete Or Superseded

- `jj-ervin/agent-dossier`, `jj-ervin/agent-matrix`, `jj-ervin/ons`, and
  `jj-ervin/agent-project-orchestrator` are superseded by the
  `governancecommons/*` repos for current local work.
- Nested `remote` Git directories under Matrix, APO, ONS, and GC website have
  no origin/upstream and should be treated as local artifacts until classified.
- The phrase/name `Project Orchestrator Agent` is superseded in local active
  repos by `agent-project-orchestrator`/APO, but external references may still
  use the older wording.

### Externally Distinctive

- Agent Matrix cost/SKU-aware routing is genuinely unusual: model economics are
  a first-class routing input, not only an implementation concern.
- Dossier-style authority lifecycle and revocation are stronger than what MCP
  or A2A alone provide.
- PASS/RUN/PLAY/evidence-bundle discipline is close to NIST's emerging
  "agentic evaluation probes" idea: machine-readable audit trails, adversarial
  checks, provenance, and evidence-backed claims.
- GC's strongest social-impact framing is not "another agent framework"; it is
  a sociotechnical governance layer for agentic work: identity, accountability,
  consent, auditable authority, adoption risk, and workforce/workplace
  consequences.

## External Standards Comparison

### NIST AI Agent Standards Initiative And AI RMF

NIST's 2026 AI Agent Standards Initiative emphasizes interoperable, secure,
industry-led standards, open-source protocol maintenance, and research in
security and identity. GC aligns strongly at the problem-framing level:
identity, interoperability, evidence trails, and governance are core themes.

NIST's AI RMF is broader than GC. The RMF addresses risks to individuals,
organizations, and society through Govern, Map, Measure, and Manage functions.
GC has useful artifacts mapped to those functions, but the mapping overclaims
when it labels documentation-only artifacts as `full` operational control
satisfaction. The clearest example is `MEASURE.2.8`, marked `full` even though
the cited observability artifact "recommends" an audit sink and metrics rather
than proving a deployed monitored system.

NIST's agentic evaluation probe work asks for visibility into reasoning,
tool-use, gathered evidence, adversarial verifiers, structured verdicts, and
machine-readable audit trails. GC is directionally close here. PASS/RUN/PLAY
and conformance reports are a plausible standards-native expression of that
model. The gap is enforcement and public proof.

### OWASP Agentic Security And Multi-Agent Threat Modeling

OWASP's multi-agent guidance focuses on the new attack surfaces created by
multiple autonomous agents. GC has credible primitives for this space:
identity, revocation, allowed tools, approvals, event traces, namespace
registration, and threat-model files.

The weak point is that several protections are specified but not demonstrated
as an integrated runtime control plane. A schema can require `approval` or
`revocation`, but that is not the same as a runtime refusing a dangerous tool
call, rejecting a revoked dossier, preserving an audit chain, or preventing
policy bypass between cooperating agents.

### AAIF, AGENTS.md, MCP, And A2A

AAIF's public working-group landscape overlaps heavily with GC's themes:
identity/trust, observability/traceability, security/privacy, workflow/process
integration, taxonomy, and governance/risk/regulatory concerns.

AGENTS.md has a much narrower and more widely legible role: a predictable
repository instruction file for agents. GC should not compete with AGENTS.md as
"the agent README". It should position itself as a higher-governance layer that
can consume AGENTS.md-style instructions as one evidence/input source.

MCP now has mature authorization language for HTTP transports, OAuth/OIDC
patterns, scopes, and protected-resource discovery. GC's MCP-related policy
adds governance semantics above transport authorization: which agent may call
which tool, under which dossier, with what evidence and approval state.

A2A supplies an interoperability protocol for opaque agents, task states,
agent cards, negotiation, and auth-required interruption states. GC's value
should be presented as complementary: identity, conformance, release evidence,
revocation, and audit semantics layered around A2A task exchange.

### Microsoft Agent Framework, AutoGen, And Current Practice

Microsoft Agent Framework/AutoGen practice now centers on hosted agents,
workflows, human-in-the-loop approval requests, versioning, evaluation,
monitoring, and OpenTelemetry-backed observability. GC overlaps with these
operational concerns but is not a replacement framework.

The best fit is to present GC as a portable governance/specification layer that
agent frameworks can adopt: dossier identity, matrix routing, namespace
registration, approval evidence, conformance reports, and audit probes.

OpenTelemetry GenAI semantic conventions are moving toward common spans,
metrics, logs, tool-call instrumentation, agent identifiers, and tool execution
spans. GC should align any observability contract with those conventions rather
than inventing an isolated telemetry vocabulary.

## Repository Coverage And Exclusions

Included:

- Every `.git` repository found under `C:\dev\governance-commons`.
- The umbrella GC repo, component standards, SDK/package repo, website repos,
  governance mappings, release manifests, planning docs, schemas, and public
  package/site surfaces.
- Known relevant GitHub ownership sets: `governancecommons/*` and `jj-ervin/*`.

Listed but not deeply audited as canonical source:

- Nested `remote` directories under Matrix, APO, ONS, and GC website. They have
  no origin/upstream and appear to be local clone artifacts/placeholders.
- `node_modules`, `.venv`, `.pytest_cache`, `.astro`, `dist`, and generated
  build/cache directories. These were not audited as source truth.
- `governance-commons-vscode`: local folder exists under the umbrella tree, and
  a remote `governancecommons/governance-commons-vscode` exists with no default
  branch, but there was no active local Git repository to reconcile.
- Non-GC sibling portfolio repos such as `time-loc` and `governed-event`,
  except where GitHub org listing showed they exist in the same ownership
  namespace.

Not performed:

- No `git fetch`.
- No remote mutation.
- No package publish or dry-run that would require credentials.
- No tag creation.
- No release creation.
- No deletion or cleanup of generated artifacts/caches.

## Dependency-Ordered Repair Plan

1. Declare canonical ownership for public consumption: `governancecommons/*` is
   source-of-truth; `jj-ervin/*` public surfaces are legacy mirrors or redirects.
2. Fix publication routing before touching claims: attach the correct Pages CNAME
   or change public schema `$id`/links to the real canonical host; verify all 88
   `$id` URLs.
3. Repair `releases/gc-v1.2.0.yaml` so it validates: remove the BOM issue,
   reconcile or schema-allow `ready_at`, and settle PASS ID format against
   DEV-ACCORD terminology.
4. Add/re-run a root release-manifest validator in the GC audit chain so a
   schema-invalid "ready" release cannot silently pass.
5. Produce a single authoritative version matrix in the website/docs that
   separates umbrella release, component release, schema path, package/runtime,
   and head-development versions.
6. Correct package truth: either remove npm install/publication claims or publish
   the npm package through an approved release process.
7. Fix Agent Matrix shipped examples and CI before promoting Matrix head/schema
   `1.6.0` as public-stable.
8. Fix APO static quality gates and stale Dossier version wording before using
   APO as a reference runtime proof.
9. Add missing repo-root `LICENSE`, `SECURITY.md`, and `CONTRIBUTING.md` files
   where public/commercial reuse expectations require them.
10. Downgrade NIST/ISO/SOC2 coverage labels where evidence is specification-only;
    reserve `full` for tested, deployed, or otherwise operationally proven
    controls.
11. Create a small public conformance/adopter pilot that proves GC can be
    adopted by a repo that was not authored inside the GC tree.
12. Only after the publication and evidence corrections land, cut the next
    release.

## Proposed Next Release Version

Recommended next release: `GC v1.2.1`.

Reason: the immediate work is a publication-truth and reconciliation patch, not
a new standards milestone. `v1.2.1` should fix the canonical domain, manifest
validity, package claims, README/version drift, and release evidence without
changing the GC v1.2 component compatibility contract.

Reserve `GC v1.3.0` for the next standards-bearing release after Matrix/APO
repairs, npm truth, conformance/adopter proof, and any inclusion of Agent Team
Protocol or newer component heads.

## Local Evidence Line Index

Release source and release semantics:

- `C:\dev\governance-commons\releases\gc-v1.2.0.yaml:1-9` declares
  `GC-v1.2.0`, `gc_version: "1.2.0"`, `status: ready`, milestone `M2`, and
  `gc_pass_id: GC-PASS-0015.00`.
- `C:\dev\governance-commons\releases\gc-v1.2.0.yaml:12-35` pins Agent
  Dossier `1.1.0`, Agent Matrix `1.4.0`, ONS `1.3.0`, and APO `1.1.0`.
- `C:\dev\governance-commons\releases\gc-v1.2.0.yaml:39-44` says GC v1.2.0
  is ready, GitHub Releases exist for all four specs, PyPI/npm require
  publishing setup, and ATP is not included until a later GC release.
- `C:\dev\governance-commons\schemas\gc-release-manifest.schema.json:7-14`
  requires `gc_schema_version`; `:120-124` defines the incompatible
  `gc_pass_id` pattern.
- `C:\dev\governance-commons\DEV-PLAN.md:486` says GC milestones are
  informational pinning contracts, not CI gates.
- `C:\dev\governance-commons\DEV-PLAN.md:512` says GC v1.2.0 has been ready
  since 2026-06-17, while PyPI/npm publish remained open in that row.
- `C:\dev\governance-commons\DEV-RELEASE.md:57-78` still frames v1.2.0 as a
  public-release track and lists what should ship.
- `C:\dev\governance-commons\DEV-RELEASE.md:87-99` contains unchecked
  admission criteria, including npm/PyPI clean-machine proof and
  `governancecommons.org` live.

Website-published versions:

- `C:\dev\governance-commons\governance-commons-www\site\src\data\standards.ts:22-32`
  displays Agent Dossier `1.1.0` but links schema path `v/1.0.2`.
- `C:\dev\governance-commons\governance-commons-www\site\src\data\standards.ts:48-58`
  displays Agent Matrix `1.4.0` and links schema path `v/1.4.0`.
- `C:\dev\governance-commons\governance-commons-www\site\src\data\standards.ts:74-84`
  displays ONS `1.3.0` but links schema path `v/1.2.0`.
- `C:\dev\governance-commons\governance-commons-www\site\src\data\standards.ts:100-110`
  displays APO `1.1.0` and links to the GitHub schema tree rather than a
  versioned website schema path.

Component version drift:

- `C:\dev\governance-commons\agent-dossier\README.md:3-5` still advertises
  version `1.0.0` and badge URLs under `jj-ervin`.
- `C:\dev\governance-commons\agent-dossier\README.md:35-47` references
  `governancecommons.org/agent-dossier/v/1.0.2/...` schema URLs.
- `C:\dev\governance-commons\agent-dossier\agent-dossier.yaml:1-4` declares
  spec version `1.4.0`.
- `C:\dev\governance-commons\agent-matrix\README.md:3-7` advertises version
  `1.4.0`, Stable, MIT, and Dossier Alignment `v1.0.2`.
- `C:\dev\governance-commons\agent-matrix\agent-matrix.yaml:1-21` declares
  canonical spec `1.6.0` and stability `stable`.
- `C:\dev\governance-commons\ons\README.md:3-5` advertises version `1.1.0`.
- `C:\dev\governance-commons\ons\ons.yaml:14-16` declares version `1.4.0`,
  while `:467` still has an example/reference `ons_version: "1.3.0"`.
- `C:\dev\governance-commons\agent-project-orchestrator\pyproject.toml:5-8`
  declares package version `1.1.0` but describes Dossier `v1.0.0`.

SDK/package truth:

- `C:\dev\governance-commons\governance-commons-sdk\README.md:1-12` describes
  the SDK as alpha and says Python validates ONS plus Capability Contract v0.1,
  while npm remains ONS-only.
- `C:\dev\governance-commons\governance-commons-sdk\README.md:16-19`
  documents `pip install governance-commons` and `npm install governance-commons`.
- `C:\dev\governance-commons\governance-commons-sdk\README.md:64-67` names
  Python and npm package endpoints as `governance-commons`.
- `C:\dev\governance-commons\governance-commons-sdk\pyproject.toml:5-8`
  declares PyPI package `governance-commons` version `0.2.0`.
- `C:\dev\governance-commons\governance-commons-sdk\pyproject.toml:42-45`
  declares CLIs `gc-validate`, `gc-report`, and `gc-discover`.
- `C:\dev\governance-commons\governance-commons-sdk\package.json:1-4`
  declares npm package `governance-commons` version `0.1.1`.
- `C:\dev\governance-commons\governance-commons-sdk\package.json:22-24`
  declares npm bins `gc-validate` and `gc-report`.

Adoption and conformance:

- `C:\dev\governance-commons\ADOPTERS.md:3-5` says conformance is
  self-declared until a certification program exists.
- `C:\dev\governance-commons\ADOPTERS.md:11-18` tells adopters to verify with
  `gc-validate` and include a `gc-report`.
- `C:\dev\governance-commons\ADOPTERS.md:23-27` shows the adopters table is
  empty.
- `C:\dev\governance-commons\ADOPTERS.md:31-39` defines advisory, standard,
  and strict conformance profiles.

Security/governance mappings:

- `C:\dev\governance-commons\governance\nist-ai-rmf-mapping.yaml:18-22`
  defines `full`, `partial`, `planned`, and `out_of_scope` coverage levels.
- `C:\dev\governance-commons\governance\nist-ai-rmf-mapping.yaml:330-343`
  marks `MEASURE.2.8` as `full` while citing an observability contract that
  recommends an audit sink and metrics.
- Coverage count from executable parse:
  - `governance\nist-ai-rmf-mapping.yaml`: 25 `full`, 4 `partial`, 1 `stable`.
  - `governance\iso-42001-mapping.yaml`: 31 `full`, 1 `partial`, 1
    `out_of_scope`, 1 `stable`.
  - `governance\soc2-mapping.yaml`: 8 `full`, 6 `partial`, 1 `stable`.

Distinctive technical surface:

- `C:\dev\governance-commons\agent-matrix\agent-matrix.yaml:673-679` defines
  economic-efficiency routing objective and max task cost.
- `C:\dev\governance-commons\agent-matrix\agent-matrix.yaml:736-864`
  describes token/cost model fields.
- `C:\dev\governance-commons\agent-matrix\agent-matrix.yaml:923` starts
  SKU capability overrides.
- `C:\dev\governance-commons\agent-matrix\agent-matrix.yaml:1649-1692`
  defines approval and MCP tool-connection restrictions.
- `C:\dev\governance-commons\agent-matrix\agent-matrix.yaml:2212-2449`
  defines A2A binding, negotiation, dossier auth references, and response
  verification.
- `C:\dev\governance-commons\agent-matrix\agent-matrix.yaml:3435-3596`
  defines CloudEvents binding, trace context, idempotency, and event-source
  tuple rules.
- `C:\dev\governance-commons\agent-matrix\schemas\sections\cloudevents-binding.schema.json:22-25`
  requires exactly five `event_type_mappings`.
- `C:\dev\governance-commons\agent-dossier\agent-dossier.yaml:115-122`
  defines validity/expiry and crypto identity fields.
- `C:\dev\governance-commons\agent-dossier\agent-dossier.yaml:177-197`
  defines runtime status/expiry checks and revocation model.
- `C:\dev\governance-commons\agent-dossier\agent-dossier.yaml:224-228`
  defines revocation rules.
- `C:\dev\governance-commons\agent-dossier\agent-dossier.yaml:364-401`
  defines receiver signature verification requirements.

## Source Links Used For External Comparison

- NIST AI Agent Standards Initiative:
  `https://www.nist.gov/news-events/news/2026/02/announcing-ai-agent-standards-initiative-interoperable-and-secure`
- NIST Building Evaluation Probes into Agentic AI:
  `https://www.nist.gov/programs-projects/building-evaluation-probes-agentic-ai`
- NIST AI Risk Management Framework:
  `https://www.nist.gov/itl/ai-risk-management-framework`
- OWASP Multi-Agentic System Threat Modeling Guide:
  `https://genai.owasp.org/resource/multi-agentic-system-threat-modeling-guide-v1-0/`
- AAIF:
  `https://aaif.io/`
- AGENTS.md:
  `https://github.com/agentsmd/agents.md`
- Model Context Protocol authorization:
  `https://modelcontextprotocol.io/specification/2026-07-28/basic/authorization`
- A2A Protocol specification:
  `https://a2a-protocol.org/latest/specification/`
- Microsoft Agent Framework tool approval:
  `https://learn.microsoft.com/en-us/agent-framework/agents/tools/tool-approval`
- Microsoft Agent Framework human-in-the-loop workflows:
  `https://learn.microsoft.com/en-us/agent-framework/workflows/human-in-the-loop`
- Microsoft Agent Framework/AutoGen migration:
  `https://learn.microsoft.com/en-us/agent-framework/migration-guide/from-autogen/`
- Microsoft Agent Framework Build 2026 announcement:
  `https://devblogs.microsoft.com/agent-framework/microsoft-agent-framework-at-build-2026-announce/`
- OpenTelemetry GenAI semantic conventions:
  `https://opentelemetry.io/docs/specs/semconv/`
  and
  `https://github.com/open-telemetry/semantic-conventions-genai`
