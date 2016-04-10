# Build Dynomite

Compiling Dynomite has two discrete steps:

1. Build the `build-dynomite` Docker image
2. Compile Dynomite

The `build-dynomite` Docker image is a clean, reusable build environment for Dynomite.

The `build-dynomite` Docker container is used to compile Dynomite.

Optionally, the `dynomite` Docker image is used to run Dynomite inside a container. Importantly, it is recommended that you run Dynomite via the `.deb` packages for production use.

# Build `build-dynomite` image

The `build-dynomite` Docker image is used to compile `dynomite`.

First you must `cd` into the `build-dynomite` directory.

```bash
cd build-dynomite
```

Create the `build-dynomite` image.

```bash
docker build -t dynomitedb/build-dynomite .
```

# Compile `dynomite` binary

Run the `build-dynomite` container to compile the `dynomite` binary.

Clone and then `cd` into the `dynomite` git repo.

```bash
mkdir -p ~/repos/

git clone https://github.com/Netflix/dynomite.git

cd ~/repos/dynomite

# Optionally, you can select a specific tag to build
git checkout tags/v0.5.7
```

Build `dynomite`.

```bash
docker run -it --rm -v $PWD:/src dynomitedb/build-dynomite
```

Create a debug build.

```bash
docker run -it --rm -v $PWD:/src dynomitedb/build-dynomite -d
```

Clean the build. 

```bash
docker run -it --rm -v $PWD:/src dynomitedb/build-dynomite -t clean
```

