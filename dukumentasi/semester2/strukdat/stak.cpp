#include <iostream>
using namespace std;
 #define MAXSTACK 2
 typedef struct {
    int item[MAXSTACK];
    int count;
} Stack;

 Stack tumpukan ;

 bool isFull(Stack *x) {
 if ((x->count) >= MAXSTACK)
 return true;
 return false;
 }

 bool isEmpty(Stack *x) {
 if ((x->count) == 0) {
 return true;
 }
 return false;
 }

 void membuatStack (Stack *x) {
 x->count = 0;
 }

 void push(int data , Stack *x) {
 if (isFull(x)) {
 cout << "Stack Penuh\n";
 } else {
 x->item[x->count] = data;
 ++(x->count);
 cout << "berhasil memasukan \n";

 }
 }
 void pop(Stack *x){
    int a;
    if(isEmpty(x)){
        cout<< "datakosong\n";
    }else{
        --(x->count);
        a = x->item[x->count];
        cout<< "data yang dihapus adalah : " << a<<endl;
        x->item[x->count];
    }
 }

 void cetak () {
 int i;
 for (i = 0; i < MAXSTACK; i++) {
 cout << "isi index " << i << " : " << tumpukan.item[i] << endl;
 }
 }

 int main () {
 membuatStack (& tumpukan);
push (3, &tumpukan); push (5, &tumpukan);
push (6, &tumpukan); push (7, &tumpukan);
cetak ();
 pop (&tumpukan); cetak ();
pop (&tumpukan);
pop (&tumpukan); pop (&tumpukan);
cetak ();
 return 0;
 }