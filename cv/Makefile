# Name of the main tex document (without .tex suffix)
TARGET = main

# Source Paths
SRC_DIR = .
BIB_DIR = .
SECTION_DIR = ./sections
OUTPUT_DIR = build

# Program Definitions
TEX = latexmk -lualatex
BIBTEX = biber
MAKEINDEX = makeindex

# ==================================================================
# =============== MODIFY BELOW JUST IF YOU KNOW WHAT YOU ARE DOING ===
# ==================================================================

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

# Variables
NOMENCL = nomencl.ist
RM = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f)
RMDIR = $(if $(filter $(OS_TYPE),Windows),rmdir /s /q ,rm -rf)

# Source Files
TEXSRC = $(wildcard $(SRC_DIR)/*.tex)
BIBSRC = $(wildcard $(BIB_DIR)/*.bib)
SECTIONSRC = $(wildcard $(SECTION_DIR)/*.tex)
CLSSRC = $(wildcard $(SRC_DIR)/*.cls)

# If the BIBSRC is not empty, then we need to generate the bbl database
ifneq ($(strip $(BIBSRC)),)
    BBLSRC = $(OUTPUT_DIR)/$(TARGET).bbl
endif

# Default target
default: all

# Main targets
all: init $(OUTPUT_DIR)/$(TARGET).pdf

# Initialize build directory
init:
	@mkdir -p $(OUTPUT_DIR)

# Clean up auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	-$(RM) $(OUTPUT_DIR)/*.bcf $(OUTPUT_DIR)/*.blg $(OUTPUT_DIR)/*.log \
	       $(OUTPUT_DIR)/*.out $(OUTPUT_DIR)/*.xml $(OUTPUT_DIR)/*.aux \
	       $(OUTPUT_DIR)/*.fdb_latexmk $(OUTPUT_DIR)/*.fls $(OUTPUT_DIR)/*.nlo \
	       $(OUTPUT_DIR)/*.ilg $(OUTPUT_DIR)/*.nls $(OUTPUT_DIR)/*.toc \
	       $(OUTPUT_DIR)/*.lof $(OUTPUT_DIR)/*.lot $(OUTPUT_DIR)/*.synctex.gz \
	       $(OUTPUT_DIR)/*.spl
	@echo "Clean project done."

# Clean up all files, including the main PDF and build directory
cleanall:
	@echo "Removing all generated files..."
	-$(RMDIR) $(OUTPUT_DIR)
	@echo "Really clean project done."

# Watch for changes and rebuild
watch:
	@echo "Watching for changes in .tex files..."
	@while true; do \
		$(MAKE) all; \
		inotifywait -qre close_write . sections/; \
	done

# Open the generated PDF
open:
	@echo "Opening $(OUTPUT_DIR)/$(TARGET).pdf"
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
$(OUTPUT_DIR)/%.pdf: %.tex $(BBLSRC) $(SECTIONSRC)
	@echo "======================== BUILDING PROJECT ============================"
	@$(TEX) -output-directory=$(OUTPUT_DIR) $
ifeq ($(NOMENCLATURE),ON)
	@$(MAKEINDEX) $(OUTPUT_DIR)/$(TARGET).nlo -s $(NOMENCL) -o $(OUTPUT_DIR)/$(TARGET).nls
	@$(TEX) -output-directory=$(OUTPUT_DIR) $
endif

# Dependencies
$(OUTPUT_DIR)/$(TARGET).pdf: $(TEXSRC) $(BBLSRC) $(SECTIONSRC) $(CLSSRC)
$(OUTPUT_DIR)/$(TARGET).bbl: $(TEXSRC) $(BIBSRC)

.PHONY: default all clean cleanall open watch init
