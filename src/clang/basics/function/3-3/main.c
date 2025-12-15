#include <stdio.h>

int f(int n) {
    if (0 == n) {
      return 0;
    }else {
     return n + f(n - 1);
    }
} 

int main() {
    int result = f(10);
    printf("%d\n", result);    
}
