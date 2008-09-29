include config/Makefile

defaultentry:
	@echo "hint: make all"

all: glut physx

clean:: partialclean

# OpenGL bindings

glut:
	cd glut; $(MAKE) all

partialclean::
	cd glut; $(MAKE) clean

# PhysX

physx:
	cd physx; $(MAKE) all

partialclean::
	cd physx; $(MAKE) clean
