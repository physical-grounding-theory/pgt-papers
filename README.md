# Physical Grounding Theory — Papers

Public home for the papers of **Physical Grounding Theory (PGT)**, a multi-paper
research program by **Nathan Martin** (independent researcher) arguing that
reliable intelligence requires *physical grounding*: training and cognition must
stay coupled to physically verifiable reality, or they drift into confident
error.

**Landing page:** <https://physical-grounding-theory.github.io> ·
**License:** [CC BY 4.0](LICENSE)

---

## Available now

| # | Title | Status | Read |
|---|-------|--------|------|
| 1 | *Reality as Corrective: Physical Grounding as a Unified Solution to AI Alignment Pathologies* | **Published** — SSRN 6397178 | [PDF](papers/01-physical-correspondence/reality-as-corrective.pdf) · [source](papers/01-physical-correspondence/source/) |

More papers are being prepared for public release as they are refined (see the
roadmap below).

---

## Roadmap — the full series

PGT is organized in three strata. The **numbered** papers state the program's
commitments; the **lettered** papers derive them formally (siblings, not a
sub-sequence); **standalone** essays develop individual themes. Status labels
below reflect the current working state; only papers marked *Published* or with
a link above are public yet.

### Numbered series

| # | Title | Status |
|---|-------|--------|
| 0 | *The Roots of Knowledge and Meaning* (narrative introduction) | Draft |
| 1 | *Reality as Corrective: Physical Grounding as a Unified Solution to AI Alignment Pathologies* | **Published (SSRN 6397178)** |
| 1.5 | *The Physical Ground of Incompleteness: Gödel, Landauer, and the Outside Reference* | Draft |
| 2 | *The Physical Foundations of Ethics: Grounded Value, Structural Limits, and the Caretaker Obligation* | Draft in progress |
| 3 | *Epistemic Education and Institutional Design* | Working notes |
| 4 | *A Theory of True General Intelligence: The Architecture of Grounded AI* | Draft in progress |

### Lettered series (formal foundations)

| # | Title | Status |
|---|-------|--------|
| A | *The Embedding Constraint: Physical Limits on Self-Representation* | Near-submission |
| B | *The Empirical Remainder: Physical Limits on Environment-Representation* | Draft |
| C | *All the Way Down: Causal Asymmetry as Physical Primitive* | Pre-draft |

### Standalone essays

| Title | Status |
|-------|--------|
| *Physical Irreducibility: On the Bridge Between Computational and Physical Limits* | Full draft |
| *Grounded Liberty: Four Kinds of Unfreedom* | Full draft |
| *Usefulness as Handle-Reachability* | Skeleton locked |
| *The Maneuverability Principle* | Pre-draft |
| *The Gardener's Responsibility: Ethics, Evolution, and the AI Transition* | Draft |

---

## Repository layout

```
papers/NN-slug/
  metadata.yaml  # declares the ONE canonical source + build settings
  README.md      # abstract, status, citation
  <paper>.pdf    # built (or, for Paper 1, prebuilt) PDF
  index.html     # built web reading version
  source/        # manuscript source (LaTeX or Markdown + .bib)
shared/
  glossary.md    # core PGT vocabulary
assets/          # shared web CSS + PDF header for the build
template/        # copy this to start a new paper (also the build smoke test)
build.sh, Makefile   # the pandoc build pipeline — see BUILDING.md
```

Each paper is built from its declared canonical source (Markdown+BibTeX or
LaTeX) to a PDF and an HTML reading version with **pandoc** — run `./build.sh`
or `make`. See **[BUILDING.md](BUILDING.md)** for the full pipeline, prerequisites,
and how to add a paper; a GitHub Action re-runs the build on every push as a check.

Papers are added only after passing the **[Review & Polish gate](REVIEW_CHECKLIST.md)**
— peer review plus rigorous self-QA (theorem checks, citation verification,
terminology, falsifiability) before anything is posted publicly.

---

## Citing

Paper 1 (BibTeX):

```bibtex
@techreport{martin2026reality,
  author      = {Martin, Nathan},
  title       = {Reality as Corrective: Physical Grounding as a Unified
                 Solution to AI Alignment Pathologies},
  institution = {SSRN},
  type        = {Working Paper},
  number      = {6397178},
  year        = {2026},
  month       = {3},
  url         = {https://ssrn.com/abstract=6397178}
}
```

---

All content licensed under [CC BY 4.0](LICENSE). *Practice makes perfecter.*
