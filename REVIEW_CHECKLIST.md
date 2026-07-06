# Review & Polish Gate

No paper enters this repository (and no preprint is posted) until it has passed
this gate. The goal is **peer review + rigorous self-QA before public posting** —
priority matters, but a public error in a formal result is expensive, so we
polish and double-check first, then post to the right audience.

Copy the checklist below into the paper's promotion PR / handoff and check each
box. Items marked **[formal]** apply to the lettered series (A/B/C) and any paper
stating theorems; the rest apply to every paper.

---

## 1. Correctness & rigor

- [ ] Central claims restated in one place and each is either proven, cited, or
      explicitly flagged as conjecture.
- [ ] **[formal]** Every theorem/lemma independently re-derived by a second pass
      (not just re-read) — ideally a reader who did not draft it.
- [ ] **[formal]** Each proof's assumptions are listed and actually used;
      no step depends on an unstated premise.
- [ ] **[formal]** Any numerical result or computation reproduced from scratch
      (e.g. the Landauer-bound arithmetic; a β-sweep) and the script/values kept.
- [ ] **Hostile-reviewer pass** completed: strongest available objection to the
      main result written down and answered in the text (extend the existing
      reviewer-simulation pattern, e.g. `*_reviewer_report.md`).
- [ ] Scope and limitations section is honest about what is *not* claimed.

## 2. Falsifiability

- [ ] The paper states at least one concrete prediction or condition under which
      it would be **wrong** (a first-class PGT requirement).
- [ ] No load-bearing claim is unfalsifiable-by-construction; any that are, are
      labeled as framing/definition, not result.

## 3. Citations & references

- [ ] Every citation checked against the actual source (claim really is in the
      cited work) — the "citations-verified" pattern from the Usefulness paper.
- [ ] Foundational cites present and correct (e.g. Brooks 1990; Landauer;
      Gödel; Friston/active inference where invoked).
- [ ] Reference list complete, deduplicated, and consistently formatted; all
      in-text cite keys resolve.

## 4. Terminology & consistency

- [ ] Terms match `shared/glossary.md` (canonical). Reconcile known drift:
      **EV/EP/ICF/UF** wording, **GPGP** expansion, and any lingering
      **"PCP Research Program" → PGT** rename in headers/footers.
- [ ] Notation is consistent across sections; symbols defined before use.
- [ ] Title and status match `PGTWORK/INDEX.md` and `SERIES.md`; the paper's
      stratum (numbered / lettered / standalone) and its relation to siblings is
      clear (e.g. Gardener's vs Paper 2).

## 5. Presentation

- [ ] Full copyedit pass (grammar, flow, no dangling TODO/XXX/placeholder).
- [ ] Abstract stands alone and matches the paper's actual contribution.
- [ ] Figures/tables captioned and referenced; PDF builds clean from source.

## 6. External peer review

At least one of the following is done and its feedback addressed:

- [ ] Solicited review from ≥1 domain expert (narrow, specific ask).
- [ ] Open community review (e.g. LessWrong / Alignment Forum for
      alignment-framed papers; PhilSci Archive for phil-of-science framing;
      a reading group / seminar walk-through).
- [ ] Record where it was reviewed and the substantive changes that resulted.

## 7. Audience & venue (decide before posting)

- [ ] Target audience named and the matching preprint home chosen:
      - Formal (A/B/C) → **arXiv** cs.LO / math.LO / cs.AI
      - Alignment-framed → Alignment Forum / LessWrong, then arXiv cs.AI
      - Ethics → EA Forum + philosophy-of-AI venues
      - Narrative (Paper 0) → Substack → op-eds (not a preprint server)
- [ ] Preprint-server policy and licensing (CC BY 4.0) confirmed for that venue.

## 8. Sign-off

- [ ] Reviewer(s): __________  Date: __________
- [ ] Author sign-off that items above are complete: __________
- [ ] Only now: copy source + PDF into `papers/NN-slug/`, add the site link,
      flip the status badge, and (if posting) submit to the chosen preprint home.

---

*Practice makes perfecter — the point of this gate is to make the practice
correctable before it is public.*
