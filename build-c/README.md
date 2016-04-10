# C build image

The image in this directory is used to build C/C++ applications with gcc.

All DynomiteDB components written in C/C++ are compiled with this image. 

The list of dependencies across all C/C++ components is currently small enough that a single `build-c` container is easier to manage than multiple specialized containers. If the list of build dependencies grows significantly, then we may consider splitting this Docker image multiple specialized containers.
