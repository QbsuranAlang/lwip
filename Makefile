CROSS_COMPILE_PREFIX=mips64-octeon-linux-gnu-
CC = $(CROSS_COMPILE_PREFIX)gcc
AR = $(CROSS_COMPILE_PREFIX)ar
PREFIX = ./target

LIB=libiwip.a
CFLAGS = -Wall -Isrc/include -I$(PORT_DIR) -I.

# ===== don't edit below or whatever =====
PORT_DIR = arch
SOURCES := $(wildcard src/core/*.c) $(wildcard src/core/ipv4/*.c) $(wildcard src/core/ipv6/*.c) $(wildcard src/api/*.c) $(wildcard src/netif/*.c) $(wildcard src/netif/ppp/*.c)
OBJECTS := $(SOURCES:%.c=%.o)

$(LIB): $(OBJECTS)
	$(AR) -r $@ $^

clean:
	rm -f $(LIB) $(OBJECTS)

install: $(LIB)
	mkdir -p $(PREFIX)/lib
	mkdir -p $(PREFIX)/include
	cp $(LIB) $(PREFIX)/lib
	cp -R src/include $(PREFIX)

.PHONY: clean install
