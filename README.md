# get_next_line

Calling get_next_line function in a loop  allow you to read the text
available on a file descriptor one line at a time until the EOF.

<p align="center">
<img src="https://www.marineterrein.nl/wp-content/uploads/2019/09/highres_482360765-830x466.jpeg"  width=35% height=35%>
</p>

# Prototype

```c
int get_next_line(int fd, char **line);
```

# Return value

- 1  : A line has been read.
- 0  : EOF has been reached.
- -1 : An error happened.

# How to use

For example the code below shows how to read and display a file line by line.

```c
#include "get_next_line.h"

#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>

#define FD_ERROR 1

int   main(void)
{
  char *line = NULL;
  int fd = open("a_file_of_your_choice", O_RDONLY);
  int ret = 1;
  
  if (fd < 0)
    return(FD_ERROR);  
  while (ret == 1)
  {
    ret = get_next_line(fd, &line);
    printf("%s\n", line);
  }
  return (0);
}

