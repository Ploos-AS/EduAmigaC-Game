# Toolchain and runtime

## Principle

EduAmigaC-Game must have a reproducible reference environment without hiding the actual Amiga development toolchain from the student.

Ploos **amiga-dev** is the reference build environment.

Ploos **amiga-runtime** is the reference emulator/runtime qualification environment.

They are infrastructure, not part of the game-programming API. Course source code must not depend on a Ploos-only runtime library merely to build or run.

## Compiler baseline

The reference C toolchain is the Bebbo Amiga GCC toolchain as provided and qualified by amiga-dev.

The exact compiler and binutils versions used for releases should be pinned by the infrastructure rather than copied into every lesson.

Baseline examples must remain compatible with the CPU profile declared by the lesson or project.

For P0 this means 68000-compatible output.

## Build system

Examples should be buildable from the command line.

Initial convention:

- GNU Make for small teaching examples and projects;
- explicit, readable compiler/linker flags;
- no IDE required;
- generated build files should not obscure the commands students are learning.

A later helper layer may reduce repetition, but every important build step must remain inspectable.

## Three track dependencies

### Plain Amiga C

Required:

- Amiga C compiler/toolchain;
- Amiga headers/libraries supplied by the development environment;
- course-owned source and assets.

No ACE or Sevgi Engine dependency is permitted.

### ACE

Required:

- the common Amiga C toolchain;
- ACE;
- any explicitly documented ACE build dependencies.

ACE version/revision must be pinned for reproducible course releases.

### Sevgi Engine

Required:

- the common Amiga C toolchain;
- Sevgi Engine;
- any explicitly documented Sevgi build dependencies.

Sevgi Engine version/revision must be pinned for reproducible course releases.

## Dependency rule

Third-party dependencies must be:

1. declared;
2. versioned or revision-pinned for releases;
3. licensed compatibly with redistribution/use in the course workflow;
4. documented with their upstream source;
5. kept out of the repository when vendoring would be inappropriate.

Do not silently download arbitrary moving branches during a release build.

## Local development

A student should ultimately have two supported ways to work:

### Reference/container workflow

Use amiga-dev to obtain the known-good toolchain and build environment.

This is the preferred path for CI, course validation and reproducibility.

### Native/local workflow

Install the documented toolchain locally and run the same project build commands.

The course should document this path so students understand that Docker/OCI is convenience and reproducibility infrastructure, not a requirement of Amiga C itself.

## Runtime qualification

amiga-runtime provides the reproducible emulator side of the course.

Course projects should be runnable through named profiles matching docs/TARGETS.md.

The runtime layer should eventually support automated launch, timeout, log/evidence capture and deterministic checks where the program permits them.

Interactive games cannot be fully validated by unit tests. CI should therefore combine:

- host-side tests for portable logic where useful;
- compile/link validation;
- emulator smoke tests;
- deterministic scripted checks where practical;
- explicit manual play-test requirements for releases.

## Emulator policy

FS-UAE is a reference emulator where supported by amiga-runtime.

Additional qualified emulators may be used to detect emulator-specific assumptions.

A lesson must not teach behaviour that works only because one emulator is permissive.

## Assets

Source assets should be kept separately from generated Amiga-ready assets.

Asset conversion must be reproducible from command-line tools where practical.

Generated assets should have a documented provenance and build step.

The course should prefer open formats for source material.

## Debugging

The curriculum should teach debugging at several levels:

- compiler warnings;
- assertions and diagnostic output;
- emulator logs;
- inspection of game state;
- memory/resource lifetime;
- hardware-facing timing bugs;
- performance measurement.

Debug/release configurations should be explicit rather than hidden behind IDE settings.

## Compiler warnings

Course-owned C should compile with a deliberately strict warning policy appropriate to the toolchain.

Warnings must not be routinely suppressed globally. A necessary suppression should be narrow and documented.

## Release reproducibility

A course release should record enough information to reproduce its examples:

- amiga-dev version/tag or immutable reference;
- amiga-runtime version/tag or immutable reference;
- ACE revision used;
- Sevgi Engine revision used;
- project target profile;
- build flags relevant to CPU/chipset;
- asset conversion tool versions where significant.

## Independence

The course repository owns:

- lessons;
- exercises;
- example/game source;
- course-specific build descriptions;
- course assets.

amiga-dev owns reusable development-environment/toolchain infrastructure.

amiga-runtime owns reusable emulator/runtime qualification infrastructure.

Do not copy large pieces of those infrastructure repositories into the course.
