#include <iostream>

using namespace std;

//FUNGSI
float hitunginLuasSegitiga (int alas, int tinggi){
    return (alas * tinggi) / 2;
}

//PROSEDUR
void tampilin (int luas){
    cout << "Luas segitiga adalah " << luas << endl;
}

//JUMLAHIN 2 MATRIKS
void tambahMatriks(int A[2][2], int B[2][2], int hasil[2][2]) {
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            hasil[i][j] = A[i][j] + B[i][j];
        }
    }

}

//TAMPILIN MATRIKS
void tampilMatriks(int M[2][2]) {
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            cout << M[i][j] << " ";
        }
        cout << endl;
    }
}

int main()
{
    cout << "MATERI TIPE DATA" << endl;
    //TIPE DATA: INT (ANGKA, TAPI CUMAN BULAT DOANG) FLOAT (ANGKA, TAPI BISA DESIMAL) STRING (KALIMAT, ATAU KATA) BOOLEAN (TRUE OF FALSE)
    //VARIABEL: YA TINGGAL URUSAN NAMA DOANGG
    int umur = 17;
    float tinggiBadan = 170.5;
    string a = "aa";
    cout << a << endl;
    
    cout << endl << "HITUNG DASAR" << endl;

    //HITUNG HITUNGAN VARIABEL
    int panjang = 0;
    int lebar = 0;
    
    cout << "Berapa panjang persegi panjang? ";
    cin >> panjang;
    cout << "Berapa lebar persegi panjang? ";
    cin >> lebar;
    
    //*/+-
    int luasPersegipanjang = panjang * lebar;
    cout << luasPersegipanjang << endl;
    
    cout << endl << "KONDISIONAL" << endl;

    // && sama || (and & or)


    //KONDISIONAL
    if (luasPersegipanjang > 20)
        cout << "Gede juga ni persegi panjang" << endl;
    
    cout << endl << "LOOPING" << endl;



    //LOOPING FOR BAKAL DI EXECUTE, SELAMA YANG KITA MAU, KITA TAU BAKALAN KELAR KAPAN
    //ITERASINYA ITU 0,1,2,3,4,5,6,7,8,9
    //STRUKTUR: INISIALISASI NAMA VARIABEL, MULAI DARI ITERASI KE BERAPA. KONDISI SAMPAI KAPAN. PENJUMLAHAN/PENGURANGAN
    for (int iterasi = 0; iterasi < 10; iterasi++){
        if (iterasi == 4 && iterasi == 5)continue; //SKIP SAAT ITERASI 4
        if (iterasi % 2 == 0)
            cout << "Deteksi bilangan genap: " << iterasi << endl;
    }
    
    //LOOPING, YANG KITA SENDIRI TU GATAU BAKAL KELAR KAPAN
    //LOOPING WHILE
    int iterasiWhile = 0;
    
    //DIEKSEKUSI SEKALI DOANG
    while (iterasiWhile < 10){
        cout << "While loop" << endl;
        iterasiWhile++;
        
        //iterasiWhile = 1;
        //ga bakalan masuk ke while, karena 1 itu engga < 1
    }
    
    //GANTI VALUE VARIABEL
    iterasiWhile = 2;
    
    //LOOPING DO WHILE
    do {
        cout << "Iterasi ke " << iterasiWhile << endl;
        iterasiWhile++;
    } while (iterasiWhile < 0);

    cout << endl << "HITUNG HITUNGAN ARRAY 2D" << endl;

    int matriks1[2][2] = {
        {1,2},
        {1,2}
    };

    int arr[2] = {1,2};

    int matriks2[2][2] = {
        {2,1},
        {2,1}
    };

    int hasil[2][2];
    tambahMatriks(matriks1, matriks2, hasil);
    tampilMatriks(hasil);

    cout << endl << "FUNGSI" << endl;


    //FUNGSI & PROSEDUR
    int alas, tinggi;

    cout << "Berapa alas segitiga? ";
    cin >> alas;
    cout << "Berapa tinggi segitiga? ";
    cin >> tinggi;
    float luas = hitunginLuasSegitiga (alas, tinggi);
    tampilin (luas);

    return 0;
}