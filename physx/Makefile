
include ../config/Makefile ../Makefile.rules

MODULE=libphysx
PHYSX_INCL=\
	PhysXLoader/include \
	Physics/include \
	Foundation/include
INCLUDES=\
	../swig \
	$(PHYSX_INCL:%=$(PHYSX_HOME)/SDKs/%)
VER=0.1

interfaces := $(wildcard *.i)

all: $(MODULE).cmxa
install: .install
clean: .clean

# Main module
$(MODULE).cmxa: $(interfaces:.i=.cmx) $(interfaces:.i=_wrap.cxx.o)
	$(OCAMLOPT) -a -o $@ $^

include .depend
