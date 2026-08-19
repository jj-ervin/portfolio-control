# Provisional Patent Application — Technical Description (Draft)

**Status:** DRAFT — not filed. This is a technical disclosure written to support a USPTO provisional patent application, prepared per the "GEE architecture (authority_basis + time.loc + namespace invariant)" candidate flagged in `docs/reviews/2026-06-29-ip-checklist.md`. Not a substitute for patent counsel review. A provisional application does not require formal claims, but does require a written description detailed enough to support claims filed later in a non-provisional application within 12 months — that is the standard this draft is written to.

**Inventor:** Jesse James Ervin
**Assignee (on later formal filing, once IP assignment is executed):** Osprey Strategic Holdings LLC
**Priority basis:** first public disclosure of the Governed Event Envelope, June 2026 (per the IP checklist's "Provisional | June 2026 | ~June 2027" deadline — confirm exact first-disclosure date before filing, since the 12-month US deadline runs from it)

---

## Title

Method and System for a Governed Event Record Envelope with Mandatory Temporal-Spatial Anchoring, Namespace-Scoped Symbol Resolution, and Actor Authority Classification

## Field of the Invention

This invention relates to structured data record formats for computer systems, specifically to a record envelope for logging, auditing, and governing events performed by autonomous or semi-autonomous software agents, humans, and automated systems, in a manner suitable for regulatory compliance, cross-system interoperability, and tamper-evident audit trails.

## Background

Existing event/log record formats (e.g., generic pub/sub event envelopes) typically specify delivery metadata — an identifier, a source, a type, a timestamp — without imposing any structure on the semantic content of the event itself. This makes such formats poorly suited, without additional layered specification, to emerging regulatory requirements (such as the EU AI Act Article 12's requirement for automatic, tamper-evident logging of AI system behavior) that require a record to affirmatively establish: what happened, where and when it happened, under what authority it was performed, and what result it produced.

Existing provenance record formats (such as W3C PROV-O) address the "who did what" question but are typically expressed in RDF/OWL semantic-web formats that are heavyweight for JSON-native systems and do not mandate a specific temporal-spatial anchor record, a namespace-scoped symbol resolution rule, or a closed enumeration of actor-authority classifications.

No existing widely-adopted format combines, as mandatory (non-optional) fields within a single record: (1) an embedded, complete temporal-spatial anchor record rather than a reference pointer; (2) a namespace declaration that is the sole semantic authority for resolving all other symbols in the record, such that the same symbol may validly carry different meanings under different declared namespaces without collision; and (3) a closed-enumeration actor-authority classification distinguishing autonomous, delegated, mechanical, and direct-human action.

## Summary of the Invention

The invention is a record structure (the "governed event envelope") and associated production/validation methods comprising:

1. **Mandatory embedded temporal-spatial anchor.** Every record embeds a complete, self-contained temporal-spatial record (comprising, in one reference implementation: dual local/UTC timestamps with day-of-week, a geolocation with an explicit provenance classification distinguishing declared/IP-derived/GPS/unavailable location sources, a monotonic sortable sequence identifier, and a tamper-evident cryptographic signature) directly within the governing record, not as a reference or foreign-key pointer to an externally stored record. This guarantees the temporal-spatial anchor travels with the event record across system boundaries, archives, and audit exports, and remains valid even if the originating system that produced the anchor becomes unavailable.

2. **Namespace-scoped symbol resolution as a structural invariant.** Every record carries a mandatory namespace declaration field. All other symbolic fields in the record — including but not limited to the event-type classification, and any state or stage identifiers carried in event-type-specific conditional fields — are defined to have no independent meaning outside the context of the declared namespace. This is enforced as a structural invariant of the format itself (not merely a documentation convention), such that two records using an identical symbol string under two different declared namespaces are not required to, and are not presumed to, share meaning. This prevents symbol collision between independently evolving domain ontologies that consume the same envelope format, without requiring central coordination of a single global symbol registry.

3. **Mandatory closed-enumeration actor authority classification.** Every record carries a mandatory field classifying the authority basis under which the recorded actor performed the event, drawn from a closed enumeration distinguishing at minimum: autonomous action (the actor acted under its own governing policy without per-action human instruction), delegated action (the actor acted under explicit delegation for the specific action or class of action), mechanical action (a deterministic, pre-approved procedure with no judgment applied), and direct human action. Certain event-type profiles within the format additionally require a machine-resolvable pointer to the specific governance policy or authority document under which an autonomous or delegated action was taken, when the authority-basis field indicates autonomous or delegated action.

4. **Event-type profile system with required, optional, and structurally prohibited conditional fields.** The format defines a closed set of event-type classifications (in one reference implementation: state transition, priority decision, pipeline movement, archive/storage lifecycle event, agent action, observation, and handoff/authority-transfer event), each of which declares which additional conditional fields are required, which are optional, and — novel relative to formats that specify only required fields — which conditional fields are structurally prohibited from appearing in a record of that event type. A record containing a conditional field prohibited by its declared event type is defined as invalid, not merely as containing extraneous or ignorable data. This closes an ambiguity present in formats that specify only required-field lists, under which a validator cannot distinguish "optional but present" from "erroneous."

5. **Tamper-evidence computation excluding the validation assertion from its own input.** The record's cryptographic integrity signature is computed over a canonical, deterministically ordered, delimiter-joined serialization of the record's required fields (with the embedded temporal-spatial anchor represented by its own compact canonical serialization to avoid delimiter collision), computed and fixed at record-production time, and is defined to explicitly exclude any subsequently appended validation-result annotation. This avoids the circular dependency that would result if a record's integrity signature covered a validation assertion about that same record, since the validation assertion is necessarily computed after — and would otherwise depend on — the integrity computation it is asserting passed.

## Novel Aspects Believed Patentable

- The combination of (1)-(3) above as *mandatory, structurally enforced* fields within a single event-record envelope, rather than as optional metadata, convention, or a separately maintained provenance layer.
- The namespace-as-sole-semantic-authority invariant (item 2) as a mechanism for preventing symbol collision across independently evolving domain ontologies sharing one envelope format, without a global registry.
- The required/optional/prohibited three-way conditional-field classification per event-type profile (item 4), as distinct from binary required/optional schemes.
- The integrity-computation-excludes-validation-assertion ordering constraint (item 5) as a specific solution to the circular-dependency problem in self-validating tamper-evident records.

## Reference Implementation

A working reference implementation exists in Python, comprising a record producer, a structural validator, and (for one domain ontology built on the envelope) a namespace-specific transition-validity validator, published under an open-source license at `github.com/governancecommons/governed-event` and `github.com/governancecommons/time-loc`. Governing specification documents: PASS 0051.00, 0051.01 (envelope), 0052.00, 0052.01 (one domain ontology built on the envelope), and PASS 0050.02 (temporal-spatial anchor primitive).

## Notes for Filing

- A provisional application needs no formal claims, but claims should be drafted (with counsel, or via the Pro Bono Program) before the 12-month non-provisional deadline to actually capture the scope described above — don't let the provisional lapse into nothing.
- Confirm the actual first-public-disclosure date (git history / first commit date, or any earlier informal disclosure) before filing — the "~June 2027" deadline in the IP checklist is an estimate from "June 2026," not a confirmed date.
- The Apache 2.0 release already made public does not itself bar patenting (the US has a 12-month grace period from inventor's own disclosure), but filing later than 12 months after first disclosure forfeits US rights and may already have forfeited rights in grace-period-free jurisdictions (most of the rest of the world) — this is time-sensitive if pursued at all.
