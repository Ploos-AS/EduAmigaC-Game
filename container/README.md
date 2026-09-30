# Student development container

This directory contains the student-facing OCI environment for EduAmigaC-Game.

The image is based on Debian slim/minimal and is independent of internal Ploos development infrastructure.

## Status

The container skeleton is established in M0.

Before it is declared usable, the course will add and pin:

- Bebbo Amiga GCC cross-toolchain;
- required Amiga headers/libraries;
- ACE for the ACE track;
- Sevgi Engine for the Sevgi track;
- course asset conversion tools.

Dependencies must be public and reproducible.

## Build

```sh
docker build -f Containerfile -t eduamigac-game:dev .
```

or with a compatible OCI builder.

## Interactive use

```sh
docker run --rm -it -v "$PWD:/workspace" eduamigac-game:dev
```

The final course documentation will provide equivalent Podman commands and a local-install path.
