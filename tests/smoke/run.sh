#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

echo "== toolchain =="
command -v m68k-amigaos-gcc
m68k-amigaos-gcc --version | head -n 1

echo "== plain C =="
make -C "$ROOT/tests/smoke/plain" clean all
file "$ROOT/tests/smoke/plain/hello"
file "$ROOT/tests/smoke/plain/hello" | grep -qi "Amiga" || {
  echo "ERROR: plain smoke output is not recognized as an Amiga binary." >&2
  exit 20
}

echo "== ACE =="
rm -rf "$ROOT/tests/smoke/ace/build"
cmake -S "$ROOT/tests/smoke/ace" -B "$ROOT/tests/smoke/ace/build" \
  -DCMAKE_TOOLCHAIN_FILE=/opt/course/deps/cmake-toolchains/m68k.cmake \
  -DM68K_TOOLCHAIN_PATH=/opt/amiga \
  -DM68K_CPU=68000 \
  -DM68K_FPU=soft
cmake --build "$ROOT/tests/smoke/ace/build" --parallel

echo "== Sevgi Engine =="
test -d /opt/course/deps/sevgi
test -f /opt/course/deps/sevgi/README.md
test -f /opt/course/deps/sevgi/Makefile
echo "Sevgi source/templates present; native Sevgi Editor execution is an Amiga-side test."

echo "Smoke tests passed."
