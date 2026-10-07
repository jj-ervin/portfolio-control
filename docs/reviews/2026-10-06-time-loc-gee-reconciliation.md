# time.loc and Governed Event Envelope reconciliation

Evidence date:2026-10-06. Reconciliation complete. Both projects are implemented, tested and publicly available; documentation, packaging coexistence and standards-alignment claims needed separation. Six documentation files changed; runtime, specs, schema contracts, versions, workflows and historical release decisions remain unchanged.

## Canonical state

| Project | Source and remote | Public artifact | Classification |
| --- | --- | --- | --- |
| C:/dev/time-loc → governancecommons/time-loc | clean main07d91a4c initially matches GitHub;51 tests | PyPI1.2.0 | CANONICAL time.loc1.2 format; IMPLEMENTED source/package; PARTIAL coexistence/schema distribution/standards mapping |
| C:/dev/governed-event → governancecommons/governed-event | clean mainb8d9a232 initially matches GitHub;66 tests | PyPI0.1.0 and GitHubv0.1.0 | CANONICAL GEE/API-E0.1 formats; IMPLEMENTED source/package; STALE unpublished docs corrected; PARTIAL coexistence/schema distribution/standards mapping |

Each has one remote main branch and no open PR. Source/test/package/CI evidence supports implementation, not automatic standards conformance. time.loc supplies temporal-spatial provenance records; GEE supplies the event envelope and API-E workflow ontology. These primitives can support downstream systems; they do not replace Signal Radar's evidence-first intelligence or EdgeLab's market-edge research/validation responsibilities.

Private DEV-PLAN/DEV-RELEASE files exist locally and are ignored by public remotes. DEV-PATH files do not exist; existing plans record spec authority in eco PASS clusters0050/0051/0052. No new phase history or authority contract was invented. Public-safe AGENTS stubs were checked and left intact; the owner-directed task and available local private plans supplied operating context.

## Source, package and CI proofs

- Exact-HEAD isolated exports install with declared dev extras. time.loc passes51 tests; GEE passes66. Both wheel and source-distribution builds succeed. Local proof uses this host's Python3.14; it does not rerun the full remote OS/Python matrix.
- Fresh independent public environments install time-loc1.2.0 and GEE0.1.0. Isolated-mode imports resolve installed modules without source path injection. Codec/validator smoke passes. A signed GEE API-E transition validates, and changing its subject fails HMAC verification.
- Downloaded wheel SHA256 values match current PyPI file metadata. Every flat Python payload module matches the current source after line-ending normalization. This is payload parity, not artifact signature or independent OIDC attestation verification.
- JSON schemas exist in source but neither published wheel bundles them. README now links pinned commit resources and describes the package/source distinction. Machine-readable schema packaging and interoperability remain queued work; no schema definition changed.
- Current-head test workflows are green for both. time.loc's successful publication run32610748541 used35c6ac78, followed by main07d91a4c test run32610880583; no GitHub release is returned for time.loc. GEE's successful publish run35062746188 usesb8d9a232 and corresponds to GitHubv0.1.0. The tracked test matrix is Ubuntu/Windows/macOS with Python3.10/3.12; green run records are distinct from local proofs.
- Publish workflows declare pypi deployment environment and id-token permission. Existing successful publication confirms historical functionality. Future owner-side publisher settings, dependency resolution and admission gates should be checked before another authorized release. No release workflow was dispatched.

[PyPI time-loc1.2.0](https://pypi.org/project/time-loc/1.2.0/) and [PyPI governed-event0.1.0](https://pypi.org/project/governed-event/0.1.0/) corroborate current public availability. Registry JSON, artifact digests, build/test/install logs and module-origin smoke results are saved alongside this report.

PyPI UTC uploads: time.loc2026-08-23T01:36:20Z and GEE2026-09-16T06:13:49Z. These correspond to local Pacific dates August22 and September15. The source release records use local dates; this calendar difference is not contradictory publication evidence.

## Confirmed shared-module ownership defect

GEE intentionally vendors time_loc.py and time_loc_compact.py as flat top-level modules. time-loc distributes the same module names. Current producers are byte-identical; compact-codec source differs only in a documentation import example. No dependency refactor was made.

A disposable environment installs both public versions and imports successfully. Uninstalling governed-event then removes the shared module files: importing time_loc fails with ModuleNotFoundError, while pip metadata still reports time-loc1.2.0 installed. This is a concrete package ownership defect, not a speculative compatibility concern. It is recorded in paired-package-ownership-proof.json. Only the disposable environment was uninstalled; no user's installed package was changed.

The current documentation advises separate environments and explains GEE's standalone vendoring. A future fix needs an explicit ownership/compatibility decision: dependency-based reuse, namespaced vendoring or another reviewed package contract. Do not silently change this design while performing reconciliation or republish modified code at an existing version.

## Integrity and compact-codec boundaries

Structural validation and keyed authenticity are different. time.loc's validator checks format/fields/signature shape; it takes no verification key. GEE exposes separate keyed HMAC verification, which the public smoke proof exercises. Unsigned records explicitly lack authentication, and declared geolocation is an attributed claim rather than independently proved presence.

Compact decoding returns fields0-9; it does not reconstruct the full14-field record, signature or v1.2 GPS coordinates. The original README already mentioned0-9, but this limitation now appears beside the package/integrity guidance. These are clarified existing behaviors, not a spec or codec change.

## Corrected standards and regulatory context

The old blanket claim that high-risk Article12 application began August2,2026 is stale. The [European Commission FAQ](https://digital-strategy.ec.europa.eu/en/faqs/navigating-ai-act) records the Digital Omnibus effective July27,2026 and high-risk application dates December2,2027 and August2,2028 for product-embedded AI. This report updates timeline context only; it does not determine any particular adopter's legal classification.

[ISO's official record](https://www.iso.org/standard/88723.html) lists ISO/IEC FDIS24970 under development at50.20, dated August28,2026. Its50.60 lifecycle label is undated; it cannot prove the previously reported backward stage movement. [NEN's current listing](https://www.nen.nl/nen-en-18229-1-2026-ontw-en-352717) identifies the2026 logging document as a draft. Catalog/preview material exists, so 'no draft text exists' is not a sound reason to avoid preparation.

No paid complete standard was acquired, normative field-level mapping performed, final standards certification established, or conformance claim authorized. Intended alignment remains a queued objective. The above is a dated primary-source snapshot; no scheduled monitor was created.

The earlier Q1-Q12 review and queued privacy, interoperability, property tests and adoption work remain preserved. Owner-side IP/registration/patent/trademark follow-ups remain non-blocking as previously decided. This audit neither closes those actions nor renews old legal assessments or inferred filing deadlines.

## Documentation reconciliation

Six files: README, DEV-PLAN and DEV-RELEASE in each project. GEE's README now uses its verified public installation and removes the source sys.path example. Plans now distinguish released availability from follow-up work. time.loc's stalev1.3 public-availability heading now identifies actual publishedv1.2; no new release target was invented. GEE's completed README deliverable is checked, while existing non-blocking owner follow-ups remain open. Standards/timeline corrections are dated and historical strategy text is retained.

Two tracked READMEs are dirty; four changed planning/release files remain ignored/private. Public bootstrap stubs are unchanged. Source wheels were built before the documentation updates; their runtime payload remains current, but they are audit proofs, not newly approved release artifacts. All changes and exact pre-edit files are preserved in the evidence bundle.

## Recommended recovery order

1. **DRIVE: package ownership repair.** Select a compatibility contract for coinstallation/uninstall, define a new versioned release gate, and prove both install orders plus uninstall behavior before publication. Requires the explicit design decision; existing intentional vendoring is preserved here.
2. **RUN: schema discoverability/distribution.** Decide stable URLs versus wheel data, then verify clean language-neutral consumers. Source schemas already exist; this is packaging/discovery work, not a new schema invention.
3. **DRIVE: requirements mapping.** Review available/finalized standards and produce a field-level gap map before adopting standards-conformance positioning. Status monitoring alone is not mapping proof.
4. **RUN: temporal/geo follow-ups.** Retain time.loc privacy/trust guidance, RFC3339/GeoJSON/EXIF mapping and compact-codec property tests from the earlier review; do not infer their completion from successful packaging.
5. **Next portfolio reconciliation: eco-vscode/editor integration**, followed by the remaining active application/standards repos according to the canonical inventory. Verify actual editor/package adoption after the repaired Cockpit and portable .eco boundaries.

Reconciliation is complete. Product package ownership and standards-mapping work remain open, with evidence precise enough to prepare the next scoped implementation task. No old brainstorm was promoted to implemented behavior.

## Governance closeout

All nine portfolio Level1 validators pass. Level4 retains existing CXP4, canonicalGC5 and preserved duplicateGC10 unchecked gates. Final PLAY validation accepts 27 records with zero errors/warnings. Task complete; package ownership and standards/adoption follow-ups remain open. Timing unmeasured (null timestamps/zero schema durations). Next reconciliation: eco-vscode/editor integration.
