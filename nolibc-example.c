#include <stddef.h> // for size_t

size_t write(int fd, const void *buf, size_t count);
void _exit(int status);

#define put(s) write(1, s, sizeof(s)-1);

int main(int argc, char *argv[], char *env[])
{
	put("Hello, World!\n");

	put("args:\n");
	for (int i=1 ; i < argc ; ++i) {
		write(1, argv[i], 1);
		put("\n");
	}

	if (env) {
		put("envs:\n");
		while (*env) {
			write(1, *env, 4);
			put("\n");
			++env;
		}
	}

	return 42;
}

