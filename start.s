#
# System V AMD64 ABI mini-program example.
#
# This file contains the program entry point _start, which sets up
# and calls into main(), and a library routine mimicking write(2)
# so that we can generate some output in our example program.
#
# See also:
#	http://wiki.osdev.org/System_V_ABI
#	https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux
#
# From https://github.com/eloj/nolibc-example/
#
.globl _start
.globl _exit
.globl write

_start:
	movq $0, %rbp

	pop %rdi		# load argc
	movq %rsp, %rsi	# load argv
	lea 8(%rsi, %rdi, 8), %rdx # load envp

	andq $~0x0f, %rsp	# align stack

	# on entry to main, %rdi=argc, %rsi=argv, %rdx=envp
	call main
	movq %rax, %rdi	# load return value
_exit:
	movq $0x3c, %rax
	syscall
	hlt

write:
	# rdi = fileno
	# rsi = buffer
	# rdx = size
	movq $0x01, %rax
	syscall
	ret
