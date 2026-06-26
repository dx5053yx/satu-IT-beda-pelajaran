#include <iostream>
#include <string>
#include <limits>
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

void initStack(StackRiwayat &s) {
    s.top = -1;
}

bool isStackEmpty(const StackRiwayat &s) {
    return s.top == -1;
}

bool isStackFull(const StackRiwayat &s) {
    return s.top == MAX_PASIEN - 1;
}

void enqueue(QueuePasien &q, const string &namaPasien) {
    if (isQueueFull(q)) {
        cout << "Antrian penuh. Pasien tidak dapat ditambahkan.\n";
        return;
    }

    q.rear = (q.rear + 1) % MAX_PASIEN;
    q.data[q.rear] = namaPasien;
    q.jumlah++;

    cout << "Pasien atas nama " << namaPasien << " berhasil masuk antrian.\n";
}

bool dequeue(QueuePasien &q, string &namaPasien) {
    if (isQueueEmpty(q)) {
        cout << "Antrian kosong. Tidak ada pasien yang dapat dipanggil.\n";
        return false;
    }

    namaPasien = q.data[q.front];
    q.front = (q.front + 1) % MAX_PASIEN;
    q.jumlah--;
    return true;
}

void push(StackRiwayat &s, const string &namaPasien) {
    if (isStackFull(s)) {
        cout << "Riwayat penuh. Data pasien tidak dapat disimpan.\n";
        return;
    }

    s.top++;
    s.data[s.top] = namaPasien;
}

void tampilkanAntrian(const QueuePasien &q) {
    if (isQueueEmpty(q)) {
        cout << "Antrian pasien saat ini kosong.\n";
        return;
    }

    cout << "\n=== ANTRIAN PASIEN SAAT INI ===\n";
    for (int i = 0; i < q.jumlah; i++) {
        int indeks = (q.front + i) % MAX_PASIEN;
        cout << i + 1 << ". " << q.data[indeks] << '\n';
    }
}

void tampilkanRiwayat(const StackRiwayat &s) {
    if (isStackEmpty(s)) {
        cout << "Riwayat pemeriksaan masih kosong.\n";
        return;
    }

    cout << "\n=== RIWAYAT PEMERIKSAAN ===\n";
    for (int i = s.top; i >= 0; i--) {
        cout << s.top - i + 1 << ". " << s.data[i] << '\n';
    }
}

void tampilkanMenu() {
    cout << "\n=== SISTEM LAYANAN KLINIK SEHAT ===\n";
    cout << "1. Daftar Pasien Baru (Antrian)\n";
    cout << "2. Panggil Pasien Selanjutnya\n";
    cout << "3. Tampilkan Antrian Pasien Saat Ini\n";
    cout << "4. Tampilkan Riwayat Pemeriksaan\n";
    cout << "5. Keluar\n";
    cout << "Pilih menu (1-5): ";
}

int main() {
    QueuePasien antrian;
    StackRiwayat riwayat;
    int pilihan;

    initQueue(antrian);
    initStack(riwayat);

    do {
        tampilkanMenu();

        if (!(cin >> pilihan)) {
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            cout << "Input tidak valid. Masukkan angka 1 sampai 5.\n";
            continue;
        }

        cin.ignore(numeric_limits<streamsize>::max(), '\n');

        switch (pilihan) {
            case 1: {
                string namaPasien;
                cout << "Masukkan nama pasien: ";
                getline(cin, namaPasien);

                if (namaPasien.empty()) {
                    cout << "Nama pasien tidak boleh kosong.\n";
                } else {
                    enqueue(antrian, namaPasien);
                }
                break;
            }
            case 2: {
                string pasienDipanggil;
                if (dequeue(antrian, pasienDipanggil)) {
                    cout << "Pasien atas nama " << pasienDipanggil
                         << " sedang diperiksa.\n";
                    push(riwayat, pasienDipanggil);
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
                cout << "Terima kasih. Program selesai.\n";
                break;
            default:
                cout << "Pilihan tidak tersedia. Silakan pilih menu 1 sampai 5.\n";
        }
    } while (pilihan != 5);

    return 0;
}
