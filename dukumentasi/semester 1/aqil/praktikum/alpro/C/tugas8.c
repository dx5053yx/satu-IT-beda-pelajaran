#include <stdio.h>
/*void tukar(int *x, int *y){
    int temp = *x;
    *x = *y;
    *y = temp;
}*/


void hitungLuasKeliling(int panjang, int lebar, int *luas, int *keliling) {
*luas = panjang * lebar;
*keliling = 2* (panjang + lebar);
}

int main() {
    int a, b;
    printf("Masukkan nilai panjang: ");
    scanf("%d", &a);
    printf("Masukkan nilai lebar: ");
    scanf("%d", &b);
    //printf("Sebelum ditukar: a = %d, b = %d\n", a, b);
    hitungLuasKeliling(a, b, &a, &b);
    printf("Luas = %d, Keliling = %d\n", a, b);
    /*tukar(&a, &b);
    printf("Setelah ditukar: a = %d, b = %d\n", a, b);
    */
    return 0;
}
