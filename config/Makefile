#PHYSX_INCLUDE="-I${PHYSX_HOME}/Graphics/include -I${PHYSX_HOME}/Graphics/include/win32 -I${PHYSX_HOME}/LowLevel/API/include -I${PHYSX_HOME}/LowLevel/hlcommon/include -I${PHYSX_HOME}/SDKs/Cooking/include -I${PHYSX_HOME}/SDKs/NxCharacter/include -I${PHYSX_HOME}/Tools/CookedMesh/Reader/include -I${PHYSX_HOME}/Tools/NxuStream2 -I${PHYSX_HOME}/Tools/SoftBody"

OCAMLOPT=ocamlopt
COMPFLAGS=-ccopt $(CCOPT)
LINKFLAGS=
DEPFLAGS=$(INCLUDES)
CCOPT="-w $(INCLUDES) -DNX_CALL_CONV=\"\" -DNX32 -DLINUX \"-DNX_C_EXPORT=extern \\\"C\\\"\" -DNXP_DLL_EXPORT=\"\" -DNXF_DLL_EXPORT=\"\" -xc++"

INCLUDES=

SWIG=swig
SWIG_FLAGS=-ocaml -c++ -w301 -Werror
SWIG_DEFINES=-DNX_CALL_CONV=""
SWIGCO=swig -ocaml -co
