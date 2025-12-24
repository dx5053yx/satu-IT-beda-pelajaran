#include <stdio.h>

void g(int n){
    if(n == 0) return;
    printf("%d ", n);
    g(n-1);
    printf("%d ", n);
}
int main(){
    g(2);
}
