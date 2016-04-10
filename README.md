# Docker containers to build and run DynomiteDB

A suite of Docker containers used to build and run the various DynomiteDB components in production.

The build process of compiling sofware is separate from the containers used to run each component.

All build containers are prefixed with `build-`.

Production containers are named after the component, for example the Redis container is tagged `DynomiteDB/redis`.

# Use of layers

The DynomiteDB Docker are designed to make good use of Dockers Union file systems (aka UnionFS).

# Why separate build containers

DynomiteDB uses separate build containers to minimize the size of and to simplify production containers. 
