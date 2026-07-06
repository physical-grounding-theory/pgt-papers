# Convenience wrapper around build.sh
#
#   make            # build all papers (HTML always; PDF if a LaTeX engine is present)
#   make PAPER=papers/01-physical-correspondence   # build one paper
#   make clean      # remove generated HTML/PDF from paper folders and the template
#
# PDF requires a LaTeX engine (default tectonic). Override: make PDF_ENGINE=xelatex

PAPER ?=
PDF_ENGINE ?= tectonic

.PHONY: all clean
all:
	PDF_ENGINE=$(PDF_ENGINE) ./build.sh $(PAPER)

clean:
	rm -f papers/*/index.html template/index.html template/*.pdf
	@echo "cleaned generated HTML + template smoke-test outputs"
	@echo "note: paper PDFs (prebuilt or built) are left in place; a rebuild overwrites them"
