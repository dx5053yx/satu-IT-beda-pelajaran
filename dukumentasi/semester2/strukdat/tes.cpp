#include <iostream>
using namespace std;
typedef struct node *address;
address firs,last = NULL;
struct node
{
     int data;
     address next;
     address prov;
};

address alokasi(int data){
    address baru = new node;
    baru->data=data;
    baru->next=NULL;
    baru->prov=NULL;
    return baru;
}
void inferst(address baru){
    if (firs != NULL){
        baru->next=firs;
        firs->prov=baru;
        firs = baru;
    }else{
        firs=baru;
        last=baru;
    }
}
void inlast(address baru){
    if(last != NULL){
        baru->prov=last;
        last->next=baru;
        last=baru;
    }else{
        firs=baru;
        last=baru;
    }
}
void inafter(address tuju,address baru){
    if (firs==NULL) return;
    baru->next = tuju->next;
    baru->prov = tuju;
    tuju->next = baru;
    if (baru!=NULL){
        baru->next->prov = baru;
    }else{
        last = baru;
    }
}
void delfirst(){
    if(firs == NULL)return;
    address tmp = firs;
    if(firs == last){
        firs = NULL;
        last = NULL;
    }else{
        firs = firs->next;
        firs->prov = NULL;
    }
    delete tmp;
}
void dellast(){
    if(last==NULL)return;
    address tmp = last;
    if(last==firs){
        firs=NULL;
        last=NULL;
    }else{
        last = last->prov;
        last->next=NULL;
    }
    delete tmp;
}
void delafter(address lama){
    if (lama == NULL || lama->next==NULL ) return;
    address tmp = lama->next;
    lama->next=lama->next->next;
    if (tmp->next!=NULL){
        tmp->next->prov = lama;
    }else{
        lama = lama;
    }
}
void cetak(){
    address cetak = firs;
    while(cetak!=NULL){
        cout<<cetak->data<<endl;
        cetak = cetak->next;
    }
}
int main(){
    inferst(alokasi(10));
    inferst(alokasi(34));
    inferst(alokasi(67));
    inferst(alokasi(76));
    inferst(alokasi(97));
    inlast(alokasi(45));
    inafter(firs->next,alokasi(90));
    delfirst();
    dellast();
    delafter(firs->next);
    cetak();
    return 0;
}