# Sealdex / Cairn reconciliation — 2026-10-06

Sealdex is the current product and GitHub identity; `C:/dev/cairn` is its retained local folder name. The registry/CLI and compiled Cockpit provider are implemented and released at0.2.1. Documentation lagged at0.2.0 and old Cairn labels. Four documentation files now record verified current evidence; the existing AGENTS onboarding edit is byte-identical to its pre-audit contents. No implementation, schema, hook, commit, push or release was changed.

## Local, remote and naming

Initially the sole local change was AGENTS.md. Local and private [jj-ervin/sealdex](https://github.com/jj-ervin/sealdex) main match at `984f1ef18297934dd450d3c9e0ee2cf80da9683c`. There is one remote branch, no open issue or PR, no Actions runs and no application workflow. v0.2.1 points to `28771da4a8cf00a4c9461d16b17e2a1d1d409141`; main's only subsequent commit adds the brand asset kit. Cairn v0.1.0–0.1.5 releases remain historical artifacts on the renamed repository. No folder/repository rename or history cleanup was attempted.

The separate empty `jj-ervin/cairn-registry` inventory entry remains a placeholder rather than evidence of a second current implementation. The old local name, old release line and Sealdex current identity must not be counted as three active applications.

## Published bytes and registry

GitHub v0.2.1 contains `sealdex-0.2.1.zip`, 9,563,669bytes. A read-only download independently hashes to `743546bd5cb6a07e801c8c94db408b70e068f2785be9e6dbd1ef58632ec46efa`, matching GitHub's asset digest, package declaration and hosted registry manifest. The real ZIP passes CRC checks, contains the provider executable, provider/build manifests, CLI and schema migrations, and has no traversal archive paths.

Every packaged CLI/schema/provider-manifest/shim file matches the local tracked checkout byte-for-byte and Git main after CRLF-to-LF normalization. The raw Git archive uses LF while the published Windows checkout uses CRLF; this explains the initial raw-byte mismatch. The independent real release verifier passes against a disposable baseline checkout with the original README, checking executable digest, source fingerprints, Cockpit schema, and local Marlin manifest/index version/checksum consistency. The newly edited README intentionally differs from the published ZIP, so verification against today’s modified working tree rejects that documentation mismatch; a future release must be rebuilt. Hosted registry was separately read through GitHub: `index.yaml` selects `manifests/sealdex/0.2.1.yaml`, whose version/checksum match. This is current artifact/registry evidence; no Marlin installation was performed, and persistent PATH was not modified.

GitHub v0.2.0 additionally contains `Sealdex-Install-0.2.0.exe` (302,176,891bytes; declared asset digest `e174ab806fab5e3f22c951901d8b7ead42b542fa3c5dd9f883bdc18d5b5d629f`). v0.2.1 publishes the ZIP only. That older installer was not downloaded, executed or certified as a0.2.1 path. A provider executable is not an app installer. Technical package proof and normal-user one-click adoption proof remain independent. Private repository access, the CLI/Python setup, supported platform/architecture matrix and current installer provenance need explicit release evidence before claims of public readiness.

## Current implementation and trust boundary

Source implements metadata entities/assets/releases/accounts/deployments, secret references, referential constraints, audit triggers, three existing migrations, backup/restore, insert-only data entry, optional LLM-assisted schema/query helpers and Cockpit Plan/Entry provider commands. Tests use isolated synthetic registries and stubbed LLM calls; no current live LLM behavior is established here. The main CLI is standard-library Python; release build/verifier tooling has separate dependencies.

SQLite holds metadata and vault references. KeePassXC/the external vault remains secret authority. No live `assets.db`, production contents, vault file, credential value or credential environment value was read or modified by this audit. The repository's ignored local database and dist artifacts were preserved. The vault fixture test module was not imported or executed because it creates a vault and handles secret values. No live provider/LLM network call or new git hook was installed.

Vault mediation and runtime secret injection remain designed/deferred. Do not infer implementation from their queued ideas. The historical standalone-expansion pause remains: future Cockpit work must be additive and separately scoped. Governance Commons and provider host approvals retain their existing authority.

## Fresh compiled-provider and test evidence

The actual published provider executable was extracted into a work directory and invoked once with `sealdex.entry.tables`, against a fresh synthetic SEALDEX_DATA_DIR. It returned succeeded and exposed the expected writable-table metadata. The existing bundled migrations initialize the fresh metadata database; there are no production rows or vault operations. This directly addresses the historical frozen-provider missing-migrations failure for the published0.2.1 artifact.

Important semantic limit: even a nominally non-mutating table-list request calls existing `ensure_schema()` on first use. It can create/migrate the metadata database before returning. README now makes that behavior explicit. Host confirmation semantics and first-run initialization policy deserve a separate review; this audit did not silently redesign migration approval or provider classifications.

The selected suite runs148 tests:145 pass and3 opt-in real-build tests are skipped. The vault fixture module is excluded entirely. Initially13 packaging tests errored because the isolated source copy lacked its sibling Cockpit schema; supplying an exact copy of that read-only schema fixes the fixture. This was an audit layout error, not a product failure. Packaging tests stub compilation, so they do not prove a fresh compile; the separate smoke executes the already-published real binary. No macOS/Linux machine, declared architecture matrix, current installer UI, human installation or full Cockpit host adoption was tested.

## Classification and next work

| Class | Evidence |
| --- | --- |
| CANONICAL | Sealdex source/release identity, retained Cairn folder, root planning and vault boundary |
| IMPLEMENTED | Metadata registry/CLI/audit/backup/operator entry, optional agent prototypes, provider and0.2.1 published/registered package |
| PARTIAL | Application CI, release automation, current installer/adoption proof, target platform/architecture validation, live LLM and approval/bootstrap review |
| STALE | 0.2.0 capability snapshot and old current-position Cairn label; dated current appendices and README now clarify |
| SUPERSEDED | Cairn branding/version line for current product; old releases preserved as historical |
| CHAT-ONLY | No additional Classic-only shipped feature established; mediation/injection remain designs/deferred |

Recovery order: (1) define the supported package/installer matrix and separate technical/human adoption records; (2) add non-vault CI and cross-repository release-verifier fixtures; (3) review first-run schema initialization/approval semantics and retain metadata/vault isolation; (4) continue additive Cockpit integration only after its product proof gates. No standalone feature expansion is inferred from this reconciliation.

The canonical inventory remains74 entries. Next portfolio reconciliation: the remaining governance/runtime projects, beginning with Arche if its active local/remote evidence confirms that scope.

## Governance closeout

Nine Level1 checks pass; existing Level4 CXP4/canonicalGC5/duplicateGC10 gates remain. PLAY accepts 32 records with zero errors/warnings. Reconciliation is complete; release readiness is not claimed.
