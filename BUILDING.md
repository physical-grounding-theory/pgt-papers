# Building the papers

Papers are authored as **Markdown (+ BibTeX)** or **LaTeX** and built with
`pandoc` into an HTML reading version and a PDF. Paper 1 is the published
version-of-record and ships as a committed PDF (not rebuilt).

## How it works

- Each paper folder (`papers/NN-slug/`) has a **`metadata.yaml`** that names the
  **one** canonical source. The build reads only that file — older or duplicate
  drafts left in `source/` are ignored, so nothing stale gets published.
- `./build.sh` produces, per paper, `index.html` (web version) and `<output>.pdf`.
- **Outputs are committed** and served by GitHub Pages from `main`. You build
  locally, then commit `index.html` / `<slug>.pdf` alongside the source. The
  GitHub Action (`.github/workflows/build.yml`) is a **check** that re-runs the
  build on every push and fails if a source stops building — it does not deploy.

## Prerequisites

- **pandoc** ≥ 3 — <https://pandoc.org/installing.html>
- **tectonic** (self-contained LaTeX engine, needed only for PDF):
  - Windows: `winget install TectonicProject.Tectonic` (or `scoop install tectonic`)
  - macOS: `brew install tectonic`
  - Linux: `curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh`

Without a LaTeX engine, HTML still builds and the PDF step is skipped with a
warning. Use another engine with `PDF_ENGINE=xelatex ./build.sh`.

## Commands

```sh
./build.sh                                  # build everything (+ template smoke test)
./build.sh papers/01-physical-correspondence # one paper
make                                        # same as ./build.sh
make PAPER=papers/NN-slug                    # one paper via make
make clean                                  # remove generated HTML + template outputs
```

## Adding a new paper

1. `cp -r template papers/NN-slug` (e.g. `papers/02-embedding-constraint`).
2. Put the canonical manuscript in `papers/NN-slug/source/` and any refs in
   `source/refs.bib`.
3. Edit `metadata.yaml` (see keys below).
4. Run the paper through the **[Review & Polish gate](REVIEW_CHECKLIST.md)**.
5. `./build.sh papers/NN-slug`, eyeball `index.html` and the PDF.
6. Add a `README.md` (abstract, status, citation), commit the source **and** the
   built `index.html` / `<slug>.pdf`, and link it from the landing site.

## `metadata.yaml` keys

| Key | Meaning |
|-----|---------|
| `title`, `subtitle`, `author`, `date`, `abstract` | Read by pandoc for the document. |
| `build` | `pandoc` (Markdown), `latex` (raw `.tex`), or `prebuilt` (skip — keep committed PDF). Default `pandoc`. |
| `source` | The one canonical source, relative to the paper folder. |
| `output` | Base name for the built PDF (`<output>.pdf`). |
| `bibliography` | Optional `.bib`, relative to the paper folder (enables `--citeproc`). |
| `web` | `true`/`false` — build the HTML reading version. Default `true`. |

Styling for the HTML version lives in `assets/web.css` (+ `assets/web-head.html`
for fonts) and is inlined at build time, so pages are self-contained. PDF layout
is in `assets/header.tex`.
