#include <stdio.h>
#include <unistd.h>

int main (void) {
  printf("%d\n", getpid());
  printf("%d\n", getppid());
}
