#include <stdio.h>

int main() {
    int n, i, j, k;
    printf("Masukkan jumlah peserta: ");
    scanf("%d", &n);

    int peserta[n];
    for (i = 0; i < n; i++) {
        peserta[i] = i + 1;
    }

    k = 0; // indeks untuk menghitung setiap kelipatan 3
    i = 0; // indeks untuk iterasi melalui peserta

    while (n > 1) {
        if (peserta[i] != 0) { // hanya hitung peserta yang belum dieliminasi
            k++;
            if (k == 3) {
                printf("Peserta %d dieliminasi\n", peserta[i]);
                peserta[i] = 0; // eliminasi peserta
                k = 0; // reset hitungan
                n--; // kurangi jumlah peserta
            }
        }
        i = (i + 1) % (sizeof(peserta) / sizeof(peserta[0])); // lanjut ke peserta berikutnya
    }

    for (i = 0; i < sizeof(peserta) / sizeof(peserta[0]); i++) {
        if (peserta[i] != 0) {
            printf("Peserta yang tersisa adalah %d\n", peserta[i]);
            break;
        }
    }

    return 0;
}