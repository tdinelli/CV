# Inspired by: http://www.physics.wm.edu/~norman/thesis/Makefile
# Taken from: https://gist.github.com/xu-cheng/6259575
# Modified by me (Timoteo Dinelli)

# Name of the main tex document (without .tex suffix)
TARGET = main

# Source Paths
SRCDIR = .
BIBDIR = .
OUTPUT_DIR = build

# Source Files
TEXSRC = $(foreach VAR,$(SRCDIR),$(wildcard $(VAR)/*.tex))
BIBSRC = $(foreach VAR,$(BIBDIR),$(wildcard $(VAR)/*.bib))

# If the BIBSRC is not empty, then we need to generate the bbl database
ifneq ($(strip $(BIBSRC)),)
   BBLSRC = $(OUTPUT_DIR)/$(TARGET).bbl
endif

# OS detection
ifeq ($(OS),Windows_NT)
    ifneq ($(findstring .exe,$(SHELL)),)
        OS_TYPE := Windows
    else
        OS_TYPE := Cygwin
    endif
else
    OS_TYPE := $(shell uname -s)
endif

# Program Definitions
TEX    = lualatex -shell-escape -8bit
BIBTEX = biber
RM     = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f)

# Default target
default all: $(OUTPUT_DIR)/$(TARGET).pdf

# Clean up auxiliary files
clean:
	-$(RM) $(OUTPUT_DIR)/*.bcf $(OUTPUT_DIR)/*.blg $(OUTPUT_DIR)/*.log \
	       $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.xml
	-@echo "clean project done."

# Clean up all files, including the main PDF
cleanall:
	-$(RM) $(OUTPUT_DIR)/*.bbl $(OUTPUT_DIR)/*.bcf $(OUTPUT_DIR)/*.blg $(OUTPUT_DIR)/*.log \
	       $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.xml $(OUTPUT_DIR)/$(TARGET).pdf
	-@echo "really clean project done."

# Open the generated PDF
open:
	-@echo "Open $(OUTPUT_DIR)/$(TARGET).pdf"
ifeq ($(OS_TYPE),Windows)
	-@start /b cmd /c "$(OUTPUT_DIR)/$(TARGET).pdf"
else
ifeq ($(OS_TYPE),Cygwin)
	-@cygstart $(OUTPUT_DIR)/$(TARGET).pdf
else
	-$(OUTPUT_DIR)/$(TARGET).pdf &
endif
endif

# To generate a .pdf file from a .tex file
# Note: LaTeX must be run multiple times to get the proper
#       cross-referencing from the \ref and \cite commands
#       and to generate correct hyperref and contents.
$(OUTPUT_DIR)/%.pdf: %.tex $(BBLSRC)
	@echo "======================== TEX -> PDF ============================"
	@$(TEX) -output-directory=$(OUTPUT_DIR) $<
	@$(TEX) -output-directory=$(OUTPUT_DIR) $<

# To generate a .bbl file from a .aux file
$(OUTPUT_DIR)/%.bbl: $(OUTPUT_DIR)/%.aux
ifneq ($(strip $(BIBSRC)),)
	@echo "======================== AUX -> BBL ============================"
	@$(BIBTEX) -output-directory=$(OUTPUT_DIR) $(basename $*)
endif

# To generate a .aux file from a .tex file
$(OUTPUT_DIR)/%.aux: %.tex
	@echo "======================== TEX -> AUX ============================"
	@$(TEX) -output-directory=$(OUTPUT_DIR) $<

# Dependencies
# DO NOT DELETE
$(TARGET).tex : $(TEXSRC)
$(OUTPUT_DIR)/$(TARGET).pdf: $(TEXSRC) $(BBLSRC)
$(OUTPUT_DIR)/$(TARGET).bbl: $(TEXSRC) $(BIBSRC)

.PHONY: default all clean reallyclean open
