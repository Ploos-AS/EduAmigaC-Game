# Track parity matrix

The three tracks are first-class, but parity means equivalent learning goals,
not identical APIs, source structure, or abstraction level.

| Learning goal | Plain C | ACE | Sevgi Engine |
| --- | --- | --- | --- |
| Program lifecycle and clean exit | Direct Amiga APIs | ACE lifecycle | Engine/application lifecycle |
| Main game loop | Explicit loop | ACE-managed building blocks | Engine loop conventions |
| Frame timing | Direct timing primitives | ACE timing facilities | Engine timing model |
| Keyboard/joystick input | Direct input handling | ACE input managers | Engine input API |
| Moving object | Explicit state + rendering | ACE objects/managers | Engine actor/object model |
| Display setup | Direct chipset/OS setup | ACE display managers | Engine display configuration |
| Rendering | Direct drawing/blitter path | ACE rendering abstractions | Engine rendering path |
| Sprites/BOBs | Direct implementation | ACE facilities | Engine actors/sprites where supported |
| Animation | Explicit frames/state | ACE facilities | Engine animation model |
| Collision | Explicit logic | Course/ACE-level approach | Engine collision facilities where applicable |
| Tile maps | Explicit representation/rendering | ACE tile/map approach | Engine/editor map workflow |
| Scrolling/camera | Direct hardware/software model | ACE camera/scrolling | Engine camera/scrolling |
| Game states | Explicit state machine | Course architecture with ACE | Engine scene/state model where applicable |
| Audio | Direct Paula/player integration | ACE-supported integration | Engine/player integration |
| Asset pipeline | Explicit conversion/use | ACE-compatible pipeline | Sevgi Editor/import pipeline |
| Memory ownership | Fully explicit | Identify ACE ownership boundaries | Identify engine ownership boundaries |
| Chip/Fast RAM constraints | Directly managed | Observe/configure through ACE | Observe engine requirements/configuration |
| CPU/blitter trade-offs | Direct implementation | Inspect ACE choices | Inspect engine choices |
| Profiling/optimisation | Direct | Through/around ACE | Through/around engine |
| Extension work | Build own systems | Extend/replace ACE components | Extend engine/components |
| Complete course games | Required | Required | Required |

## Parity rules

1. Every major project must have a playable implementation in all three tracks
   unless a documented technical limitation makes that impossible.
2. The same project should preserve gameplay goals, controls and observable
   behaviour closely enough for meaningful comparison.
3. Track-specific architecture is encouraged. Copying the Plain C design into
   ACE or Sevgi merely to make files look alike defeats the purpose.
4. Low-level lessons may use Plain C as the executable implementation while ACE
   and Sevgi explain the corresponding abstraction boundary.
5. A missing implementation must be marked **not applicable** with a reason;
   it must never silently disappear.
6. Comparisons cover responsibilities, control, memory, performance,
   debuggability, build complexity and extensibility. Line count alone is not a
   quality measure.
7. No track is presented as the universally preferred approach. Students learn
   what each abstraction provides and costs.

## Milestone parity gates

### M1

All tracks must build and demonstrate lifecycle, loop, timing, input, a moving
object and clean exit.

### M2

All tracks must provide the same Pong/Breakout-class mini-game with rendering,
input, collision, score, states, basic sound, restart and exit.

### M3-M4

Core 2D, asset and audio learning goals must be represented in every track.
Implementation details may differ substantially.

### M5+

All three implementations of the substantial course game must be usable for
side-by-side architectural and performance analysis.
