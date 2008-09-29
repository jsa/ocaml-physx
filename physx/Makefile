
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
# (a little too wide, everything depends on everything)
$(interfaces:.i=.ml):	$(interfaces:.i=.cmi)

# Generalized SWIG dependencies

# All interfaces depend on SWIG interface
$(interfaces:.i=.mli): swig.cmi

# All compilations depend on SWIG
# (a little too wide, everything depends on everything)
$(interfaces:.i=.cmx): $(interfaces:.i=_wrap.cxx.o) swig.cmx

# SWIG checkout instructions
swig.ml swig.mli:
	$(SWIGCO) $@

partialclean::
	rm -f *.ml* *.o *.cxx *.c *.cm? swig.*

# Production rules

.SUFFIXES: .i _wrap.cxx .cxx .cxx.c .ml .mli .cmx .cmi

# All productions from SWIG interfaces
.i.ml .i.mli .i_wrap.cxx:
	$(SWIG) $(SWIG_FLAGS) $(SWIG_DEFINES) $(INCLUDES) $<

# SWIG C++ suffix fix
.cxx.cxx.c:
	cp $< $<.c

# Compile C++ sources
.c.o:
	$(OCAMLOPT) $(COMPFLAGS) $<

# Compile OCaml sources
.ml.cmx .mli.cmi:
	$(OCAMLOPT) -for-pack $(MODULE) -c $<

include .depend
