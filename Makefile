

defaultentry:
	@echo -e "\
    all: build all\n\
  clean: clean all\n\
install: install to $(LIBDIR)"

include config/Makefile Makefile.rules

all:: partialall

install:: partialinstall

clean:: partialclean

# SWIG
partialall::
	cd swig && $(MAKE) all

partialinstall::
	cd swig && $(MAKE) install

partialclean::
	cd swig && $(MAKE) clean

# OpenGL bindings
partialall::
	cd glut && $(MAKE) all

partialinstall::
	cd glut && $(MAKE) install

partialclean::
	cd glut && $(MAKE) clean

# PhysX
partialall::
	cd physx && $(MAKE) all

partialinstall::
	cd physx && $(MAKE) install

partialclean::
	cd physx && $(MAKE) clean
