# Makefile for LaTeX project

# Variables
# TEX = pdflatex
# TEX = lualatex
TEX = latexmk
MAIN = main.tex
SRC_DIR = sections
STYLE = resume.cls

# Target
all: $(MAIN:.tex=.pdf)

# Compilation rules
$(MAIN:.tex=.pdf): $(MAIN) $(wildcard $(SRC_DIR)/*.tex) $(STYLE)
	$(TEX) -pdf $(MAIN)

# Clean
clean:
	rm -f *.aux *.log *.out *.toc *.dvi *.fdb_latexmk *.fls

# All clean
cleanall: clean
	rm -f $(MAIN:.tex=.pdf)
