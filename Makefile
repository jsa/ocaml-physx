
include config/Makefile

#swig -ocaml ${PHYSX_INCLUDE} -DNX_CALL_CONV -w301 -Werror -outdir _build -c++ physx/PhysXLoader.i
#$(SWIG)

defaultentry:
	@echo "Jorma"

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

#rm -f _build/* physx/*.c*

#swig -ocaml ${PHYSX_INCLUDE} -DNX_CALL_CONV -w301 -Werror -outdir _build -c++ physx/PhysXLoader.i

#cp physx/PhysXLoader_wrap.cxx physx/PhysXLoader_wrap.cxx.c

#cd _build

#ocamlopt -ccopt "-w ${PHYSX_INCLUDE} -DNX_CALL_CONV=\"\" -DNX32 -DLINUX \"-DNX_C_EXPORT=extern \\\"C\\\"\" -DNXP_DLL_EXPORT=\"\" -DNXF_DLL_EXPORT=\"\" -xc++" ../physx/PhysXLoader_wrap.cxx.c

#swig -ocaml -co swig.mli
#swig -ocaml -co swig.ml

#ocamlopt -for-pack PhysX -c swig.mli
#ocamlopt -for-pack PhysX -c swig.ml

#ocamlopt -for-pack PhysX -c PhysXLoader.mli
#ocamlopt -for-pack PhysX -c PhysXLoader.ml

#ocamlopt -pack -o PhysX.cmx PhysXLoader.cmx

#cd ..
