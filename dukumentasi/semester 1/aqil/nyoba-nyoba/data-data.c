#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h> // <--- Kita butuh ini buat `malloc` dan `realloc`! Ini kantong ajaib kita!

typedef struct {
    char nama[100];
    int umur;
} mahasiswa;

int main(){
    // Kita mulai dengan pointer kosong, belum ada data sama sekali
    mahasiswa *mhs = NULL; 
    int jumlah_data = 0;

    printf("masukan data-data mahasiswa\n");

    while(true){
        jumlah_data++; // Tambah jumlah datanya dulu

        // Minta memori yang lebih besar setiap mau nambah data! Ajaib!
        mahasiswa *temp = realloc(mhs, jumlah_data * sizeof(mahasiswa));

        // Cek dulu, kalo komputernya gabisa ngasih memori, kita berhenti
        if (temp == NULL) {
            printf("Waaah! Memori penuh, gabisa nambah data lagi! (´;ω;｀)\n");
            free(mhs); // Jangan lupa beresin yang lama
            return 1;
        }
        mhs = temp; // Sekarang, mhs menunjuk ke tempat yang lebih besar!

        printf("nama: ");
        // Kita simpen di data terakhir, yaitu index ke-(jumlah_data - 1)
        scanf("%s", mhs[jumlah_data - 1].nama); 

        printf("umur: ");
        scanf("%d", &mhs[jumlah_data - 1].umur);

        printf("data berhasil disimpan\n");
        printf("apakah anda ingin menambahkan data lagi? (y/n): ");
        char pilihan;
        scanf(" %c", &pilihan);

        if(pilihan == 'n' || pilihan == 'N'){
            break; // Keluar dari loop while
        }
    }

    // Bagian ini sama persis!
    printf("\n--- Semua Data Mahasiswa ---\n");
    for(int j=0; j<jumlah_data; j++){
        printf("+++++++++++++++\n");
        printf("data ke-%d\n", j+1);
        printf("nama: %s\n", mhs[j].nama);
        printf("umur: %d\n", mhs[j].umur);
        printf("+++++++++++++++\n\n");
    }

    // PENTING! Setelah selesai, kita harus bebasin memorinya!
    // Bilang ke komputer, "Makasih ya tempatnya, sekarang boleh dipake yang lain!"
    free(mhs);

    return 0;
}

/*#include <stdio.h>
#nclude <stdbool.h>


typedef struct {
    char nama[100];
    int umur;
} mahasiswa;
int i=0;
void cetak(){
    for(int j=0; j<i; j++){
        printf("+++++++++++++++\n");
        printf("data ke-%d\n", j+1);
        printf("nama: %s\n", mhs[j].nama);
        printf("umur: %d\n", mhs[j].umur);
        printf("+++++++++++++++\n\n");
    }
}
int data (mahasiswa mhs[i]){
    printf("nama: ");
    scanf("%s", mhs[i].nama);
    printf("umur: ");
    scanf("%d", &mhs[i].umur);
    i++;
    return mhs[i];
}

int main(){
    printf("masukan data-data mahasiswa\n");
    while(true){
        data(mhs);
        printf("data berhasil disimpan\n");
        printf("apakah anda ingin menambahkan data lagi? (y/n): ");
        char pilihan;
        scanf(" %c", &pilihan);
        if(pilihan == 'n' || pilihan == 'N'){
            cetak();
            break;
        }
        else if(pilihan == 'y' || pilihan == 'Y'){
            printf("masukan data ke-%d\n", i+1);
            continue;
        }
        else{
            printf("pilihan tidak valid\n");
        }
    }
    return 0;
    } */