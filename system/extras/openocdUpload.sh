#!/bin/bash
OPENOCD_PATH="$1"

# replace slashes so the shell doesn't think they are excaped characters
BUILD_PATH="${2//\\//}"


if [ ! -f "${BUILD_PATH}/openocd.cfg" ]; then
    echo "Could not find ${BUILD_PATH}/openocd.cfg."
    exit 1
fi

# invoke openocd, using the default scripts directory from the openocd path, plus the additional scripts directory given,
# and finally all the other arguments passed to this script.
"${OPENOCD_PATH}/bin/openocd" -s "${OPENOCD_PATH}/openocd/scripts" -s "${BUILD_PATH}" -f openocd.cfg "${3//\\//}" "${4//\\//}"
