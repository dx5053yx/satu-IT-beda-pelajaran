#include <iostream>
using namespace std;
typedef struct node *addres;
addres first;

struct node {
    int data;
    addres next;
};
addres ambil(){
    addres tmp = first;
    addres pindah;
    while(tmp->next->next!=NULL){
        tmp=tmp->next;
    }
    pindah=tmp->next;
    tmp->next=NULL;
    return pindah;
}

void after(addres ke,addres baru){
    addres tmp = baru;
    tmp->next=ke->next;
    ke->next=tmp;
}

addres alokasi(int data){
    addres tmp = new node;
    tmp->data=data;
    tmp->next=NULL;
    return tmp;
}
void inserfirst(addres baru){
        baru->next=first;
        first=baru;

}
void cetak(){
    addres tmp = first;
    while (tmp!=NULL){
        cout<<tmp->data<<endl;
        tmp=tmp->next;
    }
}

int main(){
    inserfirst(alokasi(10));
    inserfirst(alokasi(30));
    inserfirst(alokasi(20));
    inserfirst(alokasi(50));
    after(first,ambil());
    after(first->next,alokasi(100));
    cetak();
    return 0;
}