CC := m68k-amigaos-gcc
CFLAGS ?= -m68000 -Wall -Wextra -Wpedantic
LDFLAGS ?= -mcrt=nix20

all: hello

hello: hello.c
	$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@

clean:
	rm -f hello
