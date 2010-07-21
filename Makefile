TARGET = proposal

TEXFILES = $(wildcard *.tex)
PDF = $(addsuffix .pdf,$(TARGET))

all: $(PDF) missing

%.pdf: %.tex $(TEXFILES)
	pdflatex $*.tex
	pdflatex $*.tex
	pdflatex $*.tex

embed: $(PDF)
	gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(PDF).embed -f $(PDF)
	mv $(PDF).embed $(PDF)
	
missing:
	@echo "----------------------------------------------------------"
	@echo "MISSING CITATIONS:"
	@echo "----------------------------------------------------------"
	@(grep Cit *.log | awk '{print $$4}' | sort | uniq; exit 0)
	@echo "----------------------------------------------------------"
	@echo "MISSING REFERENCES:"
	@echo "----------------------------------------------------------"
	@(grep Ref *.log ; exit 0)


clean:
	@/bin/rm -f $(PDF) *.out *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty

FORCE:

