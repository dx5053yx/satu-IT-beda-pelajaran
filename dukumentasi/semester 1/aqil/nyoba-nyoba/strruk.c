#include <stdio.h>

struct info{
    struct lah{
        int a;
    };
    int x;
};


int main(){
    struct info i={lah l= {5},10};
    printf("%d", i.lah.a);
    printf("%d", i.x);
    return 0;
}