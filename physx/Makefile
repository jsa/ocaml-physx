
include ../config/Makefile

MODULE=PhysX
INTERFACES=PhysXLoader
INCLUDES=\
	-I$(PHYSX_HOME)/SDKs/PhysXLoader/include \
	-I${PHYSX_HOME}/SDKs/Physics/include \
	-I${PHYSX_HOME}/SDKs/Foundation/include


all: $(MODULE).cmx

clean:: partialclean

# Main module
$(MODULE).cmx: $(INTERFACES:=.cmx)
	$(OCAMLOPT) -pack -o $@ $^

# All implementations depend on (compiled) interfaces
$(INTERFACES:=.ml): $(INTERFACES:=.cmi)

# Generalized SWIG dependencies

# All interfaces depend on SWIG interface
$(INTERFACES:=.mli): swig.cmi

# All compilations depend on SWIG
$(INTERFACES:=.cmx): swig.cmx

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
