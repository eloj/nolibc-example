all: test

.PHONY: clean strip dump

nolibc-example: nolibc-example.c start.s
	$(CC) -Wall -Wextra -std=c99 -m64 -mabi=sysv -fno-asynchronous-unwind-tables -static -nostdlib -O2 -o nolibc-example start.s nolibc-example.c

test: nolibc-example
	 env -i AA=1 BB=2 CC=3 ./nolibc-example a b c ; echo ">>status=$$?"

strip:
	strip --strip-unneeded --remove-section=.comment nolibc-example

dump:
	objdump -s nolibc-example

clean:
	rm -f nolibc-example
