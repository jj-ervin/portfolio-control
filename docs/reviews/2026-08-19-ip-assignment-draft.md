# IP Assignment (Draft) — Individual to Osprey Strategic Holdings LLC

**Status:** DRAFT — not executed. Prepared as a starting point per the "attorney template or Docracy boilerplate" note in `docs/reviews/2026-06-29-ip-checklist.md`. This is not legal advice. Have this reviewed by an attorney (or the USPTO Patent Pro Bono Program, already referenced in the IP checklist) before signing, especially the scope and governing-law sections.

**Scope of this draft:** covers pre-existing IP in the Governed Event Envelope (GEE) and time.loc specifications and their reference implementations. The IP checklist's action item is broader ("IP assignment document (personal → Osprey LLC)") — this draft can be widened to cover the full portfolio, or you can execute narrower per-project assignments like this one and repeat the pattern. Recommend widening to the full portfolio in one document rather than one per repo, to avoid gaps for anything not explicitly listed.

---

## Assignment of Intellectual Property

**Effective Date:** _______________ (fill in on execution)

**Assignor:** _______________________________ ("Assignor"), an individual, of _______________________________ (address)

**Assignee:** Osprey Strategic Holdings LLC, a Wyoming limited liability company ("Assignee" or "the Company")

### 1. Background

Assignor has created certain original works, inventions, and technical specifications, including but not limited to:

- The Governed Event Envelope (GEE) specification, versions 0.1 and any prior drafts, and its Python reference implementation (`governancecommons/governed-event`)
- The API-E Workflow Provenance Ontology specification, version 0.1, and any prior drafts
- The time.loc canonical temporal-spatial primitive specification, versions 1.1 and 1.2, and its Python reference implementation (`governancecommons/time-loc`)
- Associated documentation, schemas, examples, and test suites in the above repositories

(collectively, the "Works"), and Assignor wishes to assign all right, title, and interest in the Works to the Company.

### 2. Assignment

Assignor hereby irrevocably assigns, transfers, and conveys to Assignee, its successors and assigns, Assignor's entire right, title, and interest, throughout the world, in and to the Works, including without limitation:

a. All copyrights and copyright applications, and all renewals and extensions thereof;
b. All rights to file patent applications (provisional or non-provisional) on any inventions embodied in the Works, and all resulting patents;
c. All trade secret rights;
d. All rights to any trademarks associated with the Works to the extent Assignor holds any such rights individually; and
e. All causes of action, past, present, and future, for infringement of the foregoing, with the right to sue for and collect damages.

### 3. Moral Rights

To the extent permitted by applicable law, Assignor waives and agrees never to assert any moral rights Assignor may have in the Works, whether under any law, against Assignee, its licensees, or successors.

### 4. Further Assurances

Assignor agrees to execute any further documents and take any further actions reasonably requested by Assignee to perfect, register, or enforce Assignee's rights under this Assignment, at Assignee's expense.

### 5. Pre-Existing Open Source License

The parties acknowledge that the Works are, or are intended to be, distributed under the Apache License, Version 2.0. This Assignment transfers ownership of the underlying IP to Assignee; it does not revoke or alter any Apache 2.0 license already granted to third parties under a public release, and Assignee may continue to license the Works under Apache 2.0 or any other terms Assignee chooses going forward.

### 6. Governing Law

This Assignment is governed by the laws of the State of Wyoming, without regard to conflict-of-law principles. *(Confirm with counsel — may want to match wherever Assignor is domiciled instead, or Delaware if the Company's operating agreement specifies it.)*

### 7. Signatures

Assignor:

Signature: _______________________________
Printed name: _______________________________
Date: _______________________________

Assignee — Osprey Strategic Holdings LLC:

Signature: _______________________________
Printed name / title: _______________________________
Date: _______________________________

---

## Notes for the signer

- This draft assumes Assignor is the sole author of the listed Works. If any co-authoring agent output, contractor, or collaborator contributed copyrightable expression, that needs its own assignment or a work-for-hire agreement — this document does not cover third-party contributions.
- Consider whether you want one broad, portfolio-wide assignment (covering everything in `projects.yaml`, updated periodically) instead of narrow per-project ones like this draft — fewer documents to track, but requires keeping the Works list current.
- The USPTO Patent Pro Bono Program (pro-bono.uspto.gov, already flagged in the IP checklist) can review both this assignment and the GEE provisional patent application at no cost if you qualify.
- Once executed, add a line to `docs/reviews/2026-06-29-ip-checklist.md` marking the IP assignment item as done, with the execution date and a pointer to the signed copy's storage location (this document should not itself hold the signed original — store that outside the repo, e.g. the offline/private backup already recommended by DEV-ACCORD.08).
