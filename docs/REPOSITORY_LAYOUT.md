# Repository layout

EduAmigaC-Game keeps the three course tracks parallel without pretending that
their APIs or implementation details are identical.

## Top-level layout

```text
lessons/
  NN-topic/
    README.md
    plain/
    ace/
    sevgi/
projects/
  moving-object/
    plain/
    ace/
    sevgi/
  breakout/
    plain/
    ace/
    sevgi/
assets/
  source/
  generated/
tests/
  host/
  smoke/
    plain/
    ace/
    sevgi/
docs/
container/
```

Directories are created when they gain real content; empty scaffolding is not
required.

## Lessons

Each lesson owns its explanation in `lessons/NN-topic/README.md`. Track
directories contain only the implementation and track-specific notes needed by
that lesson.

The normal teaching order is:

1. concept and Amiga model;
2. plain C implementation;
3. ACE implementation where meaningful;
4. Sevgi Engine implementation where meaningful;
5. comparison, experiment, challenge and reflection.

A track directory may be absent when an equivalent implementation would be
artificial or pedagogically misleading. The lesson README must explain why.

## Projects

Larger projects use the same `plain/`, `ace/`, and `sevgi/` names.
Equivalent gameplay and learning goals matter more than identical source-tree
shape.

Shared source code between tracks should be exceptional. Sharing assets and
test vectors is encouraged; sharing implementation code that hides the
differences being taught is not.

## Assets

Editable originals belong in `assets/source/`. Generated game-ready assets
belong in `assets/generated/` only when they are intentionally versioned.
Build products never belong in either directory.

A project may have its own asset subtree when that makes ownership clearer.

## Tests

`tests/host/` is for logic that can be validated without an Amiga runtime.
`tests/smoke/` proves that each track can build in the public student
environment. Emulator/runtime qualification is a separate layer.

## Build output

Generated binaries, object files, CMake build trees and temporary converted
assets must stay outside tracked source directories or be ignored. Examples
must remain readable before and after a build.

## Naming

Use lowercase directory names and hyphens for multi-word names. The canonical
track names in paths are always `plain`, `ace`, and `sevgi`.
