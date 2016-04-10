# DynomiteDB Docker containers

A suite of Docker containers used to build and run the various DynomiteDB components in production.

The containers in this repo are split into two categories:

- Build containers: Prefixed with `build-`
- Production containers: Named after a component, such as `DynomiteDB/redis`

# Use of layers

The DynomiteDB Docker are designed to make good use of Dockers Union file systems (aka UnionFS).

# Why separate build containers

DynomiteDB uses separate build containers to minimize the size of and to simplify production containers. 
