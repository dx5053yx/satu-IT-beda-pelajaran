#include <iostream>

using namespace std;
int angka=31;
int tebak;
int tebakan[2]={0,100};
int main(){
    cout<<"selamat datang di permainan tebak angka\n";
    cout<<"silahkan tebak angka antara 1-100\n";
    while(tebak!=angka){
        cout<<"masukan tebakan anda: ";
        cin>>tebak;
        if(tebak<angka){
            cout<<"terlalu kecil\n";
            cout<<"coba tebak lagi :"<<(tebakan[0]+tebak)<<"-"<<tebakan[1]<<endl;
        }else if(tebak>angka){
            cout<<"terlalu besar\n";
            cout<<"anda lebih :"<<(tebakan[1]-tebak)<<"-"<<tebakan[0]<<endl;
        }else{
            cout<<"selamat tebakan anda benar\n";
            break;
        }
    }
    return 0;
}