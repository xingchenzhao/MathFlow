#ifndef __WOLFRAM_H
#define __WOLFRAM_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_WOLFRAM_SIZE 256
size_t tex_to_wolfram(char* tex, size_t tex_size, char* buf);

#endif