#include <stdio.h>
#include "wolfram.h"

int main(void) {
  char tex[] = "\\\\operatorname{lim}_{x\\\\rightarrow\\\\infty}\\\\int_{x}^{-x}e^{-t^{2}}\\,dt=\\\\sqrt{\\\\pi}";
  char buf[258];
  size_t size = tex_to_wolfram(tex, strlen(tex), buf);
  printf("%s\n", buf);
  return 0;
}
