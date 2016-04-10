#!/bin/bash
set -e

#
# Build with debug: -d
# Add a target to make: -t <target>
#

# Reset getopts option index
OPTIND=1

# Additional make target
target=""
# If the -d flag is set then create a debug build of dynomite
mode="production"

while getopts "dt:" opt; do
    case "$opt" in
    d)  mode="debug"
        ;;
    t)  target=$OPTARG
        ;;
    esac
done

if [ "$target" == "clean" ] ; then
    make clean
    exit 0;
fi

# Build dynomite

autoreconf -fvi

if [ "$mode" == "debug" ] ; then
    CFLAGS="-ggdb3 -O0" ./configure --enable-debug=full
elif [ "$mode" == "log" ] ; then
    ./configure --enable-debug=log
else
    ./configure --enable-debug=no
fi

# Default target == ""
make $target

# TODO: Create a `make package` target in the upstream repo

# Cleanup prior builds
rm -f /src/dynomitedb-dynomite_ubuntu-14.04.4-x64.tar.gz
rm -rf /src/dynomitedb-package
rm -rf /src/dynomitedb-dynomite

# Create package
mkdir -p /src/dynomitedb-package

# Binaries
for b in "dynomite" "dynomite-test"
do
	cp /src/src/$b /src/dynomitedb-package/
	if [ "$mode" == "production" ] ; then
		cp /src/src/$b /src/dynomitedb-package/${b}-debug
		strip --strip-debug --strip-unneeded /src/dynomitedb-package/$b
	fi
done

cp /src/src/tools/dynomite-hash-tool /src/dynomitedb-package/
if [ "$mode" == "production" ] ; then
	cp /src/dynomitedb-package/dynomite-hash-tool /src/dynomitedb-package/dynomite-hash-tool-debug
	strip --strip-debug --strip-unneeded  /src/dynomitedb-package/dynomite-hash-tool
fi

# Static files
for s in "README.md" "LICENSE" "NOTICE"
do
	cp /src/$s /src/dynomitedb-package/
done

# Configuration files
cp -R /src/conf /src/dynomitedb-package/

mv /src/dynomitedb-package /src/dynomitedb-dynomite
tar -czf dynomitedb-dynomite_ubuntu-14.04.4-x64.tar.gz -C /src dynomitedb-dynomite/

# Cleanup
#rm -rf /src/dynomitedb-dynomite/
