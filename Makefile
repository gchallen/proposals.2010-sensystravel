TARGET = proposal

TEXFILES = $(wildcard *.tex)
PDF = $(addsuffix .pdf,$(TARGET))

all: $(PDF)

%.pdf: %.tex $(TEXFILES)
	pdflatex $*.tex
	pdflatex $*.tex
	pdflatex $*.tex

embed: $(PDF)
	gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(PDF).embed -f $(PDF)
	mv $(PDF).embed $(PDF)
	
clean:
	@/bin/rm -f $(PDF) *.out *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty

FORCE:

