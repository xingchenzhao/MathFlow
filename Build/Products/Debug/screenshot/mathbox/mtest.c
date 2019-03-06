#include <stdio.h>
#include "mathpix.h"

int main(void) {
  char tex[] = "/Users/mac/Desktop/test.png";
  char buf[2048];
  size_t size = pic_to_tex(tex, buf);
  printf("%lu\n", size);
  return 0;
}
