 #include <iostream>
 using namespace std;
 // Deklarasi Node Double Linked List
typedef struct tnode *address;
struct tnode {
address previous ;
int data;
address next;
 } node;

 address first;
 address last;

 // Method untuk alokasi memori node baru
 address alokasikan (int data_x) {
 address x = new tnode;
 x->previous = NULL;
 x->next = NULL;
 x->data = data_x;
 return x;
 }

 // Method Insert First
 void insertFirst (address baru) {
 if (first != NULL) {
 baru ->next = first;
 first -> previous = baru;
 first = baru;
 } else {
 first = baru;
 last = baru;
 }
 }

 // Method Insert Last
 void insertLast (address baru) {

 if (first != NULL) {
 last ->next = baru;
 baru ->previous = last;
 last = baru;
 } else {
 first = baru;
 last = baru;
 }
 }

 // Method Cetak
 void cetak () {
 address jalan = first;
 while (jalan != NULL) {
 cout << jalan ->data << endl;
 jalan = jalan ->next;
 }
 }

 void insertAfter(address ke,address baru){
   if (ke == NULL) return;
    baru->next=ke->next;
    baru->previous=ke;
    ke->next=baru;
    if (baru!=NULL){
      baru->next->previous=baru;
    }else{
      last=baru
    }
    
 }

 void deletfirst(){
    if (first==NULL) return;
    address tmp = first;
    if(first==last){
      first=NULL;
      last=NULL;
    }else{
    first=first->next;
    first->previous=NULL;
    }
    delete tmp;

 }

 void deletlast(){
   if(last==NULL)return;
   address tmp = last;
   if(first==last){
      first=NULL;
      first=NULL;
   }else{
    last=last->previous;
    last->next=NULL;

   }
   delete tmp;
 }

 void deletafter(address lama){
   if(lama==NULL || lama->next==NULL)return;
    address tmp = lama->next;
    lama->next = tmp->next;
    if(tmp != NULL){
      tmp->next->previous=lama;
    }else{
      lama=lama
    }
    delete tmp;
 }

 int main () {
 first = NULL;
 last = NULL;

 cout << "Insert First 10, 30, 50:" << endl;
 insertFirst ( alokasikan (10));
 insertFirst ( alokasikan (30));
 insertFirst ( alokasikan (50));
 insertFirst ( alokasikan (43));
 insertFirst ( alokasikan (234));
 insertFirst ( alokasikan (87));
 cetak ();

 cout << "Insert Last 70:" << endl;
 insertLast ( alokasikan (70));

 cout << "insert after 100:" << endl;
 insertAfter(first,alokasikan(100));
 cetak ();
 cout<< "deletfersst:"<<endl;
 deletfirst();
 cetak();
 cout<< "deletlast:"<<endl;
 deletlast();
 cetak();
 cout<< "deletlast:"<<endl;
 deletlast();
 cetak();
 cout<< "deletafter:"<<endl;
 deletafter(first);

 cetak();
 

 return 0;
 }