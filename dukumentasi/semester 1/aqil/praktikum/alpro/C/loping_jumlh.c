#include <stdio.h>

int bil;
int i;
int hasil;
int main(){
    printf("masukan jumlah penjumlahan: ");
    scanf("%d",&bil);
    while(i<=bil){
        hasil=hasil+i;
        i++;

    }
    printf("hasilnya adalah: %d \n",hasil);
    return 0;
}