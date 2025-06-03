#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

./configure --disable-debug \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --prefix=${PREFIX} \
    --libdir=${PREFIX}/lib

if [[ ${CONDA_BUILD_CROSS_COMPILATION:-0} == 1 ]]; then
    make -j${CPU_COUNT} check
fi
make -j${CPU_COUNT} install
