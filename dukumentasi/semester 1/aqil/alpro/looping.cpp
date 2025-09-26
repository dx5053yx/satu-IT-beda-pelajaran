#include <iostream>
using namespace std;
int bintang;
int main() {
    cout << "Masukkan jumlah bintang: ";
    cin >> bintang;
   for (int i = 1; i <= bintang; i++) {
      for (int j = 1; j <= i; j++) {
         cout << "* ";
      }
      cout << endl;
   }
}