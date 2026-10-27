BIN:=nolibc-example

.PHONY: strip dump size clean

all: test

nolibc-example: nolibc-example.c start.s
	$(CC) -Wall -Wextra -std=c99 -m64 -mabi=sysv -fno-asynchronous-unwind-tables -static -nostdlib -O2 -o $(BIN) start.s nolibc-example.c

test: nolibc-example
	 env -i AA=1 BB=2 CC=3 ./$(BIN) a b c ; echo ">>status=$$?"

strip:
	strip --strip-unneeded --remove-section=.comment $(BIN)

dump:
	objdump -Fs $(BIN)

size:
	@size -G $(BIN)

clean:
	rm -f $(BIN)
