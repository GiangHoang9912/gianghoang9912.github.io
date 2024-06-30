# Convert Markdown (resume.md) to DOCX and PDF
# prerequisites(Mac): pandoc, basictex

RESUME = release.md
OUTPUT_DIR = output
BRANCH_NAME := $(shell git rev-parse --abbrev-ref HEAD)

all: docx pdf html

html:
	@mkdir -p $(OUTPUT_DIR)
	pandoc $(RESUME) -o $(OUTPUT_DIR)/GiangNH_resume.html

docx:
	@mkdir -p $(OUTPUT_DIR)
	pandoc $(RESUME) -o $(OUTPUT_DIR)/GiangNH_resume.docx

pdf:
	@mkdir -p $(OUTPUT_DIR)
	cp -r $(FONTS_DIR)/* $(OUTPUT_DIR)/
	pandoc $(RESUME) -o $(OUTPUT_DIR)/GiangNH_resume.pdf \
		--pdf-engine=xelatex \
		--variable geometry:margin=1in \
		--variable fontsize=12pt \
		--variable documentclass=article \
		--variable classoption=twoside \
		--variable classoption=a4paper \
		--variable lang=en \
		--variable toc-depth=2 \
		--variable toc-own-page=true \
		--variable indent=true \
		--pdf-engine-opt=--shell-escape

clean:
	rm -rf $(OUTPUT_DIR)

.PHONY: all docx pdf clean