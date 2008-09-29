
include ../config/Makefile ../Makefile.rules

MODULE=libphysx
PHYSX_INCL=\
	PhysXLoader/include \
	Physics/include \
	Foundation/include
INCLUDES=$(PHYSX_INCL:%=-I$(PHYSX_HOME)/SDKs/%)
VER=0.1

interfaces := $(wildcard *.i)

all: $(MODULE).cmxa

install:: partialinstall

clean:: partialclean

# Main module
$(MODULE).cmxa: $(interfaces:.i=.cmx) $(interfaces:.i=_wrap.cxx.o)
	$(OCAMLOPT) -a -o $@ *.cmx *_wrap.cxx.o

partialinstall::
	# also $(MODULE).cma
	cp *.cmi *.cmx $(MODULE).cmxa $(MODULE).a $(LIBDIR)

partialclean::
	rm -f *.ml* *.a *.o *.cxx *.c *.cm* swig.*

include .depend
