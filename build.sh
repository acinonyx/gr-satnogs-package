#!/bin/sh

DEBIAN_DIR="/tmp/debian"
WORKING_DIR="/tmp/dpkg"

# Change to working directory
cd "$WORKING_DIR"

# Get original source code
"$DEBIAN_DIR"/rules get-orig-source

# Untar original source code
tar -xvf gr-satnogs*.orig.tar.xz

# Copy debian packaging directory
cp -R "$DEBIAN_DIR" gr-satnogs*/

# Build package
cd gr-satnogs*/
dpkg-buildpackage -us -uc -j$(nproc)
