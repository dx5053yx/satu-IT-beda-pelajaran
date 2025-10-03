#include <iostream>

using namespace std;
int saldo = 1000000000;
int cek, tarik, setor, pilihan;
int main() {
	cout << " anda sekarang memiliki saldo sebesar: " << saldo << endl;
	while(true) {
		cout << " selamat datang dibank abc!!!\n";
		cout << " masukan 1 untuk cek saldo\n masukan 2 untuk tarik saldo\n masukan 3 untuk setor saldo\n tekan 4 untuk keluar\n ";
		cin >> pilihan;
		if (pilihan == 1) {
			cout << "saldo anda adalah: " << saldo << endl;
		}
		else if (pilihan == 2) {
			cout << "masukan jumlah saldo yang ingin di tarik: ";
			cin >> tarik;
			if (tarik > saldo) {
				cout << "saldo anda tidak mencukupi\n";
                break;
			}
			else {
				saldo = saldo - tarik;
				cout << "saldo anda sekarang adalah: " << saldo << endl;
			}
		}
		else if (pilihan == 3) {
			cout << "masukan jumlah saldo yang ingin di setor: ";
			cin >> setor;
			saldo = saldo + setor;
			cout << "saldo anda sekarang adalah: " << saldo << endl;
		}
		else {
			cout << "terima kasih telah menggunakan layanan kami\n";
            break;
		}
	}
	return 0;

}



