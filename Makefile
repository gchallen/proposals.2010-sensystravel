TARGETS = summary description budgetjustification biosketch references

TEXFILES = $(wildcard *.tex)
PDFS = $(addsuffix .pdf,$(TARGETS))

all: $(PDFS) proposal.pdf

proposal.pdf: $(PDFS)
	pdfjoin --paper letterpaper --outfile proposal.pdf $(PDFS)

references.pdf: summary.pdf
	pdftk summary.pdf cat end output references.pdf

summary.pdf: summary.tex summary.bib
	pdflatex summary.tex
	bibtex summary
	pdflatex summary.tex
	pdflatex summary.tex
	pdftk summary.pdf cat 1 output summary-new.pdf
	mv summary-new.pdf summary.pdf

%.pdf: %.tex 
	pdflatex $*.tex
	pdflatex $*.tex
	pdflatex $*.tex

clean:
	@/bin/rm -f $(PDFS) *.out *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty

FORCE:
.PHONY: join
