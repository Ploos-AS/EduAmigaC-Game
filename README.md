# EduAmigaC-Game

Practical Amiga game programming in C — with **plain Amiga C**, **ACE**, and **Sevgi Engine**.

EduAmigaC-Game is part of the Ploos AS educational series. It assumes basic C knowledge and builds naturally on EduC and EduAmigaC.

## Goals

By the end of the course, the reader should be able to:

- understand the structure of a real Amiga game loop;
- work with graphics, sprites, blitter operations, input, timing and sound from C;
- understand double buffering and frame pacing;
- design simple tile, actor and collision systems;
- manage memory and resources under AmigaOS;
- build small games directly with Amiga APIs and documented hardware facilities;
- build equivalent games with the ACE framework;
- understand what ACE abstracts away and when direct programming is useful;
- profile and optimise games for classic 68k Amiga systems;
- package and test games using the Ploos Amiga development/runtime infrastructure.

## Teaching model

The course deliberately uses two tracks:

1. **Direct C track** — build the game systems yourself using AmigaOS APIs and documented Amiga hardware facilities.
2. **ACE track** — solve the same kinds of problems using ACE.

Where useful, chapters end with a comparison showing the direct implementation beside the ACE implementation.

The goal is not to present one approach as universally better. The reader should understand both the machine and the framework.

## Planned course structure

### Part I — Foundations

1. Setting up the toolchain
2. Anatomy of an Amiga game
3. The main loop
4. Timing, PAL/NTSC and frame pacing
5. Keyboard, mouse and joystick input
6. Memory, chip memory and fast memory
7. Loading and managing game assets

### Part II — Graphics without ACE

8. Screens, bitplanes and display basics
9. Double buffering
10. Hardware sprites
11. The blitter
12. BOB-style moving objects
13. Tiles and scrolling maps
14. Palette handling and colour effects
15. Copper basics for games
16. Text, HUDs and score displays

### Part III — Game systems

17. Actors and entities
18. Movement and acceleration
19. Bounding-box and tile collision
20. Animation systems
21. Cameras and scrolling
22. Game states and scene transitions
23. Level data and loaders
24. Object pools and fixed-size allocation
25. Saving settings and high scores

### Part IV — Sound

26. Paula fundamentals
27. Samples and sound effects
28. Music playback
29. Mixing game audio concerns
30. Synchronising audio and gameplay

### Part V — Building a complete game without ACE

31. Game design and technical constraints
32. Prototype
33. Player controller
34. Enemies and hazards
35. Level system
36. HUD and menus
37. Sound and music
38. Polish and optimisation
39. Packaging and release build

### Part VI — ACE

40. Introducing ACE
41. ACE project structure
42. Display and buffers with ACE
43. Input with ACE
44. Blitter and object handling with ACE
45. Tiles and scrolling with ACE
46. ACE game states
47. Audio integration
48. Rebuilding the course game with ACE
49. Direct C versus ACE: architecture comparison
50. Extending ACE where necessary

### Part VII — Advanced Amiga game programming

51. Performance measurement
52. 68000-friendly C
53. Data-oriented layouts
54. Reducing chip-memory pressure
55. Blitter/CPU scheduling
56. Copper-driven effects
57. Parallax and raster effects
58. Large scrolling worlds
59. ECS-style designs on constrained systems
60. Debugging difficult game bugs

### Part VIII — Capstone projects

The course should contain several increasingly complete projects, for example:

- Breakout-style game
- top-down action game
- scrolling platform game
- shoot-'em-up
- final original game project

Each larger project should have **plain Amiga C**, **ACE**, and **Sevgi Engine** paths where technically practical. The three versions should be used to compare architecture, amount of code, control, portability, performance and abstraction.

## Target baseline

Initial baseline:

- classic 68k Amiga;
- C as the primary implementation language;
- AmigaOS development environment;
- PAL-first examples, with NTSC considerations explained;
- emulator-based deterministic testing where practical.

The exact minimum machine profile will be documented as the course implementation matures.

## Relationship to other Ploos courses

- **EduC** teaches general C.
- **EduAmigaC** teaches systems programming in C on Amiga.
- **EduAmigaC-Game** applies that knowledge specifically to game programming.

The course may reference material from the other courses instead of duplicating complete explanations.

## Publishing

Course material is intended to be single-source Markdown and published through the Ploos publishing pipeline to web and book formats.

Documentation/course material: **CC BY 4.0** unless otherwise noted.

Example software: **MIT** unless otherwise noted.

Third-party components such as ACE and Sevgi Engine retain their own licenses.

## Status

**M0 — repository bootstrap and curriculum definition.**
