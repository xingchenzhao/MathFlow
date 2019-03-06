#ifndef __MATHPIX_H
#define __MATHPIX_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_PIX_SIZE 2048
size_t pic_to_tex(char* img, char* buf);

#endif