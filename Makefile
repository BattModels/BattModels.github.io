# targets that aren't filenames
.PHONY: all clean deploy-publish deploy-preview deploy-github build serve test

all: build

clean:
	$(RM) -r _site _site-publish $(BIB_FILES)

# Build the site
build: _site/

BIBBLE = bibble

# Delete targets that fail to build
.DELETE_ON_ERROR:

# Install Gemfiles
TOOLS := Gemfile.lock pip.install
Gemfile.lock: Gemfile
	bundle install
	touch $@

# Install Python dependencies
pip.install: requirements.txt
	python -m pip install --user -r requirements.txt 2>&1 | tee $@

# Source Files
# This builds a list of files that make up the website
# Files in the root directory are only added if *.html/*.md and are tracked by
# git.
dirs := _data _includes _layouts _posts _projects bib css img js
SRC := $(foreach dir, $(dirs), $(wildcard $(dir)/*))
SRC += $(shell git ls-tree -r --name-only HEAD -- *.md)
SRC += $(shell git ls-tree -r --name-only HEAD -- *.html)
SRC += _config.yml

# Generate HTML files for publications
.DELETE_ON_ERROR: _includes/%.html
BIB_FILES := _includes/pubs.html _includes/patents.html
_includes/%.html: bib/%.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

_site/ : $(BIB_FILES) $(SRC) $(TOOLS)
	rm -rf $@
	bundle exec jekyll build
	touch $@

# Build target for publishing to AWPS
PUBLISH_DIR ?= /me/venkatgroup
_site-publish/ : $(BIB_FILES) $(SRC) $(TOOLS)
	rm -rf $@
	JEKYLL_ENV=production \
	bundle exec jekyll build -d $(join $@, $(PUBLISH_DIR)) -b $(PUBLISH_DIR)
	touch $@

# Build and serve the site for viewing locally
# Note: This will update most pages as you edit them, except for ones generated
# externally to Jekyll. (Think Biblography pages). You can regenerate those, but
# running `make build` in a  seperate shell. Jeykell then reload with the updated
# pages
# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 5000
serve: _site/ Gemfile.lock
	bundle exec jekyll serve -l -I \
		--port $(SERVE_PORT) --host $(SERVE_HOST)

# Run test on the website using htmlproofer
test: _site/ _site-publish/ $(TOOLS)
	@echo "Running pre-commit"
	# pre-commit run -a

	@echo "Checking _data/people.yml"
	python3 dev/check_people.py

	@echo "Checking preview version"
	bundle exec htmlproofer \
	--disable-external \
	--check-html --check-img-http --enforce-https \
	_site

	@echo "Checking published version"
	bundle exec htmlproofer \
	--disable-external \
	--check-html --check-img-http --enforce-https \
	_site-publish/
