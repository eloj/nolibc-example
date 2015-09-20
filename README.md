
# nolibc-example #

Spent an evening playing around with writing a small 64-bit Linux C program that does not
use a standard C library (libc). Shows how to set up \_start to provide main() with
_argc_, _argv_ and _argp_.

I'm sure I didn't get everything in the init just right (like the stack red-zone), but it
seems to work [on my system].

# Example output #

The test program prints the obligatory "Hello, World!" and then the first character of
all the args and the first four characters of all the envvars, demonstrating these have
been passed correctly from the loader. The length of the hello write(2) is returned
to the shell.

```
$ env -i AA=1 BB=2 CC=3 ./nolibc-example a b c ; echo ">>status=$?"
Hello, World!
argv:
a
b
c
envp:
AA=1
BB=2
CC=3
>>status=14
```

