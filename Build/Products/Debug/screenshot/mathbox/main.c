#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include "wolfram.h"
#include "mathpix.h"

int main(int argc, char* argv[]) {

	char* img = NULL, *path = NULL;
	switch (argc) {
		case  2:
			img = argv[1];
		case  3:
			img = argv[1];
			path = argv[2];
			break;
		default:
			return 0;
	}

	char tex[MAX_PIX_SIZE], wolfram[MAX_WOLFRAM_SIZE];

	size_t s1 = pic_to_tex(img, tex);
	size_t s2 = tex_to_wolfram(tex, s1, wolfram);

	char result[MAX_WOLFRAM_SIZE + MAX_PIX_SIZE] = {0};
	char *res = strcat(result, tex);
	res = strncat(res, "@", 1);
	res = strcat(res, wolfram);

	if (path == NULL) {
		printf("%s\n", res);
	} else {
		int fd = open(path, O_RDWR);
		write(fd, res, s1 + s2 + 1);
		sync();
		close(fd);
	}

	return 0;
}