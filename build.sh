#!/bin/sh

# Get original source code
debian/rules get-orig-source

# Untar original source code
tar -xvf gr-satnogs*.orig.tar.xz

# Copy debian packaging directory
cp -R debian gr-satnogs*/

# Build package
cd gr-satnogs*/
dpkg-buildpackage -us -uc
