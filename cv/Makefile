# Main variables
MAIN = main
BUILD_DIR = build
SECTIONS_DIR = sections

# Latexmk configuration
LATEXMK = latexmk
LATEXMK_FLAGS = -lualatex \
                -bibtex \
                -shell-escape \
                -interaction=nonstopmode \
                -file-line-error

# Source files
TEXSRC = $(wildcard *.tex)
BIBSRC = $(wildcard *.bib)
SECTIONSRC = $(wildcard $(SECTIONS_DIR)/*.tex)

# ==================================================================
# =============== MODIFY BELOW JUST IF YOU KNOW WHAT YOU ARE DOING =
# ==================================================================

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
RM = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -rf)

# ==================================================================
# Default target
all: create_dirs $(BUILD_DIR)/$(MAIN).pdf

# ==================================================================
# Create necessary build subdirectories
create_dirs:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && mkdir -p $(SECTIONS_DIR)

# ==================================================================
# Main compilation rule
$(BUILD_DIR)/%.pdf: %.tex $(SECTIONSRC) | create_dirs
	$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR)
	cp $(BUILD_DIR)/$(MAIN).pdf .

# ==================================================================
# Clean all generated files
clean:
	$(RM) $(BUILD_DIR)
	$(RM) $(MAIN).pdf

# ==================================================================
# Clean auxiliary files but keep PDF
clean-aux:
	$(LATEXMK) -c -output-directory=$(BUILD_DIR) $(MAIN)

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
	$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) -pvc $(MAIN)

.PHONY: all clean clean-aux open watch create_dirs
