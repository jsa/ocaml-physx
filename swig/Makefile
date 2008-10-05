
include ../config/Makefile ../Makefile.rules

MODULE=swig

all: $(MODULE).cmxa
install: .install
clean: .clean

# Main module
$(MODULE).cmxa: Swig.cmx
	$(OCAMLOPT) -a -o $@ $^

# SWIG checkout instructions
Swig.ml Swig.mli:
	$(SWIGCO) $@

include .depend
