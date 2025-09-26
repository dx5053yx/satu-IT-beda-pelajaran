#include <iostream>

using namespace std;
int tanggal,tahun,bulan,zodiak,umur;
int main(){

    cout<<"masukan tahun lahir; ";
    cin>>tahun;
    cout<<"masukan bulan lahir: ";
    cin>>bulan;
    cout<<"masukan tanggal lahir: ";
    cin>>tanggal;
    umur=2025-tahun;
    zodiak=30*bulan-30+tanggal;
    if (umur>+17){
        if (zodiak>=356 || zodiak<=19){
            cout<<"zodiak anda adalah capricorn";
        }else if (zodiak>=20 && zodiak<=49){
            cout<<"zodiak anda adalah aquarius";
        }else if (zodiak>=50 && zodiak<=79){
            cout<<"zodiak anda adalah pisces";
        }else if (zodiak>=80 && zodiak<=109){
            cout<<"zodiak anda adalah aries";
        }else if (zodiak>=110 && zodiak<=140){
            cout<<"zodiak anda adalah taurus";
        }else if (zodiak>=141 && zodiak<=171){
            cout<<"zodiak anda adalah gemini";
        }else if (zodiak>=172 && zodiak<=203){
            cout<<"zodiak anda adalah cancer";
        }else if (zodiak>=204 && zodiak<=234){
            cout<<"zodiak anda adalah leo";
        }else if (zodiak>=235 && zodiak<=265){
            cout<<"zodiak anda adalah virgo";
        }else if (zodiak>=266 && zodiak<=295){
            cout<<"zodiak anda adalah libra";
        }else if (zodiak>=296 && zodiak<=325){
            cout<<"zodiak anda adalah scorpio";
        }else if (zodiak>=326 && zodiak<=355){
            cout<<"zodiak anda adalah sagitarius";
        }
    }else{
        cout<<"maaf anda belum cukup umur";
    }
    return 0;
}