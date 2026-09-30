# Student OCI policy

Each C course provides its own public student development OCI image.

## Base

Use **Debian slim/minimal** as the default base for the C-course family.

This is intentional: the courses should teach C and target-platform concepts without introducing musl/Alpine-specific differences unless those differences are themselves the subject of a lesson.

## Requirements

The student image must:

- contain only public, redistributable course/toolchain dependencies;
- require no access to internal Ploos infrastructure;
- use documented and reproducible tool versions;
- support the same command-line build workflow documented for local installations;
- be versioned with course releases;
- publish immutable digests for release images;
- run as a non-root user for normal course work;
- keep the image understandable enough that students can inspect how their environment is assembled.

Internal Ploos CI may use additional infrastructure to build or qualify the course, but student instructions must not depend on it.

## Course independence

Images are course-specific. Shared conventions are encouraged, but a student taking one course should not have to clone or understand another Ploos repository merely to obtain the toolchain.

## Local path

OCI is the easiest reproducible path, not the only supported path. Each course should also document the equivalent local toolchain installation at an appropriate level.

## Image contents

Keep runtime and development dependencies intentional. Do not turn the image into a general-purpose workstation.

Prefer Debian packages where suitable. Pin external toolchains or source-built dependencies when distribution packages cannot provide the required target or version.
