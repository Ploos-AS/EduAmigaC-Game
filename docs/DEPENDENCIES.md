# Dependency management

The student OCI must be reproducible and must not depend on moving upstream branches.

The authoritative dependency declaration is `container/dependencies.lock.toml`.

## Rules

- A release may not contain `UNRESOLVED` dependency entries.
- Git dependencies use immutable commit revisions for the build.
- Friendly version/tag names may be recorded in release notes in addition to the immutable revision.
- The OCI image itself is published with a version tag and immutable digest.
- Updating ACE, Sevgi Engine or the Amiga toolchain is a deliberate course maintenance change, not an implicit rebuild side effect.
- No student dependency may require access to private/internal Ploos infrastructure.

## ACE

ACE is treated as an explicit course dependency for the ACE track. Upstream recommends project-pinned usage because development changes can break consumers.

## Sevgi Engine

The canonical upstream source must be identified before it is added to the image. Do not substitute a similarly named project.

## Toolchain

The course uses the Bebbo-family `m68k-amigaos-gcc` toolchain. The maintained source and exact immutable revision must be selected and tested before M1.

## Fail closed

The M0 bootstrap intentionally fails while pins remain unresolved. A container that silently downloads today's HEAD would look convenient but would make old lessons unreproducible.
