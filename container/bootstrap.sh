#!/bin/sh
set -eu

echo "EduAmigaC-Game student toolchain bootstrap"
echo
echo "M0 intentionally refuses to fetch unpinned dependencies."
echo "Resolve every UNRESOLVED entry in container/dependencies.lock.toml first."
echo
if grep -q 'UNRESOLVED' /course/container/dependencies.lock.toml 2>/dev/null; then
  echo "ERROR: dependency lock is not release-ready." >&2
  exit 2
fi

echo "Dependency lock resolved; installation steps will be enabled in the next bootstrap revision."
exit 3
