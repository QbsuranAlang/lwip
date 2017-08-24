CC = gcc
AR = ar
PREFIX = ./target

LIB=libiwip.a
CFLAGS = -Wall -Isrc/include -I$(PORT_DIR) -I.

# ===== don't edit below =====
PORT_DIR = arch
SOURCES := $(wildcard src/core/*.c) $(wildcard src/core/ipv4/*.c) $(wildcard src/core/ipv6/*.c) $(wildcard src/api/*.c) $(wildcard src/netif/*.c) $(wildcard src/netif/ppp/*.c)
OBJECTS := $(SOURCES:%.c=%.o)

$(LIB): $(OBJECTS)
	$(AR) -r $@ $^

clean:
	rm -f $(LIB) $(OBJECTS)

install: $(LIB)
	mkdir -p $(PREFIX)/lib
	cp $(LIB) $(PREFIX)/lib
	cp -R src/include $(PREFIX)

uninstall:
	rm -rf $(PREFIX)

.PHONY: clean install uninstall
