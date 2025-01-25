// #include <unistd.h> // pull in declarations of write(), ssize_t and size_t

#define size_t unsigned long
#define ssize_t signed long
ssize_t write(int fd, const void * buf, size_t count);

#define put(s) write(1, s, sizeof(s)-1);

int main(int argc, char *argv[], char *envp[])
{
	ssize_t res = put("Hello, World!\n");

	put("argv:\n");
	for (int i=1 ; i < argc ; ++i) {
		write(1, argv[i], 1);
		put("\n");
	}

	if (envp) {
		put("envp:\n");
		while (*envp) {
			write(1, *envp, 4);
			put("\n");
			++envp;
		}
	}

	return res;
}
