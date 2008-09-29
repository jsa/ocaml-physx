
include config/Makefile Makefile.rules

defaultentry:
	@echo "hint: make all"

all: glut physx

install:: partialinstall

clean:: partialclean

# OpenGL bindings
glut:
	cd glut && $(MAKE) all

partialinstall::
	cd glut && $(MAKE) install

partialclean::
	cd glut && $(MAKE) clean

# PhysX
physx:
	cd physx && $(MAKE) all

partialinstall::
	cd physx && $(MAKE) install

partialclean::
	cd physx && $(MAKE) clean
