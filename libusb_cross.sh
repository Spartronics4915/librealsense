#!/bin/sh

./autogen.sh

CROSS_COMPILE_PREFIX="/home/declan/.gradle/toolchains/frc/2019/roborio/bin/arm-frc2019-linux-gnueabi"

export CC=$CROSS_COMPILE_PREFIX-gcc
export CXX=$CROSS_COMPILE_PREFIX-g++
export AR=$CROSS_COMPILE_PREFIX-ar
export LD=$CROSS_COMPILE_PREFIX-ld
export OBJCOPY=$CROSS_COMPILE_PREFIX-objcopy
export OBJDUMP=$CROSS_COMPILE_PREFIX-objdump
export SIZE=$CROSS_COMPILE_PREFIX-size
export NM=$CROSS_COMPILE_PREFIX-nm

./configure --host="arm-frc2019-linux-gnueabi" --prefix="/home/declan/.gradle/toolchains/frc/2019/roborio/arm-frc2019-linux-gnueabi/" --disable-udev
