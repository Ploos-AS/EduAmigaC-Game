# Toolchain and runtime

## Principle

EduAmigaC-Game must have a reproducible reference environment without hiding the actual Amiga development toolchain from the student.

The **student environment is course-owned and independent of Ploos infrastructure**.

The course publishes a dedicated OCI development image containing the documented compiler, build tools and course dependencies. A student must be able to complete the course using that image or an equivalent local installation.

Ploos **amiga-dev** and **amiga-runtime** may be used internally for development, CI qualification and maintenance, but they are not student prerequisites and must not appear as required steps in the learning path.

Course source code must not depend on Ploos-only runtime libraries or private infrastructure merely to build or run.

## Compiler baseline

The reference C toolchain is the Bebbo Amiga GCC toolchain.

The student OCI image pins and publishes the exact compiler, binutils and supporting tool versions used by a course release.

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

### Course OCI workflow

Use the public EduAmigaC-Game course OCI image to obtain the known-good student toolchain and build environment.

This is the preferred student path and must work without access to amiga-dev, amiga-runtime or other Ploos infrastructure repositories.

### Native/local workflow

Install the documented toolchain locally and run the same project build commands.

The course should document this path so students understand that Docker/OCI is convenience and reproducibility infrastructure, not a requirement of Amiga C itself.

## Runtime qualification

The student workflow should document ordinary emulator use independently of amiga-runtime.

Internally, Ploos may additionally qualify course projects through amiga-runtime using named profiles matching docs/TARGETS.md.

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

- student OCI image tag and immutable digest;
- compiler/toolchain versions;
- internal amiga-dev/amiga-runtime qualification references when relevant to maintainers, but never as student prerequisites;
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

The course owns its **student OCI definition** and student-facing setup documentation.

amiga-dev and amiga-runtime own reusable internal development and qualification infrastructure.

Student documentation must remain usable without those Ploos infrastructure repositories. Do not copy their internals into the course; instead package the public upstream tools needed by students directly in the course OCI image.
