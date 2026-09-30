# Implementation tracks

## Plain Amiga C

Purpose: teach what the Amiga is actually doing.

The plain track must avoid depending on a game framework. Small course-owned helper functions are allowed when their implementation is visible and taught.

The student should encounter the relevant AmigaOS APIs, memory constraints and documented custom-chip concepts instead of receiving a hidden compatibility layer.

## ACE

Purpose: teach productive game development with ACE while preserving understanding of the underlying Amiga concepts.

ACE examples should point back to the corresponding plain-C concepts so students can identify which responsibilities ACE takes over.

## Sevgi Engine

Purpose: teach game development using Sevgi Engine and show the architectural advantages and trade-offs of a higher-level engine.

Sevgi examples should identify which facilities belong to the engine and which are fundamental Amiga/game-programming concepts.

## Comparison rule

For important cross-track examples, use the same observable behaviour and assets where licensing permits.

Do not judge a track by source line count alone. Compare at least:

- responsibilities handled by student code;
- responsibilities handled by libraries/engine;
- control over hardware-facing behaviour;
- memory use;
- CPU/blitter implications where measurable;
- build complexity;
- debugging experience;
- extensibility.

## Independence

Course material must not make ACE or Sevgi Engine mandatory for the plain track.

ACE material must remain recognisably ACE rather than becoming a wrapper around Sevgi Engine.

Sevgi Engine material should use the engine idiomatically rather than artificially reproducing the lower-level implementations.
