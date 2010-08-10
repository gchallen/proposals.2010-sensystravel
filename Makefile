TARGETS = summary description budgetjustification biosketch

TEXFILES = $(wildcard *.tex)
PDFS = $(addsuffix .pdf,$(TARGETS))

all: $(PDFS) join

join: $(PDFS)
	pdfjoin --paper letterpaper --outfile proposal.pdf $(PDFS)

%.pdf: %.tex $(TEXFILES)
	pdflatex $*.tex
	pdflatex $*.tex
	pdflatex $*.tex

clean:
	@/bin/rm -f $(PDFS) *.out *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty

FORCE:

