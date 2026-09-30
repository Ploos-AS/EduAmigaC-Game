# Curriculum

## Course promise

EduAmigaC-Game teaches game programming on classic Amiga systems in C through three first-class implementation tracks:

- **Plain Amiga C** — no game framework.
- **ACE** — game programming using ACE.
- **Sevgi Engine** — game programming using Sevgi Engine.

The tracks teach the same underlying game-programming concepts. They are not three unrelated courses.

## Learning progression

### Stage 1 — Understand the machine

The student learns the game loop, timing, memory, input, bitplanes, sprites, blitter operations, audio and resource handling.

Plain Amiga C is especially important here because abstractions must not hide the machine before the student understands it.

### Stage 2 — Build reusable game systems

The student implements movement, animation, collisions, actors, maps, cameras, states, menus, HUDs and asset handling.

### Stage 3 — Compare abstractions

Representative exercises are implemented in all three tracks.

For each comparison, explain:

- what code the framework or engine removes;
- what control is retained or lost;
- memory implications;
- performance implications;
- portability and maintainability;
- when the abstraction is useful.

### Stage 4 — Complete games

The student builds increasingly substantial games and learns the complete workflow from prototype to release.

### Stage 5 — Optimise and extend

Advanced material covers profiling, 68000-friendly C, chip-memory pressure, CPU/blitter scheduling, Copper effects, scrolling techniques and extension of frameworks/engines.

## Common lesson pattern

Where applicable, a lesson follows:

1. **Concept** — what problem are we solving?
2. **Amiga model** — what happens on the machine?
3. **Plain C** — implement it directly.
4. **ACE** — implement it with ACE.
5. **Sevgi Engine** — implement it with Sevgi Engine.
6. **Compare** — inspect code, architecture, memory and performance.
7. **Experiment** — modify parameters or implementation.
8. **Challenge** — solve a related problem independently.
9. **Think** — explain why the solution works.

Not every low-level topic needs artificial ACE or Sevgi code. Conversely, engine-specific features may not have a meaningful one-to-one plain-C equivalent. Comparisons should be technically useful rather than forced.

## Project ladder

### Project 0 — Moving object

A minimal interactive object with timing and input.

### Project 1 — Pong/Breakout class

Introduces a complete loop, collision, score, sound and game states.

### Project 2 — Top-down action

Introduces multiple actors, maps, camera, animation and simple AI.

### Project 3 — Scrolling platform game

Introduces scrolling worlds, tile collision, animation and tighter performance constraints.

### Project 4 — Shoot-'em-up

Introduces many active objects, object pools, patterns, effects and aggressive optimisation.

### Capstone — Original game

The student designs and completes an original Amiga game and documents technical decisions.

## Track parity

Maintain a parity matrix for major lessons and projects.

Parity means equivalent learning goals, not necessarily identical APIs or source structure.

A missing implementation must be explicit and documented rather than silently omitted.
