#include <iostream>
#include <string>
using namespace std;

const int MAX_PASIEN = 100;

struct QueuePasien {
    string data[MAX_PASIEN];
    int front;
    int rear;
    int jumlah;
};

struct StackRiwayat {
    string data[MAX_PASIEN];
    int top;
};

void bersihkanBufferInput() {
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
}

string rapikanNama(const string &teks) {
    size_t awal = teks.find_first_not_of(" \t\r\n");
    if (awal == string::npos) {
        return "";
    }

    size_t akhir = teks.find_last_not_of(" \t\r\n");
    return teks.substr(awal, akhir - awal + 1);
}

bool namaPasienValid(const string &namaPasien) {
    bool punyaHuruf = false;

    for (char karakter : namaPasien) {
        unsigned char kodeKarakter = static_cast<unsigned char>(karakter);

        if (isalpha(kodeKarakter)) {
            punyaHuruf = true;
        } else if (karakter != ' ' && karakter != '\'' &&
                   karakter != '.' && karakter != '-') {
            return false;
        }
    }

    return punyaHuruf;
}

void initQueue(QueuePasien &q) {
    q.front = 0;
    q.rear = -1;
    q.jumlah = 0;
}

bool isQueueEmpty(const QueuePasien &q) {
    return q.jumlah == 0;
}

bool isQueueFull(const QueuePasien &q) {
    return q.jumlah == MAX_PASIEN;
}

bool enqueue(QueuePasien &q, const string &namaPasien) {
    if (isQueueFull(q)) {
        return false;
    }

    q.rear = (q.rear + 1) % MAX_PASIEN;
    q.data[q.rear] = namaPasien;
    q.jumlah++;
    return true;
}

bool dequeue(QueuePasien &q, string &namaPasien) {
    if (isQueueEmpty(q)) {
        return false;
    }

    namaPasien = q.data[q.front];
    q.front = (q.front + 1) % MAX_PASIEN;
    q.jumlah--;
    return true;
}

void initStack(StackRiwayat &s) {
    s.top = -1;
}

bool isStackEmpty(const StackRiwayat &s) {
    return s.top == -1;
}

bool isStackFull(const StackRiwayat &s) {
    return s.top == MAX_PASIEN - 1;
}

bool push(StackRiwayat &s, const string &namaPasien) {
    if (isStackFull(s)) {
        return false;
    }

    s.top++;
    s.data[s.top] = namaPasien;
    return true;
}

int jumlahRiwayat(const StackRiwayat &s) {
    return s.top + 1;
}

void tampilHeader() {
    cout << "\n";
    cout << "  ==========================================\n";
    cout << "     === SISTEM LAYANAN KLINIK SEHAT ===    \n";
    cout << "  ==========================================\n";
}

void garisPemisah() {
    cout << "  ------------------------------------------\n";
}

void tampilMenu() {
    cout << "\n";
    cout << "  1. Daftar Pasien Baru (Antrian)\n";
    cout << "  2. Panggil Pasien Selanjutnya\n";
    cout << "  3. Tampilkan Antrian Pasien Saat Ini\n";
    cout << "  4. Tampilkan Riwayat Pemeriksaan\n";
    cout << "  5. Keluar\n";
    garisPemisah();
    cout << "  Pilih menu (1-5): ";
}

void tampilkanAntrian(const QueuePasien &q) {
    cout << "  [ Antrian Pasien Saat Ini ]\n";

    if (isQueueEmpty(q)) {
        cout << "  [!] Antrian pasien saat ini kosong.\n";
        return;
    }

    cout << "  Jumlah pasien dalam antrian: " << q.jumlah << "\n";
    cout << "  Urutan Antrian (Depan -> Belakang):\n";
    garisPemisah();

    for (int i = 0; i < q.jumlah; i++) {
        int indeks = (q.front + i) % MAX_PASIEN;
        cout << "  " << i + 1 << ". " << q.data[indeks] << "\n";
    }
}

void tampilkanRiwayat(const StackRiwayat &s) {
    cout << "  [ Riwayat Pemeriksaan ]\n";

    if (isStackEmpty(s)) {
        cout << "  [!] Belum ada riwayat pemeriksaan.\n";
        return;
    }

    cout << "  Jumlah pasien yang sudah diperiksa: " << jumlahRiwayat(s) << "\n";
    cout << "  Riwayat Pemeriksaan (Terbaru -> Terlama):\n";
    garisPemisah();

    for (int i = s.top; i >= 0; i--) {
        cout << "  " << s.top - i + 1 << ". " << s.data[i] << "\n";
    }
}

bool bacaPilihanMenu(int &pilihan) {
    if (!(cin >> pilihan)) {
        cin.clear();
        bersihkanBufferInput();
        return false;
    }

    bersihkanBufferInput();
    return true;
}

int main() {
    QueuePasien antrian;
    StackRiwayat riwayat;
    int pilihan = 0;

    initQueue(antrian);
    initStack(riwayat);

    do {
        tampilHeader();
        tampilMenu();
        if (!bacaPilihanMenu(pilihan)) {
            cout << "\n";
            garisPemisah();
            cout << "  [!] Input tidak valid. Masukkan angka 1 sampai 5.\n";
            garisPemisah();
            continue;
        }

        cout << "\n";
        garisPemisah();

        switch (pilihan) {
            case 1: {
                string namaPasien;

                cout << "  [ Daftar Pasien Baru ]\n";
                cout << "  Masukkan nama pasien: ";
                getline(cin, namaPasien);
                namaPasien = rapikanNama(namaPasien);

                if (namaPasien.empty()) {
                    cout << "  [!] Nama pasien tidak boleh kosong.\n";
                } else if (!namaPasienValid(namaPasien)) {
                    cout << "  [!] Nama pasien hanya boleh berisi huruf, spasi, titik, petik, atau tanda hubung.\n";
                } else if (enqueue(antrian, namaPasien)) {
                    cout << "  [OK] Pasien atas nama \"" << namaPasien
                         << "\" berhasil masuk antrian.\n";
                } else {
                    cout << "  [!] Antrian penuh. Pasien tidak dapat ditambahkan.\n";
                }
                break;
            }

            case 2: {
                string pasienDipanggil;

                cout << "  [ Panggil Pasien Selanjutnya ]\n";
                if (isStackFull(riwayat)) {
                    cout << "  [!] Riwayat penuh. Panggilan pasien dibatalkan agar data tidak hilang.\n";
                } else if (dequeue(antrian, pasienDipanggil)) {
                    cout << "  [>>] Pasien atas nama \"" << pasienDipanggil
                         << "\" sedang diperiksa.\n";

                    push(riwayat, pasienDipanggil);
                    cout << "  [OK] Data pasien disimpan ke riwayat pemeriksaan.\n";
                } else {
                    cout << "  [!] Antrian kosong. Tidak ada pasien yang dapat dipanggil.\n";
                }
                break;
            }

            case 3:
                tampilkanAntrian(antrian);
                break;

            case 4:
                tampilkanRiwayat(riwayat);
                break;

            case 5:
                cout << "  Terima kasih telah menggunakan Sistem Klinik Sehat.\n";
                cout << "  Program selesai. Sampai jumpa!\n";
                break;

            default:
                cout << "  [!] Pilihan tidak valid. Masukkan angka 1 sampai 5.\n";
                break;
        }

        garisPemisah();
    } while (pilihan != 5);

    return 0;
}
