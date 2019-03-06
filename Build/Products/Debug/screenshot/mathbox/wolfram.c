#include "wolfram.h"
#include <errno.h>
#include <string.h>

#define w_pref "/usr/local/bin/wolframscript -cloud -code 'ToExpression[\""
char w_suff[] = "\", TeXForm, Hold]'";

size_t tex_to_wolfram(char* tex, size_t tex_size, char* buf) {
  
  if (tex_size == 0) {
  	*buf = '\0';
  	return 0;
  }

  char request[512] = w_pref;
  char* r = request;
  r = strncat(r, tex, tex_size+1);
  r = strcat(r, w_suff);

  char cache[MAX_WOLFRAM_SIZE];

  FILE* fs = popen(request, "r");

  fread((void*)cache, sizeof(char), MAX_WOLFRAM_SIZE, fs); //perror(strerror(errno));
  pclose(fs);

  char *c = cache;
  size_t size = 0;

  if (*c != 'H') return 0;

  int brace = 1;

  for (c += 5; brace; c++) {
  	if (*c == ']') {
  		if (!(--brace)) break;
  	} else if (*c == '[') {
  		brace++;
  	}

  	*(buf++) = *c, size++;
  }

  return size;
}
