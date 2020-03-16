#!/usr/bin/env bash

NDK_VERSION="21.0.6113669"
MIN_SDK_VERSION="24"

function crossCompile() {
	TRIPLE=$1
	BUILD_DIR="build_$TRIPLE"

	mkdir $BUILD_DIR
	cd $BUILD_DIR

	cmake .. \
		-DCMAKE_TOOLCHAIN_FILE="~/Android/Sdk/ndk/$NDK_VERSION/build/cmake/android.toolchain.cmake" \
		-DANDROID_ABI=$TRIPLE -DANDROID_PLATFORM=$MIN_SDK_VERSION -DANDROID_STL="c++_shared" \
		-DBUILD_GRAPHICAL_EXAMPLES="false" -DBUILD_EXAMPLES="false" -DCMAKE_BUILD_TYPE="Release"
}

# We only build the ARM targets because people don't really run the FTC apps in the x86 emulators (at least I think they don't)
crossCompile "armeabi-v7a" &
crossCompile "arm64-v8a" &
