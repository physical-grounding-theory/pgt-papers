::: {.abstract}
This is a template paper. It exists to (1) show how a Markdown paper is authored
for the PGT build pipeline and (2) act as a smoke test that `pandoc` still builds
cleanly. Copy the `template/` folder to `papers/NN-slug/`, replace this text, and
edit `metadata.yaml`.
:::

# 1. Writing

Write in Markdown. Title, author, and date come from `metadata.yaml`, not from
this file. Use normal headings (`#`, `##`), *emphasis*, `code`, block quotes,
tables, and footnotes.[^note]

[^note]: Footnotes work out of the box.

Cite sources with `[@key]`, where `key` is a BibTeX entry in `source/refs.bib`.
For example, the foundational behavioral argument for grounding is due to
Brooks [@brooks1990elephants]. Citations and the reference list are rendered by
pandoc's `--citeproc`.

# 2. Building

From the repo root:

```sh
./build.sh template                 # this paper only
./build.sh                          # every paper
make                                # same, via Make
```

Each build produces an HTML reading version (`index.html`) and, if a LaTeX
engine (tectonic) is available, a PDF. Before promoting a real paper, it must
pass the [Review & Polish gate](../../REVIEW_CHECKLIST.md).

# References
