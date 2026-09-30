# syntax=docker/dockerfile:1

FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      git \
      make \
      xz-utils \
 && rm -rf /var/lib/apt/lists/*

# The Amiga cross-toolchain, ACE and Sevgi Engine are intentionally installed
# in explicit, version-pinned steps as the course bootstrap matures.
# Do not depend on amiga-dev/amiga-runtime or private Ploos infrastructure.

ARG COURSE_UID=1000
ARG COURSE_GID=1000

RUN groupadd --gid "${COURSE_GID}" student \
 && useradd --uid "${COURSE_UID}" --gid "${COURSE_GID}" \
      --create-home --shell /bin/bash student

WORKDIR /workspace
USER student

CMD ["/bin/bash"]
