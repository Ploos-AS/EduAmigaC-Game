#!/bin/sh
set -eu

root=${1:-$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)}
lock="$root/container/dependencies.lock.toml"

echo "EduAmigaC-Game student environment check"

test -f "$lock" || {
  echo "ERROR: dependency lock not found: $lock" >&2
  exit 2
}

if grep -q 'UNRESOLVED' "$lock"; then
  echo "ERROR: dependency lock contains UNRESOLVED entries." >&2
  exit 3
fi

for tool in m68k-amigaos-gcc cmake git make; do
  command -v "$tool" >/dev/null 2>&1 || {
    echo "ERROR: missing required tool: $tool" >&2
    exit 4
  }
done

test -d /opt/course/deps/ace || { echo "ERROR: ACE is missing." >&2; exit 5; }
test -d /opt/course/deps/cmake-toolchains || { echo "ERROR: Amiga CMake toolchains are missing." >&2; exit 5; }
test -d /opt/course/deps/sevgi || { echo "ERROR: Sevgi Engine is missing." >&2; exit 5; }

echo "Student environment is ready."
m68k-amigaos-gcc --version | head -n 1
