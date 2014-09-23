# Makefile for Tux Paint docs
# 
# Uses "links" to convert docs from HTML to plain text.
# (Normally only ran by the developers after updating the HTML, prior to
# release.)
#
# Bill Kendrick
# bill@newbreedsoftware.com
# 
# Sept. 4, 2005 - March 28, 2008
# $Id: Makefile,v 1.9 2008/05/24 06:41:06 albert Exp $

# Bah, "-no-numbering" and "-no-references" went away recently!? -bjk 2008.04.28
LINKS_OPTIONS:=-dump
LINKS:=links $(LINKS_OPTIONS)

HTMLFILES:=$(wildcard html/*.html)
TEXTFILES:=$(patsubst html/%.html,%.txt,$(HTMLFILES))

.PHONY: all
all:	$(TEXTFILES)

.PHONY: clean
clean:
	-rm $(TEXTFILES)

$(TEXTFILES): %.txt: html/%.html  
	$(LINKS) $< > $@
