#!/usr/bin/env bash

TCHAIN_PATH="$(realpath ./tchain.cmake)"

mkdir build_cross
cd build_cross

cmake ../ -DCMAKE_TOOLCHAIN_FILE=$TCHAIN_PATH -DBUILD_EXAMPLES=False -DBUILD_GLSL_EXTENSIONS=False -DBUILD_UNIT_TESTS=False -DBUILD_WITH_TM2=True

make -j
