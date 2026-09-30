# syntax=docker/dockerfile:1

FROM debian:bookworm-slim AS toolchain-builder

ARG DEBIAN_FRONTEND=noninteractive
ARG AMIGA_GCC_REV=b58d16de6b9ca921825b8a1f1783a64224ad6cf4

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      autoconf automake bison ca-certificates curl flex g++ gcc gettext git \
      libreadline-dev make patch rsync xz-utils \
 && rm -rf /var/lib/apt/lists/*

COPY container/toolchain-components.lock /tmp/toolchain-components.lock
COPY container/verify-toolchain-lock.sh /usr/local/bin/verify-toolchain-lock
RUN chmod +x /usr/local/bin/verify-toolchain-lock

WORKDIR /build
RUN git clone https://github.com/AmigaPorts/m68k-amigaos-gcc.git \
 && cd m68k-amigaos-gcc \
 && git checkout "${AMIGA_GCC_REV}" \
 && test "$(git rev-parse HEAD)" = "${AMIGA_GCC_REV}" \
 && make update \
 && /usr/local/bin/verify-toolchain-lock /tmp/toolchain-components.lock /build/m68k-amigaos-gcc/projects \
 && mkdir -p /opt/amiga \
 && make all -j"$(nproc)" PREFIX=/opt/amiga

FROM debian:bookworm-slim AS student

ARG DEBIAN_FRONTEND=noninteractive
ARG ACE_REV=9e6ce064897cbd6b517d56fbd15da43919261a56
ARG SEVGI_REV=fcf1b2166351911d49baa6641cf7a359075721a2
ARG CMAKE_TOOLCHAINS_REV=c579e46732af7398a09360dce4a6fb8d91d3f447

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates cmake file git make \
 && rm -rf /var/lib/apt/lists/*

COPY --from=toolchain-builder /opt/amiga /opt/amiga

ENV PATH="/opt/amiga/bin:${PATH}"

RUN mkdir -p /opt/course/deps \
 && git clone https://github.com/AmigaPorts/ACE.git /opt/course/deps/ace \
 && git -C /opt/course/deps/ace checkout "${ACE_REV}" \
 && test "$(git -C /opt/course/deps/ace rev-parse HEAD)" = "${ACE_REV}" \
 && git clone https://github.com/AmigaPorts/AmigaCMakeCrossToolchains.git /opt/course/deps/cmake-toolchains \
 && git -C /opt/course/deps/cmake-toolchains checkout "${CMAKE_TOOLCHAINS_REV}" \
 && test "$(git -C /opt/course/deps/cmake-toolchains rev-parse HEAD)" = "${CMAKE_TOOLCHAINS_REV}" \
 && git clone https://github.com/alpyre/Sevgi_Engine.git /opt/course/deps/sevgi \
 && git -C /opt/course/deps/sevgi checkout "${SEVGI_REV}" \
 && test "$(git -C /opt/course/deps/sevgi rev-parse HEAD)" = "${SEVGI_REV}"

ARG COURSE_UID=1000
ARG COURSE_GID=1000
RUN groupadd --gid "${COURSE_GID}" student \
 && useradd --uid "${COURSE_UID}" --gid "${COURSE_GID}" \
      --create-home --shell /bin/bash student \
 && mkdir -p /workspace \
 && chown student:student /workspace

WORKDIR /workspace
USER student

CMD ["/bin/bash"]
