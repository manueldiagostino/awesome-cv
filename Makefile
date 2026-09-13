.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	cd $(EXAMPLES_DIR) && $(CC) -output-directory=. resume.tex

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	cd $(EXAMPLES_DIR) && $(CC) -output-directory=. cv.tex

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	cd $(EXAMPLES_DIR) && $(CC) -output-directory=. coverletter.tex

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
