LATEXMK=docker run --rm -v `pwd`:/docs hgjt/emacs-texlive:latest
LATEXMKOPT=-xelatex
SOURCES=simpledoc.tex Makefile

.PHONY: build clean help
.DEFAULT_GOAL := help

build: simpledoc.pdf  ## build simpledoc PDF

simpledoc.pdf: $(SOURCES)
	$(LATEXMK) $(LATEXMKOPT) simpledoc.tex

clean:  ## clean up all build artifacts
	$(LATEXMK) -C simpledoc

help:  ## print usage information
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
