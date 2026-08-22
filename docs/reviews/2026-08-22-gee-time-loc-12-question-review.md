# GEE + time.loc 12-Question Release Review - 2026-08-22

**Scope:** `time-loc` v1.2.0 / release track v1.3.0 public availability, and `governed-event` v0.1.0 (GEE v0.1 + API-E v0.1).

**Framework:** `docs/gap-analysis-framework.md` v1.1, including the Stranger Test and Q1-Q12.

**Review purpose:** decide whether the paired release is ready to proceed to PyPI trusted-publisher setup and public package publication.

**Verdict:** GO for PyPI trusted-publisher setup and staged publication, with release-complete status blocked until public install verification passes.

---

## Evidence Reviewed

- `time-loc/DEV-RELEASE.md`
- `governed-event/DEV-RELEASE.md`
- `docs/reviews/2026-06-29-ip-checklist.md`
- `time-loc/pyproject.toml`
- `governed-event/pyproject.toml`
- `time-loc/.github/workflows/test.yml`
- `time-loc/.github/workflows/publish.yml`
- `governed-event/.github/workflows/test.yml`
- `governed-event/.github/workflows/publish.yml`
- Current tests run 2026-08-22:
  - `time-loc`: `51 passed`, with pytest cache permission warning
  - `governed-event`: `66 passed`, with pytest cache permission warning
- Current commits reviewed:
  - `time-loc`: `35c6ac7 Prepare PyPI trusted publishing`
  - `governed-event`: `b8d9a23 Prepare PyPI trusted publishing`

External status checked 2026-08-22:

- Interoperable Europe Portal says `prEN 18229-1 - AI trustworthiness framework - Part 1: Logging` is in Enquiry phase, not final.
- ISO lists `ISO/IEC FDIS 24970 Artificial intelligence - AI system logging` at FDIS stage 50.00, still in development.

---

## Stranger Test

**Question:** Can a stranger install this, run it, produce evidence, verify that evidence, and trust the release artifact?

**Current answer:** Not yet from PyPI. Locally, yes for built wheels; publicly, no until publication.

**Status:** partially satisfied.

**Evidence:**

- Local wheel builds and fresh-venv wheel smoke installs passed before this review.
- PyPI trusted-publisher workflows exist in both repos.
- Public install commands still cannot be truthfully documented as final until the packages are published and `pip install time-loc` / `pip install governed-event` pass from clean environments.

**Release implication:** PyPI publication may proceed, but release-complete cannot be claimed until public install verification is recorded.

---

## Q1 - Regulatory Compliance

**Finding:** no direct regulatory blocker.

GEE is a record format, not itself an AI system. The IP checklist already records GEE as not in direct EU AI Act scope. Its regulatory relevance is as a candidate logging/evidence format for systems that may need Article 12-style logging.

**Gap:** standards/regulatory positioning must remain careful. Do not claim compliance with EU AI Act harmonized logging standards or ISO/IEC 24970 yet.

**Status:** spec-complete for internal record format; external compliance claim remains open.

**Action:** publish as a compliance-adjacent logging primitive, not as a certified compliance standard.

---

## Q2 - Standards Compliance

**Finding:** useful alignment exists, but standards conformance is not yet proven.

time.loc provides timestamp, geolocation provenance, sequence, and HMAC integrity. GEE provides event envelope fields, authority basis, namespace/version fields, event types, validation, and integrity. These map naturally toward AI system logging needs.

**Gaps:**

- No field-by-field mapping against `prEN 18229-1`.
- No field-by-field mapping against `ISO/IEC FDIS 24970`.
- No SBOM, SLSA provenance level, or release attestation review beyond PyPI trusted publishing.

**Status:** spec-complete internally; release-complete pending PyPI; standards-conformance gap open.

**Action:** after PyPI publication, create a standards mapping note for `prEN 18229-1` and ISO/IEC 24970 before any conformance claim.

---

## Q3 - Industry Standard / De Facto

**Finding:** GEE resembles a governed event envelope, but does not yet interoperate with de facto event ecosystems.

**Gaps:**

- No CloudEvents binding.
- No OpenTelemetry semantic convention mapping.
- No EventBridge/Kafka/Pub/Sub example.
- No OIDC/JWT actor identity binding.

**Status:** open.

**Action:** do not block PyPI release. Queue a post-release interoperability slice: CloudEvents projection plus OpenTelemetry attributes.

---

## Q4 - Industry Best Practice

**Finding:** good release hygiene exists for a small primitive package: tests, CI, package metadata, trusted-publisher workflow, explicit release docs, and IP decisions.

**Gaps:**

- No signed release manifest or SBOM.
- No changelog/release-note artifact yet.
- No explicit artifact hash record in release docs.

**Status:** partially release-complete.

**Action:** PyPI publication can proceed; record final PyPI artifacts, hashes, GitHub Actions run IDs, and release URLs after publish.

---

## Q5 - Security Posture

**Finding:** the core primitives include HMAC integrity behavior and tests that assert exact HMAC/canonical-string behavior. That is strong for the current scope.

**Gaps:**

- No threat model for replay, key handling, signing-key lifecycle, or misuse of unsigned records.
- No supply-chain SBOM/provenance package beyond trusted publishing.
- No key-management guidance for adopters.

**Status:** implementation tested; security posture review open.

**Action:** do not block PyPI release. Add post-release security notes for signing-key handling, unsigned records, replay risk, and recommended verifier behavior.

---

## Q6 - Operational Maturity

**Finding:** operational needs are light because these are libraries/spec primitives, not services.

**Gaps:**

- No public release runbook.
- No maintainer incident process for bad package publish, yanked release, or validator defect.
- Pytest cache permission warnings exist locally in both repos.

**Status:** open but non-blocking for first package release.

**Action:** create a short release/yank/runbook after first successful publish. Treat local pytest cache ACL warnings as separate filesystem hygiene, not a release blocker.

---

## Q7 - Developer Experience / Adoption Friction

**Finding:** this is the primary release blocker.

The current install path is not yet stranger-proof:

- `time-loc` README still uses git install.
- `governed-event` README still tells users to install dependencies manually / run from repo.
- PyPI packages are not yet published.

**Status:** open until PyPI install works.

**Action:** publish `time-loc` first, verify `pip install time-loc`; then publish `governed-event`, verify `pip install governed-event`; then update READMEs.

---

## Q8 - Ecosystem Interoperability

**Finding:** internal dependency relationship is clear: GEE embeds time.loc, and GEE currently vendors `time_loc.py` / `time_loc_compact.py` for standalone v0.1.0 use.

**Gaps:**

- No external framework examples.
- No integration fixtures for CloudEvents, OpenTelemetry, LangChain/AutoGen/CrewAI, GitHub Actions artifacts, or observability backends.
- No downstream compatibility run against eco/API-E/ARCHE/Governance Commons consumers in this review.

**Status:** open.

**Action:** do not block first PyPI release. Record vendoring as intentional for GEE v0.1.0; revisit dependency-on-`time-loc` in the next release.

---

## Q9 - Organizational / Process Maturity

**Finding:** internal governance is strong; external project governance is still thin.

**Gaps:**

- No public security disclosure policy in these repos.
- No CONTRIBUTING or maintainer policy reviewed in this pass.
- No conformance/certification process for claims like "GEE-compatible" or "time.loc-valid".

**Status:** open.

**Action:** non-blocking for first release. Add public `SECURITY.md` and contribution policy before inviting external dependency.

---

## Q10 - Documentation / Discoverability

**Finding:** README/specs exist and explain the primitives, but install instructions are intentionally not final until PyPI publication.

**Gaps:**

- README install sections need post-PyPI updates.
- No quickstart that proves produce -> validate -> integrity check from a clean installed package.
- No "which primitive do I need?" guide explaining time.loc vs GEE vs API-E.

**Status:** partially complete; release docs intentionally block final README install updates until public PyPI verification.

**Action:** update README only after public install passes. Add one minimal installed-package quickstart per repo.

---

## Q11 - Testing Strategy

**Finding:** current tests are good for first release.

Evidence:

- `time-loc`: producer, validator, compact encoder/decoder, canonical examples, exact HMAC behavior, invalid examples.
- `governed-event`: producer, structural validator, API-E transition validator, canonical examples, event profile requirements, exact integrity behavior.

**Gaps:**

- No property-based/fuzz testing.
- No cross-version compatibility tests.
- No packaged conformance suite.
- No post-install example execution test in CI.

**Status:** runtime-complete for current module-level invariants; broader conformance testing open.

**Action:** do not block first release. Add post-install smoke test and conformance fixture package in a later slice.

---

## Q12 - Ahead of the Curve

**Finding:** the category-defining opportunity is strong: tamper-evident, authority-aware event records with a temporal-spatial anchor, positioned before AI logging standards fully settle.

**Gap:** this advantage is time-boxed. As `prEN 18229-1` and ISO/IEC 24970 finalize, GEE should reposition from "standalone governed event format" to "implementation/profile/mapping of the relevant logging standard" where the field mapping supports it.

**Status:** opportunity open.

**Action:** publish now as a primitive, then run a standards-alignment review once final standard text is available or accessible.

---

## Release Admission Summary

### Blockers Before Public Release Completion

- PyPI trusted-publisher project configuration for `time-loc`.
- First `time-loc` publish.
- Clean public install verification for `time-loc`.
- PyPI trusted-publisher project configuration for `governed-event`.
- First `governed-event` publish.
- Clean public install verification for `governed-event`.
- README install updates after public install verification.
- Final release record with PyPI URLs, GitHub Actions run IDs, versions, and verification commands.

### Explicit Non-Blockers

- Broader portfolio copyright sweep.
- GEE copyright registration, target within 3 months of first public release.
- GEE provisional patent filing, target within 12 months of first public enabling disclosure/release.
- Trademark review/filings.
- CloudEvents/OpenTelemetry bindings.
- SBOM/SLSA hardening.
- Public security/contribution policy.
- Standards conformance mapping.

---

## Decision

Proceed with the paired release sequence:

1. Configure PyPI trusted publishing for `time-loc`.
2. Publish `time-loc`.
3. Verify public `pip install time-loc` from a clean environment.
4. Update `time-loc` README/release records.
5. Configure PyPI trusted publishing for `governed-event`.
6. Publish `governed-event`.
7. Verify public `pip install governed-event` from a clean environment.
8. Update GEE README/release records.

Do not claim release-complete until the public install verification steps pass.
