#!/bin/sh
set -eu

lock=${1:-/tmp/toolchain-components.lock}
root=${2:-/build/m68k-amigaos-gcc/projects}

while IFS="$(printf '\t')" read -r component expected; do
  case "$component" in ""|"#"*) continue;; esac

  dir="$root/$component"
  test -d "$dir/.git" || {
    echo "missing component: $component" >&2
    exit 10
  }

  # make update initially follows the wrapper's declared branch. Convert that
  # moving checkout into the immutable course state before building.
  git -C "$dir" cat-file -e "$expected^{commit}" 2>/dev/null || \
    git -C "$dir" fetch --depth=1 origin "$expected"
  git -C "$dir" checkout --detach "$expected"

  actual=$(git -C "$dir" rev-parse HEAD)
  test "$actual" = "$expected" || {
    echo "component lock failure: $component expected=$expected actual=$actual" >&2
    exit 11
  }
done < "$lock"

echo "Toolchain components checked out and verified at locked revisions."
