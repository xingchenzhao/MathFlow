#include "mathpix.h"

#define m_pref "curl -s -X POST https://api.mathpix.com/v3/latex -H 'app_id:zhengeureka_gmail_com' -H 'app_key:85fa73c3a31cee6a7cdd' -H 'Content-Type:application/json' --data '{ \"src\": \"data:image/png;base64,'$(base64 -i "
static char m_suff[] = ")'\"}'";
static char integral[] = "\\\\int";
static char operator[] = "operatorname{";

size_t pic_to_tex(char* img, char* buf) {
  char request[512] = m_pref;
  char* r = request;

  r = strcat(r, img);
  r = strcat(r, m_suff);

  FILE* fs = popen(request, "r");
  
  char cache[MAX_PIX_SIZE];
  fread(cache, sizeof(char), MAX_PIX_SIZE, fs);
  pclose(fs);

  char tar[10] = "\"latex\":\"";
  char* c = cache, *t = tar;

match:
  for (;(*c != *t) && (*c != '\0') ;c++);
  while (*c == *t) {
  	for (; *c == *t; c++, t++){}
    if (*t == '\0')
      break;
  	t = tar;
  	goto match;
  }
  
  if (*c == '\0') return 0;

  size_t size = 0;

  for (int i = 0, j = 0, k = 0, l = 0, m = 0; *c != '\"'; c++) {
  	if (*c == integral[j]) {
  		j++;
  	} else if (j == 5) {
  		j = 0, i++;
  	} else {
  		j = 0;
  	}

    if (*c == operator[l]) {
      l++;
    } else if (l == 12) {
      buf -= 12, l = 0, m++, c++;
      continue;
    } else {
      l = 0;
    }

  	if (*c == ' ') continue;

    if (m && (*c == '}')) {
      m--;
      while(*(c++) == '\0');
      *(buf++) = ' ';
      *(buf++) = *(++c);
      *(buf++) = ' ';
      continue;
    }

  	if (i && (*c == 'd')) {
  		*(buf++) = '}';
  		*(buf++) = '\\';
  		*(buf++) = ',';
  		i--, size += 2, k++;
  	}

  	if (k && (*c == '}')) {
  		k--; continue;
  	} else {
		*(buf++) = *c, size += 1;
	}
  }

  *buf = '\0';

  return size;
} 