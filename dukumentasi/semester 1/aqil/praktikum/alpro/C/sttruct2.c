#include <stdio.h>

struct waktu {
    int jam;
    int menit;
    int detik;
};
void hitung (struct waktu w){
    while (w.detik >= 60 || w.menit >= 60){
        if (w.detik >= 60){
            w.detik = w.detik - 60;
            w.menit = w.menit + 1;
            if (w.menit >= 60){
                w.menit = w.menit - 60;
                w.jam = w.jam + 1;
            }
        }
    }
    printf("%d jam, %d menit, %d detik \n", w.jam, w.menit, w.detik );
}
int main(){
    struct waktu w;
    printf("masukan detik:");
    scanf("%d", &w.detik);
    printf("masukan menit: ");
    scanf("%d", &w.menit);
    printf("masukan jam:");
    scanf("%d", &w.jam);
    
    hitung(w);

    return 0;
}