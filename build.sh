#!/usr/bin/env bash
#
# Build PGT papers from source with pandoc.
#
#   ./build.sh                 # build every paper (+ the template smoke test)
#   ./build.sh papers/01-...    # build one or more specific paper folders
#
# Each paper folder declares its ONE canonical source in metadata.yaml, so the
# build never globs source/ (older/duplicate drafts are ignored by design).
#
# metadata.yaml keys used by the build:
#   build:        pandoc | latex | prebuilt   (default: pandoc)
#   source:       path to canonical source, relative to the paper folder
#   output:       base name for the built PDF (e.g. reality-as-corrective)
#   bibliography: optional .bib path, relative to the paper folder
#   web:          true | false  (build an HTML reading version; default true)
# pandoc also reads title/subtitle/author/date/abstract from the same file.
#
# PDF needs a LaTeX engine (default: tectonic — one self-contained binary).
# Override with PDF_ENGINE=xelatex ./build.sh  etc. If no engine is found, the
# HTML still builds and the PDF step is skipped with a warning.

set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"
ASSETS="$ROOT/assets"
PDF_ENGINE="${PDF_ENGINE:-tectonic}"

getmeta() { # key file  -> scalar value (strips quotes and trailing comments)
  grep -E "^$1:" "$2" 2>/dev/null | head -1 \
    | sed -E "s/^$1:[[:space:]]*//; s/[[:space:]]+#.*$//; s/^\"(.*)\"$/\1/; s/^'(.*)'$/\1/; s/[[:space:]]+$//"
}
have() { command -v "$1" >/dev/null 2>&1; }

build_one() {
  local dir="${1%/}"
  local meta="$dir/metadata.yaml"
  [ -f "$meta" ] || { echo "skip  $dir  (no metadata.yaml)"; return 0; }

  local mode src out web bib
  mode="$(getmeta build "$meta")"; mode="${mode:-pandoc}"
  src="$(getmeta source "$meta")"
  out="$(getmeta output "$meta")"
  web="$(getmeta web "$meta")"; web="${web:-true}"
  bib="$(getmeta bibliography "$meta")"
  echo "==> $dir  [$mode]"

  case "$mode" in
    prebuilt)
      echo "    prebuilt — keeping committed artifacts, nothing to build"
      ;;

    pandoc)
      [ -n "$src" ] || { echo "    ERROR: 'source:' missing in $meta"; return 1; }
      [ -f "$dir/$src" ] || { echo "    ERROR: source not found: $dir/$src"; return 1; }
      local common=( "$dir/$src" --metadata-file="$meta"
                     --resource-path="$dir:$dir/$(dirname "$src")" )
      [ -n "$bib" ] && common+=( --citeproc --bibliography="$dir/$bib" )

      if [ "$web" = "true" ]; then
        local head; head="$(mktemp)"
        { cat "$ASSETS/web-head.html"; echo '<style>'; cat "$ASSETS/web.css"; echo '</style>'; } > "$head"
        pandoc "${common[@]}" --standalone --toc --toc-depth=2 \
          --include-in-header="$head" -o "$dir/index.html"
        rm -f "$head"
        echo "    -> $dir/index.html"
      fi

      if [ -n "$out" ]; then
        if have "$PDF_ENGINE"; then
          pandoc "${common[@]}" --pdf-engine="$PDF_ENGINE" \
            --include-in-header="$ASSETS/header.tex" \
            -V geometry:margin=1in -V colorlinks=true -V linkcolor=RoyalBlue \
            -o "$dir/$out.pdf"
          echo "    -> $dir/$out.pdf"
        else
          echo "    !! PDF skipped: engine '$PDF_ENGINE' not found (install tectonic)."
        fi
      fi
      ;;

    latex)
      [ -n "$src" ] || { echo "    ERROR: 'source:' missing in $meta"; return 1; }
      if have "$PDF_ENGINE"; then
        ( cd "$dir/$(dirname "$src")" && "$PDF_ENGINE" "$(basename "$src")" )
        cp "$dir/${src%.tex}.pdf" "$dir/${out:-paper}.pdf"
        echo "    -> $dir/${out:-paper}.pdf"
      else
        echo "    !! cannot build LaTeX paper: engine '$PDF_ENGINE' not found."
      fi
      ;;

    *)
      echo "    ERROR: unknown build mode '$mode' in $meta"; return 1 ;;
  esac
}

status=0
if [ "$#" -gt 0 ]; then
  for d in "$@"; do build_one "$d" || status=1; done
else
  for d in papers/*/ template/; do [ -d "$d" ] && { build_one "$d" || status=1; }; done
fi
[ "$status" -eq 0 ] && echo "OK" || echo "FAILED"
exit "$status"
