all: test

.PHONY: clean

nolibc-example: nolibc-example.c start.s
	$(CC) -std=c99 -m64 -mabi=sysv -mno-red-zone -ggdb -static -nostdlib -O2 -o nolibc-example start.s nolibc-example.c

test: nolibc-example
	 env -i AA=1 BB=2 CC=3 ./nolibc-example a b c ; echo ">>status=$$?"

clean:
	rm -f nolibc-example
