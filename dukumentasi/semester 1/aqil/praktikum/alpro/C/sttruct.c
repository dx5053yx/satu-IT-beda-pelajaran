#include <stdio.h>

struct mahsiswa {
    char nama[50];
    int nim;
    int umur;
};

int main(){
    struct mahsiswa m1 = {"Andi",12345,20};
    printf("nama %s\n", m1.nama);
    printf("nim %d\n", m1.nim);
    printf("umur %d\n", m1.umur);

    return 0;
}