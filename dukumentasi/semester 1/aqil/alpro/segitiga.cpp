#include <iostream>

using namespace std;
int bintang;
int main(){
    cout<<"masukan jumlah bintang: ";
    cin>>bintang;
    for (int i=1;i<=bintang;i++){
        for (int spasi=bintang;spasi>i;spasi--){
            cout<<" ";
        }
        for (int j=1;j<=i;j++){
            cout<<"* ";
        }
        cout<<endl;
    }
    return 0;
}