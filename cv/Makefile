# Main variables
MAIN = main
BUILD_DIR = build

# Create directory structure matching the source
SUBDIRS = sections

# Latexmk configuration
LATEXMK = latexmk
LATEXMK_FLAGS = -lualatex -bibtex -shell-escape -interaction=nonstopmode -file-line-error
LATEXMK_OUTDIR = -output-directory=$(BUILD_DIR)

# ==================================================================
# =============== MODIFY BELOW JUST IF YOU KNOW WHAT YOU ARE DOING =

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

# ==================================================================
# Definition of the remove command based on the OS
RM = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm)

# ==================================================================
# TODO: Automatic files extraction using wildcard
# TEXSRC = $(wildcard $(SRC_DIR)/*.tex)
# BIBSRC = $(wildcard $(BIB_DIR)/*.bib)
# SECTIONSRC = $(wildcard $(SECTION_DIR)/*.tex)
# If the BIBSRC is not empty, then we need to generate the
# bbl database
# ifneq ($(strip $(BIBSRC)),)
#     BBLSRC = $(BUILD_DIR)/$(TARGET).bbl
# endif

# ==================================================================
# Default target
all: create_dirs $(BUILD_DIR)/$(MAIN).pdf

# ==================================================================
# Create necessary build subdirectories
create_dirs:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && mkdir -p $(SUBDIRS)

# ==================================================================
# Main compilation rule
$(BUILD_DIR)/$(MAIN).pdf: | create_dirs
	$(LATEXMK) $(LATEXMK_FLAGS) $(LATEXMK_OUTDIR) $(MAIN)
	cp $(BUILD_DIR)/$(MAIN).pdf .

# ==================================================================
# Clean all generated files
clean:
	$(RM) -rf $(BUILD_DIR)

# ==================================================================
# Clean auxiliary files but keep PDF
clean-aux:
	$(LATEXMK) -c $(LATEXMK_OUTDIR) $(MAIN)

# ==================================================================
# View PDF
open:
	@echo "Opening $(BUILD_DIR)/$(MAIN).pdf"
ifeq ($(OS_TYPE),Windows)
	@start /b cmd /c "$(BUILD_DIR)/$(MAIN).pdf"
else ifeq ($(OS_TYPE),Cygwin)
	@cygstart $(BUILD_DIR)/$(MAIN).pdf
else ifeq ($(OS_TYPE),Darwin)
	@open $(BUILD_DIR)/$(MAIN).pdf
else
	@xdg-open $(BUILD_DIR)/$(MAIN).pdf &
endif

# ==================================================================
# Watch for changes and recompile
watch:
	$(LATEXMK) $(LATEXMK_FLAGS) $(LATEXMK_OUTDIR) -pvc $(MAIN)

.PHONY: all clean clean-aux view watch create_dirs
