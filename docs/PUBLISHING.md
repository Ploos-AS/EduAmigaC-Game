# Publishing integration

EduAmigaC-Game follows the Ploos single-source publishing model.

## Source of truth

Markdown in this repository is the canonical course source. Published formats
are generated artifacts and must not become independently edited copies.

The intended publication outputs are:

- HTML / course website;
- EPUB;
- Kindle-compatible ebook output;
- PDF.

Students do not need the publishing pipeline to take the course, build the
examples or use the student OCI.

## Content boundary

Publishable educational material consists of the course front matter, lesson
Markdown, project explanations, exercises and appendices.

Software source files remain source files. A publication may embed selected
snippets, but it must not duplicate complete maintained examples merely to
make the book self-contained. Links and generated inclusions should point back
to the canonical example where practical.

## Metadata

Publication metadata must identify:

- author: Per Gustav Ousdal;
- publisher: Ploos AS;
- copyright holder: Ploos AS;
- course/document license: CC BY 4.0;
- language;
- edition/version;
- repository release/tag used to build the publication.

Norwegian and English editions may be published separately while sharing the
same technical source structure.

## Ploos publishing pipeline

Ploos publishing automation may be used by repository CI to produce the
standard output formats. That integration is a maintainer/release concern, not
a student dependency.

A publication build must be reproducible from a tagged repository state and a
documented publishing-tool version. Release CI must not silently follow a
moving publishing branch.

## Local fallback

The Markdown source must remain useful without Ploos infrastructure. A reader
must be able to browse it directly on a normal Git host, and maintainers must
be able to substitute standard Markdown/Pandoc-style tooling if the shared
publishing automation is unavailable.

## Generated artifacts

Generated HTML, EPUB, Kindle and PDF files are release artifacts. They are not
canonical source and should not be committed to normal lesson directories.

Publication output inherits CC BY 4.0 for course-owned educational content.
Embedded or referenced third-party material retains its own licensing terms.

## Release gate

Before a publication release:

1. validate internal links and lesson ordering;
2. build every configured publication format;
3. verify metadata and license declarations;
4. record the course tag/commit and publishing-tool version;
5. ensure code references match the released student OCI/toolchain;
6. retain build logs or equivalent CI evidence.
