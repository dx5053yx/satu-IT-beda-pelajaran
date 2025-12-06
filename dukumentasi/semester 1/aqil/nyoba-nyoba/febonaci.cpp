#include <iostream>

using namespace std;

//menggunakan rekursif
int fibonacci(int n) {
    if (n <= 1){
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}
//menggunakan loop
int fibonacciLoop(int n) {
    if (n <= 1) {
        return n;
    }
    int a = 0, b = 1, fib;
    for (int i = 2; i <= n; i++) {
        fib = a + b;
        a = b;
        b = fib;
    }
    return fib;
}

int main() {
    int n, l;
    cout << "Masukkan posisi deret Fibonacci yang diinginkan: ";
    cin >> n;
    cout << "Masukkan posisi deret Fibonacci yang diinginkan (loop): ";
    cin >> l;
    cout << "Angka Fibonacci pada posisi " << n << " adalah " << fibonacci(n) << endl;
    cout << "Angka Fibonacci pada posisi " << l << " adalah " << fibonacciLoop(l) << endl;
    return 0;
}