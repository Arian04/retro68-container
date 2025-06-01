#!/bin/sh

SRC_PATH="${1:?}"
BUILD_PATH="${2:?}"

RETRO68_CMAKE_TOOLCHAIN_PATH="/Retro68-build/toolchain/m68k-apple-macos/cmake/retro68.toolchain.cmake"

RETRO68_BUILD_DIR="/Retro68-build"

# Link universal libs if necessary
if [ ! "$(ls -A $RETRO68_BUILD_DIR/toolchain/universal/RIncludes 2>/dev/null)" ]; then
	"$RETRO68_BUILD_DIR/bin/interfaces-and-libraries.sh" "$RETRO68_BUILD_DIR/toolchain/" "$RETRO68_BUILD_DIR/InterfacesAndLibraries/" >/dev/null
fi

cd "$BUILD_PATH" || exit
rm -rf -- ./.*
rm -rf -- ./*

cmake "$SRC_PATH/" -DCMAKE_TOOLCHAIN_FILE="${RETRO68_CMAKE_TOOLCHAIN_PATH}" &&
	make
