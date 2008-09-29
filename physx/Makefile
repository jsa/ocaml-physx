
include ../config/Makefile

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

# SWIG checkout instructions
swig.ml swig.mli:
	$(SWIGCO) $@

partialclean::
	rm -f *.ml* *.o *.cxx *.c *.cm? swig.*

# Production rules

# All productions from SWIG interfaces
%.ml %.mli %_wrap.cxx: %.i
	$(SWIG) $(SWIG_FLAGS) $(SWIG_DEFINES) $(INCLUDES) -o $(<:.i=_wrap.cxx) $<

# SWIG C++ suffix fix
%.cxx.c : %.cxx
	cp $< $@

# Compile C++ sources
%.o : %.c
	$(OCAMLOPT) $(COMPFLAGS) -o $@ $<

# Compile OCaml sources
%.cmx: %.ml
	$(OCAMLOPT) -for-pack $(MODULE) -c -o $@ $<
%.cmi: %.mli
	$(OCAMLOPT) -for-pack $(MODULE) -c -o $@ $<

include .depend
