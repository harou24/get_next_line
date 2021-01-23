#include <stdio.h>
#include <get_next_line.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

int main(void)
{
	char *line = NULL;
	int ret = 1;
	int fd = open("Makefile", O_RDONLY);
	
	if (fd < 0)
	{
		fprintf( stderr, "FD error !\n%s (errno=%d)\n", strerror( errno ), errno );
		return (1);
	}
	while (ret == 1)
	{
		ret = get_next_line(fd, &line);
		printf("%s\n", line);
	}
	return (0);
}
