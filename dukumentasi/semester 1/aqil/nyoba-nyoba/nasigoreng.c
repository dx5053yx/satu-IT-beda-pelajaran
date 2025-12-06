#include <stdio.h>

struct bahan{
    int nasi;
    int telur;
    int sayur;
};

struct porsi{
    int x;
    int y;
    int z;
};
void masak(int jumlah, struct bahan b, struct porsi p){
    int mateng = 0;
    for(int i=0;i<jumlah;i++){
        if(b.nasi == 0 || b.telur == 0 || b.sayur == 0){
            printf("bahan habis\n");
            break;
        }else{
            b.nasi -= p.x;
            b.telur -= p.y;
            b.sayur -= p.z;
            mateng += 1;
        }
    }
    printf("porsi tersedia %d\n", mateng);
}

int main(){
    int jumlah;
    struct bahan b ={5000,20,1500};
    struct porsi p ={300,2,100};
    printf("bahan anda saat ini adalah %d gram nasi, %d butir telur, dan %d gram sayur\n", b.nasi, b.telur, b.sayur);
    printf("1 porsi nasi goreng membutuhkan %d nasi, %d butir telur, dan %d gram sayur\n", p.x, p.y, p.z);
    printf("mau masak berapa porsi?\n");
    scanf("%d", &jumlah);
    masak(jumlah,b,p);
    return 0;
}
