#!/bin/sh
set -eu
lock=${1:-/tmp/toolchain-components.lock}
root=${2:-/build/m68k-amigaos-gcc/projects}
while IFS="$(printf '\t')" read -r component expected; do
  case "$component" in ""|"#"*) continue;; esac
  dir="$root/$component"
  test -d "$dir/.git" || { echo "missing component: $component" >&2; exit 10; }
  actual=$(git -C "$dir" rev-parse HEAD)
  test "$actual" = "$expected" || {
    echo "component drift: $component expected=$expected actual=$actual" >&2
    exit 11
  }
done < "$lock"
echo "Toolchain component lock verified."
