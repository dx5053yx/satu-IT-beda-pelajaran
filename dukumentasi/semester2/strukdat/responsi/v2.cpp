
#include <iostream>
#include <string>
using namespace std;


const int MAX = 100;


struct Queue {
    string data[MAX];
    int front;
    int rear;
    int count;
};

void initQueue(Queue &q) {
    q.front = 0;
    q.rear  = -1;
    q.count = 0;
}

bool isQueueEmpty(Queue &q) {
    return q.count == 0;
}

bool isQueueFull(Queue &q) {
    return q.count == MAX;
}

bool enqueue(Queue &q, string nama) {
    if (isQueueFull(q)) {
        return false;
    }
    q.rear = (q.rear + 1) % MAX;
    q.data[q.rear] = nama;
    q.count++;
    return true;
}

string dequeue(Queue &q) {
    if (isQueueEmpty(q)) {
        return "";
    }
    string nama = q.data[q.front];
    q.front = (q.front + 1) % MAX;
    q.count--;
    return nama;
}

void tampilQueue(Queue &q) {
    if (isQueueEmpty(q)) {
        cout << "  [!] Antrian saat ini kosong.\n";
        return;
    }
    cout << "  Urutan Antrian (Depan -> Belakang):\n";
    cout << "  ------------------------------------\n";
    for (int i = 0; i < q.count; i++) {
        int idx = (q.front + i) % MAX;
        cout << "  " << (i + 1) << ". " << q.data[idx] << "\n";
    }
}


struct Stack {
    string data[MAX];
    int top;
};

void initStack(Stack &s) {
    s.top = -1;
}

bool isStackEmpty(Stack &s) {
    return s.top == -1;
}

bool isStackFull(Stack &s) {
    return s.top == MAX - 1;
}

bool push(Stack &s, string nama) {
    if (isStackFull(s)) {
        return false;
    }
    s.top++;
    s.data[s.top] = nama;
    return true;
}

void tampilStack(Stack &s) {
    if (isStackEmpty(s)) {
        cout << "  [!] Belum ada riwayat pemeriksaan.\n";
        return;
    }
    cout << "  Riwayat Pemeriksaan (Terbaru -> Terlama):\n";
    cout << "  ------------------------------------------\n";
    for (int i = s.top; i >= 0; i--) {
        cout << "  " << (s.top - i + 1) << ". " << s.data[i] << "\n";
    }
}

void tampilHeader() {
    cout << "\n";
    cout << "  ==========================================\n";
    cout << "     === SISTEM LAYANAN KLINIK SEHAT ===    \n";
    cout << "  ==========================================\n";
}

void tampilMenu() {
    cout << "\n";
    cout << "  1. Daftar Pasien Baru (Antrian)\n";
    cout << "  2. Panggil Pasien Selanjutnya\n";
    cout << "  3. Tampilkan Antrian Pasien Saat Ini\n";
    cout << "  4. Tampilkan Riwayat Pemeriksaan\n";
    cout << "  5. Keluar\n";
    cout << "  ------------------------------------------\n";
    cout << "  Pilih menu (1-5): ";
}

void garisPemisah() {
    cout << "  ------------------------------------------\n";
}

int main() {
    Queue antrian;
    Stack riwayat;
    initQueue(antrian);
    initStack(riwayat);

    int pilihan;
    string namaPasien;

    do {
        tampilHeader();
        tampilMenu();

        if (!(cin >> pilihan)) {
            cin.clear();
            cin.ignore(10000, '\n');
            cout << "\n  [!] Input tidak valid! Masukkan angka 1-5.\n";
            continue;
        }
        cin.ignore();

        cout << "\n";
        garisPemisah();

        switch (pilihan) {
            case 1:
                cout << "  [ Daftar Pasien Baru ]\n";
                cout << "  Masukkan Nama Pasien : ";
                getline(cin, namaPasien);

                if (namaPasien.empty()) {
                    cout << "  [!] Nama tidak boleh kosong!\n";
                } else if (enqueue(antrian, namaPasien)) {
                    cout << "  [OK] Pasien atas nama \"" << namaPasien
                         << "\" berhasil didaftarkan ke antrian.\n";
                } else {
                    cout << "  [!] Antrian penuh! Tidak dapat mendaftarkan pasien baru.\n";
                }
                break;

            
            case 2:
                cout << "  [ Panggil Pasien Selanjutnya ]\n";
                if (isQueueEmpty(antrian)) {
                    cout << "  [!] Tidak ada pasien dalam antrian.\n";
                } else {
                    namaPasien = dequeue(antrian);
                    cout << "  [>>] Pasien atas nama \"" << namaPasien
                         << "\" sedang diperiksa.\n";
                    // Otomatis masukkan ke riwayat (Stack)
                    push(riwayat, namaPasien);
                    cout << "  [OK] Data pasien disimpan ke riwayat pemeriksaan.\n";
                }
                break;

            
            case 3:
                cout << "  [ Antrian Pasien Saat Ini ]\n";
                tampilQueue(antrian);
                break;

            
            case 4:
                cout << "  [ Riwayat Pemeriksaan ]\n";
                tampilStack(riwayat);
                break;

            
            case 5:
                cout << "  Terima kasih telah menggunakan Sistem Klinik Sehat.\n";
                cout << "  Program selesai. Sampai jumpa!\n";
                break;

            default:
                cout << "  [!] Pilihan tidak valid! Masukkan angka 1-5.\n";
                break;
        }

        garisPemisah();

    } while (pilihan != 5);

    return 0;
}