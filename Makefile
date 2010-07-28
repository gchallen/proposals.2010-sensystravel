TARGETS = summary description budgetjustification biosketch

TEXFILES = $(wildcard *.tex)
PDFS = $(addsuffix .pdf,$(TARGETS))

all: $(PDFS)

%.pdf: %.tex $(TEXFILES)
	pdflatex $*.tex
	pdflatex $*.tex
	pdflatex $*.tex

clean:
	@/bin/rm -f $(PDF) *.out *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty

FORCE:

