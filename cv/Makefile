# Makefile for LaTeX project

# Variables
TEX = latexmk
MAIN = main.tex
SRC_DIR = sections
STYLE = resume.cls
OUTPUT_DIR = ./build

# Target
all: $(MAIN:.tex=.pdf)

# Compilation rules
$(MAIN:.tex=.pdf): $(MAIN) $(wildcard $(SECTION_DIR)/*.tex)
	$(TEX) -pdf -output-directory=$(OUTPUT_DIR) $(MAIN)

# Clean
clean:
	rm -f $(OUTPUT_DIR)/*.aux \
		$(OUTPUT_DIR)/*.log \
		$(OUTPUT_DIR)/*.out \
		$(OUTPUT_DIR)/*.toc \
		$(OUTPUT_DIR)/*.dvi \
		$(OUTPUT_DIR)/*.fdb_latexmk \
		$(OUTPUT_DIR)/*.fls \
		$(OUTPUT_DIR)/*.bcf \
		$(OUTPUT_DIR)/*.nav \
		$(OUTPUT_DIR)/*.run.xml \
		$(OUTPUT_DIR)/*.snm \
		$(OUTPUT_DIR)/*.bbl \
		$(OUTPUT_DIR)/*.blg \
		$(OUTPUT_DIR)/*.spl

# All clean
cleanall: clean
	rm -f $(OUTPUT_DIR)/$(MAIN:.tex=.pdf)
