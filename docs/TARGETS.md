# Target machine profiles

EduAmigaC-Game uses explicit machine profiles so examples do not silently acquire higher hardware requirements.

## P0 — Classic baseline

The primary teaching baseline.

- Motorola 68000
- OCS/ECS-compatible design
- 1 MiB total memory target where practical
- PAL as the primary timing/reference environment
- NTSC behaviour must be considered and documented
- no FPU requirement
- no accelerator requirement
- no RTG requirement
- no AHI requirement

This profile is intentionally constrained. It teaches the realities that shaped classic Amiga game design.

Individual examples may require more memory when the lesson explicitly concerns larger assets or systems. Such exceptions must be labelled.

## P1 — Comfortable classic development target

A less restrictive profile for larger course projects and productive development.

- 68000 or later compatible 68k CPU
- 2 MiB or more memory
- OCS/ECS-compatible graphics unless otherwise stated
- Fast RAM may be used, but Chip RAM requirements must remain explicit

A project targeting P1 must not be presented as P0-compatible unless it has been tested as such.

## P2 — 020+ enhanced target

For lessons that deliberately use later CPUs or need more headroom.

- 68020 or later
- additional Fast RAM expected
- no FPU unless explicitly required
- OCS/ECS or AGA depending on the lesson

020-specific optimisation must be kept separate from the 68000 teaching path.

## P3 — AGA target

For AGA-specific material.

- AGA chipset
- normally 68020+
- additional memory as documented by the project

AGA features must never silently leak into P0/P1 examples.

## Timing policy

Examples should avoid tying gameplay speed directly to an assumed PAL frame rate.

PAL is the primary course reference because it is historically important and convenient for the target material, but NTSC differences must be explained where relevant.

Lessons involving raster timing, Copper effects or other display-frequency-sensitive behaviour must state their assumptions explicitly.

## Memory policy

Every substantial example should document:

- minimum Chip RAM;
- minimum total RAM;
- whether Fast RAM is optional or required;
- important asset-memory costs.

Students should learn why data must sometimes reside in Chip RAM and why moving suitable data/code pressure to Fast RAM matters on expanded machines.

## CPU policy

Portable teaching code targets the 68000 unless a chapter is explicitly marked otherwise.

Do not introduce 68020+ instructions or assumptions into baseline examples merely because an emulator or cross-compiler makes them convenient.

Optimised variants may be supplied beside the portable baseline.

## Framework and engine profiles

ACE and Sevgi Engine examples must declare their real minimum requirements.

The course does not claim that every framework/engine example can run on P0 merely because the equivalent plain-C lesson can.

If ACE or Sevgi Engine imposes a different practical baseline, document that fact in the parity matrix.

## Emulator profiles

Automated and reproducible tests should use named emulator configurations corresponding to the hardware profiles.

At minimum, qualification should eventually include:

- a P0-style 68000 OCS/ECS configuration;
- a larger-memory classic configuration;
- a 68020+ configuration;
- an AGA configuration for AGA-specific lessons.

Emulation is a development and qualification tool, not an excuse to ignore real-machine constraints.

## Per-project declaration

Each project should contain a short target declaration, for example:

```text
Target: P0
CPU: 68000
Chipset: OCS/ECS
Chip RAM: 512 KiB minimum
Total RAM: 1 MiB minimum
PAL: tested
NTSC: tested
```

Measured requirements replace estimates as projects mature.
