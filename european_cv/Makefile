# Makefile for LaTeX project

# Variables
TEX = latexmk
MAIN = main.tex
SRC_DIR = sections

# Target
all: $(MAIN:.tex=.pdf)

# Compilation rules
$(MAIN:.tex=.pdf): $(MAIN) $(wildcard $(SRC_DIR)/*.tex)
	$(TEX) -pdf $(MAIN)

# Clean
clean:
	rm -f *.aux *.log *.out *.toc *.dvi *.fdb_latexmk *.fls main.bbl main.bcf main.blg main.run.xml

# All clean
cleanall: clean
	rm -f $(MAIN:.tex=.pdf)
