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
TEX    = latexmk -lualatex
BIBTEX = biber
RM     = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f)

# Default target
default all: $(OUTPUT_DIR)/$(TARGET).pdf

# Clean up auxiliary files
clean:
	-$(RM) $(OUTPUT_DIR)/*.bcf $(OUTPUT_DIR)/*.blg $(OUTPUT_DIR)/*.log \
	       $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.xml $(OUTPUT_DIR)/*.aux \
		   $(OUTPUT_DIR)/*.fdb_latexmk $(OUTPUT_DIR)/*.fls
	-@echo "clean project done."

# Clean up all files, including the main PDF
cleanall:
	-$(RM) $(OUTPUT_DIR)/*.bbl $(OUTPUT_DIR)/*.bcf $(OUTPUT_DIR)/*.blg $(OUTPUT_DIR)/*.log \
	       $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.xml $(OUTPUT_DIR)/*.aux \
		   $(OUTPUT_DIR)/*.fdb_latexmk $(OUTPUT_DIR)/*.fls $(OUTPUT_DIR)/$(TARGET).pdf
	-@echo "really clean project done."

# Open the generated PDF
open:
	@echo "Open $(OUTPUT_DIR)/$(TARGET).pdf"
ifeq ($(OS_TYPE),Windows)
	@start /b cmd /c "$(OUTPUT_DIR)/$(TARGET).pdf"
else ifeq ($(OS_TYPE),Cygwin)
	@cygstart $(OUTPUT_DIR)/$(TARGET).pdf
else ifeq ($(OS_TYPE),Darwin)
	@open $(OUTPUT_DIR)/$(TARGET).pdf
else
	@xdg-open $(OUTPUT_DIR)/$(TARGET).pdf &
endif

# Compile the project
$(OUTPUT_DIR)/%.pdf: %.tex $(BBLSRC)
	@echo "======================== BUILDING PROJECT ============================"
	@$(TEX) -output-directory=$(OUTPUT_DIR) $(MAIN)

# Dependencies
# DO NOT DELETE
$(TARGET).tex : $(TEXSRC)
$(OUTPUT_DIR)/$(TARGET).pdf: $(TEXSRC) $(BBLSRC)
$(OUTPUT_DIR)/$(TARGET).bbl: $(TEXSRC) $(BIBSRC)

.PHONY: default all clean reallyclean open
