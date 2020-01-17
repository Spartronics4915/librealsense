#!/bin/sh

echo "Cross compiling libusb using GNU autotools... (args: $1 $2 $3)"

./autogen.sh

BINARY_PREFIX="$1"

export CC="$BINARY_PREFIX-gcc"
export CXX="$BINARY_PREFIX-g++"
export AR="$BINARY_PREFIX-ar"
export LD="$BINARY_PREFIX-ld"
export OBJCOPY="$BINARY_PREFIX-objcopy"
export OBJDUMP="$BINARY_PREFIX-objdump"
export SIZE="$BINARY_PREFIX-size"
export NM="$BINARY_PREFIX-nm"

./configure --host="$2" --prefix="$3/" --disable-udev

make -j8
make install
