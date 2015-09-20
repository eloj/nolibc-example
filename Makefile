all: test

.PHONY: clean test

nolibc-example: nolibc-example.c start.s
	gcc -ggdb -static -nostdlib -O2 -o nolibc-example start.s nolibc-example.c

test: nolibc-example
	 env -i AA=1 BB=2 CC=3 ./nolibc-example a b c ; echo ">>status=$$?"

clean:
	rm -f nolibc-example
