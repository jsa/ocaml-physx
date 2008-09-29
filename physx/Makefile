
include ../config/Makefile ../Makefile.rules

MODULE=PhysX
PHYSX_INCL=\
	PhysXLoader/include \
	Physics/include \
	Foundation/include
INCLUDES=$(PHYSX_INCL:%=-I$(PHYSX_HOME)/SDKs/%)

interfaces := $(wildcard *.i)

all: $(MODULE).cmx

clean:: partialclean

# Main module
$(MODULE).cmx: $(interfaces:.i=.cmx)
	$(OCAMLOPT) -pack -o $@ $^

# All implementations depend on (compiled) interfaces
$(interfaces:.i=.ml): %.ml: %.cmi

# Generalized SWIG dependencies

# All interfaces depend on SWIG interface
$(interfaces:.i=.mli): swig.cmi

# All implementations depend on SWIG
$(interfaces:.i=.cmx): %.cmx: %_wrap.cxx.o swig.cmx

partialclean::
	rm -f *.ml* *.o *.cxx *.c *.cm? swig.*

include .depend
