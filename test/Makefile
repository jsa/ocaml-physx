
include ../config/Makefile ../Makefile.rules

TARGET=nxsdktest
INCLUDES=\
	../lib
CCINCLUDES=\
	/usr/lib/libglut.so.3 \
	/usr/lib/PhysX/v2.8.1/libPhysXCore.so.1 \
	/usr/lib/PhysX/v2.8.1/libNxCooking.so.1 \
	/usr/lib/PhysX/v2.8.1/libNxCharacter.so.1 \
	/lib/libpthread-2.8.so
OBJ=\
	../lib/swig.cmxa \
	../lib/glut.cmxa \
	../lib/*.cxx.o
VER=0.1

all: $(TARGET).out

install:

clean:
	rm -f *.a *.o *.cxx *.c *.cm* *.out
