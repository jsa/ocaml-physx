
include ../config/Makefile ../Makefile.rules

MODULE=libglut
GLUT_INCL=\
	Graphics/include/win32
INCLUDES=\
	../swig \
	$(GLUT_INCL:%=$(PHYSX_HOME)/%)
VER=0.1

interfaces := $(wildcard *.i)

all: $(MODULE).cmxa
install: .install
clean: .clean

# Main module
$(MODULE).cmxa: $(interfaces:.i=.cmx) $(interfaces:.i=_wrap.cxx.o)
	$(OCAMLOPT) -a -o $@ $^

include .depend
