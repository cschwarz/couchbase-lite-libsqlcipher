#!/bin/bash

set -e

# Output directory:
OUTPUT_DIR="`pwd`/libs/linux"

# Clean output directory:
if [ -d $OUTPUT_DIR ]; then
    rm -rf $OUTPUT_DIR
fi
mkdir $OUTPUT_DIR

# Clean build directory:
rm -rf build

# Build:
./gradlew build

# Copy binaries:
cd build/libs
jar xf couchbase-lite-libsqlcipher.jar libs
cp -r libs/* $OUTPUT_DIR

# Finished:
cd ../../
rm -rf build
