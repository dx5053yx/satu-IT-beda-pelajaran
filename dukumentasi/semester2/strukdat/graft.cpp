#include <iostream>
using namespace std;
 // Deklarasi Simpul untuk Vertex dan Edge
typedef struct tipes *address;
struct tipes {
address Left;
int INFO;
address Right;
 };

 address P, FIRST , LAST , Q, R;
 address PointS [5]; // Array penyimpan alamat masing -masing Vertex

 int main () {
 // Matriks Ketetanggaan ( Adjacency Matrix) beserta bobotnya
 // 0 berarti tidak ada jalur , angka selain 0 adalah bobot jalur
 int A[5][5] = {
 {0, 5, 0, 2, 0},
 {6, 0, 3, 0, 0},
 {0, 0, 0, 0, 9},
 {0, 0, 12, 0, 7},
 {0, 14, 0, 0, 0}
 };
 char NmS [5] = {'A', 'B', 'C', 'D', 'E'};
 int I, J;

 // 1. Membangun Simpul Vertex pertama
 P = new tipes;
 P->INFO = NmS [0];
 FIRST = P; LAST = P;
 P->Left = NULL; P->Right = NULL;
 PointS [0] = P;
 cout << " Membangun Graph ...\n" << (char)P->INFO << " di " << PointS [0] << endl;

 // 2. Membangun Simpul Vertex berikutnya

 for (I = 1; I <= 4; I++) {
 P = new tipes;
 P->INFO = NmS[I];
 LAST ->Left = P; LAST = LAST ->Left;
 P->Left = NULL; P->Right = NULL;
 PointS[I] = P;
 cout << (char)P->INFO << " di alamat " << PointS[I] << endl;
 }

 // 3. Membangun Simpul Edge berdasarkan Matriks A
 Q = FIRST;
 for (I = 0; I <= 4; I++) {
 R = Q;
 cout << "\nVertex " << (char)Q->INFO << " ...." << endl;
 for (J = 0; J <= 4; J++) {
 if (A[I][J] != 0) {
 P = new tipes;
 P->INFO = A[I][J]; // Simpan bobot jalur
 R->Right = P; // Sambungkan ke edge/vertex sebelumnya
 P->Left = PointS[J]; // Pointer Left menunjuk ke Vertex Tujuan
 P->Right = NULL;

 cout << " berhubungan dengan " << (char)P->Left ->INFO
 << ": bobot " << P->INFO << ";" << endl;
 R = P;
 }
 }
 Q = Q->Left;
 }
 return 0;
 }