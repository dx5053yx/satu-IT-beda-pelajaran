#include <stdio.h>

int bil;
int terkecil;
int main(){
    printf("masukan bilangan ke-1: ");
    scanf("%d",&terkecil);
    for(int i=2;i<=10;i++){
        printf("masukan bilangan ke-%d: ",i);
        scanf("%d",&bil);
        if(terkecil>bil){
            terkecil=bil;
            
        }
    }
    printf("angka terkecil yang anda masukan adalah: %d\n",terkecil);

}