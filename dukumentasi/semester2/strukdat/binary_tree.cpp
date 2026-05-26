#include <iostream>
using namespace std;
 // Deklarasi Simpul Pohon Biner
typedef struct Simpul *Tree;
struct Simpul {
Tree Kiri;
char Info;
Tree Kanan;
 };

 Tree alokasikan (char data) {
 Tree P = new Simpul;
 P->Info = data;
 P->Kiri = NULL;
 P->Kanan = NULL;
 return P;
 }

 void preOrder(Tree root) {
 if (root != NULL) {
 cout << root ->Info << " ";
 preOrder(root ->Kiri);
 preOrder(root ->Kanan);
 }
 }

 void inOrder(Tree root) {
 if (root != NULL) {
 inOrder(root ->Kiri);
 cout << root ->Info << " ";
 inOrder(root ->Kanan);
 }
 }

 void postOrder (Tree root) {
 if (root != NULL) {
 postOrder (root ->Kiri);
 postOrder (root ->Kanan);
 cout << root ->Info << " ";
 }
 }

 int main () {
 Tree root = alokasikan ('A');
 root ->Kiri = alokasikan ('B');
 root ->Kanan = alokasikan ('C');
 root ->Kiri ->Kiri = alokasikan ('D');
 root ->Kiri ->Kanan = alokasikan ('E');

 cout << " Kunjungan Pre -Order : "; preOrder(root); cout << "\n";
 cout << " Kunjungan In -Order : "; inOrder(root); cout << "\n";
 cout << " Kunjungan Post -Order : "; postOrder (root); cout << "\n";
 return 0;
 }