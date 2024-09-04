BINARY = aws

CFLAGS = -std=gnu11
CFLAGS += -Og -g
CFLAGS += -Wall -Wextra -Wmissing-prototypes -Wstrict-prototypes
CFLAGS += -Wshadow

LDFLAGS = -z noexecstack

LIBS = -lm

SOURCES = \
	src/main.c \
	src/client.c \
	src/server.c \
	src/http.c \
	src/file.c \
	src/utils.S \

OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(SOURCES)))

$(BINARY): $(OBJECTS)
	$(CC) -o $@ $(LDFLAGS) $^ $(LIBS)

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(BINARY) $(OBJECTS)

.PHONY: clean $(SOURCES)
