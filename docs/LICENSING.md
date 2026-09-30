# Licensing policy

EduAmigaC-Game is a mixed-license repository.

## Course material

Educational prose, lesson text, exercises, diagrams and documentation authored
for this course use **CC BY 4.0**.

Markdown files under `docs/` and lesson documentation are CC BY 4.0 unless a
file explicitly says otherwise.

Recommended SPDX marker:

```text
SPDX-License-Identifier: CC-BY-4.0
```

## Course-owned software

Example programs, tests, build scripts, conversion tools and other software
authored specifically for the course use the **MIT License** unless explicitly
stated otherwise.

Recommended source header:

```text
SPDX-License-Identifier: MIT
Copyright (c) 2026 Ploos AS
```

Tiny snippets embedded in prose follow the license of the surrounding course
material unless they are also distributed as standalone software files.

## Third-party material

Third-party code and assets retain their original licenses. Never replace an
upstream license with the Ploos course licenses.

Dependencies fetched into the student OCI, including ACE, Sevgi Engine and
Amiga toolchain components, are dependencies rather than course-owned code.
Their license notices must remain available according to upstream terms.

Before vendoring any third-party file:

1. confirm redistribution is permitted;
2. retain its copyright and license notice;
3. record its origin and pinned revision;
4. keep it clearly distinguishable from course-owned material.

## Generated outputs

Publishing a CC BY 4.0 course document to HTML, EPUB, Kindle or PDF does not
change its license. Compiling MIT example source does not change the source
license; bundled third-party components retain their own terms.

## Contributions

Contributions are accepted under the license applicable to the area being
modified unless explicitly agreed otherwise.
