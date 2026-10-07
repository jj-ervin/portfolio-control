# eco-edge reconciliation — 2026-10-06

The important gap is now verified: public `eco-edge`0.1.1 installs but cannot import its core modules. The existing local 0.1.2 packaging correction works in a separate clean environment, but it has not been published. The separate eco-edge repository remains a governance-proof planning workspace, not the source of that physical-library distribution.

## Identities and local/GitHub state

| Root / identity | Current state | Classification |
| --- | --- | --- |
| C:/dev/eco-edge → jj-ervin/eco-edge | Clean initial main 2dabeece matches remote; one branch; no Actions runs, PRs, releases, tags, runtime or tests. | CANONICAL proof plan / PARTIAL unimplemented proof chain. |
| C:/dev/eco/packages/eco-edge | Actual package source 0.1.2 inside eco main f29c0963; existing packaging fix. | IMPLEMENTED local library/candidate; public artifact broken. |
| C:/dev/eco-edge/remote | Separate empty Git root; unborn master, no origin, no files/commits/work. | LOCAL-ONLY empty repository, not recovered implementation. |
| C:/dev/eco-edge-dgx | Empty directory; Git root resolves to parent C:/dev, not itself. | Local placeholder, not checkout. |
| jj-ervin/eco-edge-dgx | Existing private remote, no branches or code. | Remote-only empty placeholder; no DGX runtime. |

The nested empty root was absent from the original checkout inventory and is now explicitly included. No directories, branches or repos were renamed/deleted/created by this reconciliation.

## Public packages and exact proof

Fresh primary registry metadata: [eco-edge 0.1.1](https://pypi.org/project/eco-edge/0.1.1/), [GC Python 0.2.0](https://pypi.org/project/governance-commons/0.2.0/), and [GC npm metadata](https://registry.npmjs.org/governance-commons) latest 0.1.1. GC's v 1.2.0 specification/release-train label is a different version surface from these SDK distribution versions.

Two disposable environments were used. Public eco-edge 0.1.1 installed successfully, then all six smoke imports failed with an initializer import of omitted `eco.api`/monorepo modules. Local 0.1.2 was built from eco's package definition, installed into a different venv and passed all six kernel/HAL/telemetry/anomaly/cloud imports. The rebuilt wheel's Python files match current monorepo source; only its README metadata was normalized. No package metadata version, runtime or API was changed.

Three unchanged Python quickstart blocks passed: first simulated CAPS run (temperature 22.4, humidity 58.1), anomaly-detector construction, signing configuration. MQTT connection to localhost was unavailable and telemetry queued, as designed. These are bounded simulated/configuration proofs; they do not demonstrate broker delivery, cryptographic verification of exported evidence or physical device execution. Four other blocks remain separate setup: continuous heartbeat loop, real I2C hardware, cloud receiver/live broker and TLS credentials/live broker. No Raspberry Pi, tractor, aircraft, submarine or DGX deployment was attempted.

No CAPS pack ships in the candidate wheel. The old package README incorrectly used stdlib-only language, claimed bundled CAPS packs, and showed drifted API examples. It now describes actual python-ulid/NumPy core dependencies, references the checked source quickstart and distinguishes packaging/record checks from certification and the complete governance proof chain. The quickstart no longer presents its local 0.1.2 validation as a public pip install or a current timed five-minute Pi proof; its install instructions select the local candidate.

## Upstream and release discrepancies

The old universal “GC packages unpublished, all work blocked on account setup” claim is stale. Public Python/npm artifacts exist, but at different versions and without established parity with current SDK source. GC's current release admission still has its real validation/website/version-label gates. Availability does not establish compatible CloudEvents/OTel/PASS/signed-evidence contracts.

The cached public GC Python 0.2.0 wheel was digest-matched to fresh registry metadata. Its file list has no CloudEvents/observability/compliance/conformance-named payloads. This limited archive observation is not a full semantic audit or proof that every possible binding is absent; it means the required packaged proof dependencies cannot be assumed from “GC is published.” Pin and verify the exact contracts/artifacts before declaring the edge path unblocked.

The declared chain remains **unimplemented here**: device event → eco governance → GC CloudEvent → gc.agent OTel span → persisted PASS → signed GC evidence → conformance report. Eco service hash chains/HMAC or record-field checks are not a substitute for that chain, JWS/Ed25519 bundle compatibility, or third-party standards conformance.

SPARK.00 acceptance is already recorded in eco and checked in the eco-edge release history. It does not mean the DGX adapter/profile/hardware proof exists. DGX remains deferred behind the base proof path; no older feature brainstorm was implemented.

Naming/ownership also needs an explicit decision: the physical library already owns the PyPI `eco-edge` distribution name. Describing a “different future proof artifact” with the identical name does not create a second independently installable package. No replacement name, fork or release was invented.

## Changes and preservation

Five files in eco-edge: README current status, dated DEV-PLAN correction, append-only DEV-PATH/DEV-RELEASE receipts, and AGENTS bootstrap matching the existing CLAUDE adapter. Four eco docs: package README, source quickstart, and append-only DEV-PLAN/DEV-PATH receipts. Eco's previous seven reconciliation edits are preserved; the two new standalone doc edits bring that checkout to nine dirty documentation paths.

Runtime/tests/packaging metadata stayed unchanged. Protected histories and original release checkboxes are byte-prefix preserved; no release gate was marked complete. Backup CRC, Git whitespace, scoped Markdown lint, source-to-wheel parity and exact tested quickstart block parity pass. No commit/push, tag, upload, deployment, device action or remote changes occurred.

## Recommended order

1. Review the existing corrected 0.1.2 packaging candidate and authorize publication as a separate release task, after checking version availability, release engineering/provenance and public install verification. This audit did not publish it or reuse an old publication approval.
2. Resolve artifact ownership/name and pin compatible GC specification/SDK/schema/validator payloads. Replace the blanket account blocker with those concrete compatibility/admission gaps.
3. Execute one bounded simulated governance event under the existing EDGE-PROOF scope; keep contracts, PASS authority and evidence signing explicit.
4. Prove real clean-Pi/MQTT/device behavior separately, then conformance tooling and DGX/hardware variants according to their prerequisites.
5. Continue the portfolio reconciliation with the portable .eco/DevXToolkit roots, then the remaining active projects. Keep speculative agent/HAL/hosted work separate from current implementation.

Source, local artifact, public artifact, end-to-end governance and real hardware proof are separate evidence levels. This reconciliation establishes the first two and reproduces the public artifact gap; the later levels remain open.

## Governance closeout

All nine Level1 validators pass. Full Level4 retains existing CXP4/canonicalGC5/preserved duplicateGC10 release blockers. Final PLAY validation accepts 25 records with zero errors/warnings. Source/evidence reconciliation complete; public package parity, release admission, GC binding and hardware readiness remain open. Timing is unmeasured (null timestamps/zero schema durations). Next portfolio task: portable .eco and DevXToolkit reconciliation.
