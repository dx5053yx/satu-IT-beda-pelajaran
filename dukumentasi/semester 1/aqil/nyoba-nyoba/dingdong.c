#include <stdio.h>

struct game {
    int level[12];
    int tarif;
};

void tarif(int uang,int tiket, struct game g){
    uang = uang - g.tarif;
    printf("sisa saldo kamu: %d\n", uang);
    return tiket + tiket;
    printf("jumlah tiket yang didapat: %d\n", tiket);
}

void play(int start, int tiket, int uang, struct game g){
    for (int i = 0; i<start;i++){
        if (g.level[i]==start){
        if(g.level[i]<=4){
            tiket = tiket + 3;
            tarif(uang,tiket,g);
        }else if (g.level[i]<=7){
            tiket = tiket + 5;
            tarif(uang,tiket,g);
        }else if (g.level[i]<=9){
            tiket = tiket + 8;
            tarif(uang,tiket,g);
        }else if (g.level[i]<=11){
            tiket = tiket + 15;
            tarif(uang,tiket,g);
        }else if (g.level[i]==12){
            tiket = tiket + 20;
            tarif(uang,tiket,g);
        }else{
            printf("level tidak valid\n");
        }
    }
    }
}

int main(){
    struct game g={{1,2,3,4,5,6,7,8,9,10,11,12},12000};
    int uang, tiket, start;
    char alur;
    tiket = 0;
    printf("silahkan masukan uang: ");
    scanf("%d", &uang);
    while(true){
        if(uang>=g.tarif){
            printf("mau main level berapa?");
            scanf("%d", &start);
            play(start,tiket,uang,g);
            printf("masih mau lanjut(n/y)? ");
            scanf("\n%c", &alur);
            if(alur == 'n' || alur == 'N'){
                break;
            }
        }else{
            printf("saldo anda sekarang: %d saldo tidak cukup ");
            break;
        }
    }
}