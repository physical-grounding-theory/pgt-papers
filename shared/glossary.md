# PGT Glossary

Core vocabulary for the Physical Grounding Theory paper series. Terms marked **[load-bearing]** are used in formal arguments and have precise definitions that should not be paraphrased loosely.

---

## Core Principles

**Physical Correspondence Principle (PCP)** [load-bearing]  
A cognitive system's reliability is bounded by the fidelity of its correspondence to physical states. The stronger claim of PGT is that this is a structural necessity, not a contingent design choice.

**Physical Grounding Theory (PGT)**  
The research program built on PCP. Argues that reliable intelligence — biological or artificial — requires physical grounding as an architectural requirement. Ungrounded systems systematically generate and propagate errors that cannot be detected or corrected from within.

**Epistemic Rule** [load-bearing]  
*To improve ethically over time, we must behave in ways that allow honest information about ethical outcomes to be collected, preserved, curated, and acted upon.* A structural consequence of what it means to be a correctable, embedded learning system.

---

## Epistemic Tier System (From Paper 1)

**EV — Empirically Verified**  
Claims directly grounded in physical measurement with documented provenance.

**EP — Empirically Provisional**  
Claims with strong inferential support from EV-grounded evidence, but not directly measured. Might have a Probability.

**ICF — Internally Consistent Fiction**
Could also be Internally Self-Consistent Fiction. May include partially ungrounded formal systems. We might want to call it Constructed. Claims that are logically coherent within a formal system but lack physical grounding. Most mathematics, logic, and well-formed theory prior to empirical contact live here.

**UF — Unfalsifiable**  
Claims with no traceable grounding in physical reality and no ability to falsify them. Hallucinated facts, unsourced assertions, and closed ideological systems belong here.

---

## Structural Concepts

**Embedding Constraint**  
The impossibility result showing that no non-trivial physical system can maintain a faithful self-model. Derived from three independent theorems (Storage, Dynamic, Thermodynamic). See Paper A.

**Empirical Remainder (R)** [load-bearing]  
The state of physical reality not yet transferred into a bounded system via boundary flux. Not ignorance — a structural feature of any embedded system. See Paper B.

**Boundary Flux**  
The dynamic process by which a bounded system exchanges information/energy with its environment. The rate and fidelity of boundary flux constrains how much of physical reality a system can represent.

**Causal Asymmetry**  
The asymmetry between cause and effect, treated in PGT as a physical primitive rather than a derivative of thermodynamics or temporal direction. The foundational claim of Paper C.

**Terminal Attractor**  
A system state from which recovery is structurally impossible. Ethics, in PGT's framing, is the rule-set that keeps multi-agent systems away from such states.

**Grounding Degradation**  
The process by which provenance metadata degrades across inference layers — from `physical:measured` toward `inferred:asserted` — with no architectural signal marking the transition. Demonstrated empirically in the EXPECT primitive experiments.

---

## Architecture Terms (GPGP / Physictionary)

**GPGP — General Purpose Game Playing**  
A system which we will be developing that can play any game a human can play. Includes a four-question epistemic loop architecture designed to maintain physical grounding through active prediction, error detection, and belief revision.

**MoM — Map of Maps**  
A local, multi-resolution, self-referential knowledge structure. Operates as GPGP's working memory, with COW (copy-on-write) forking for provisional belief states.

**GTE — Ground Truth Environment**
Any environment which an AI system can experiment with and learn from. Modern AI might also call this a gym.

**GTR — Ground Truth Reality**
Specifically, the GTE of physical Reality.

**GTE-DB — Grounded Truth Environment Database**  
The persistent store of grounding environments, claims, test results, indexed by provenance tier. Also tracks simulations, solvers, and relations with other entries. A possible implementation of MoM db.

**Physictionary**  
A (future) web-hosted, wiki-style, physically-grounded ontology which could be used for pre-training, or paritally synced into MoM. Entries carry provenance as part of the primary key.

**EXPECT**  
A query primitive that makes prediction-error computation native to knowledge retrieval. When a system EXPECTs a value and receives a different one, the discrepancy is a first-class signal.

**Spaghetti Temperature**  
A parameter controlling the degree of representation-level exploration — how far a system will range from its current representational commitments when searching for alternatives. Possible analog to human neural focus or drift. Might also be connected to reservoir computing. Different than randomness or temperature in LLM.

---

## Foundational Citations

**Brooks (1990)** — "Elephants Don't Play Chess." The foundational empirical citation that PGT formally grounds: the argument that intelligent behavior emerges from physical embedding, not symbolic manipulation over world-models.
