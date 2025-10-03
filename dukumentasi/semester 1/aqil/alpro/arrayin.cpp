#include <iostream>
//arrai dengan input user   
using namespace std;
int a[2][2];
int b[2][2];
int hasil[2][2];
string N[2][2]={{"satu","dua"},{"tiga","empat"}};
int main(){
    cout<<a[0][0];
    cout<<"nilai array a\n";
    for (int i=0; i<2;i++){
        for (int j=0;j<2;j++){
            cout<<"masukan ke kolom ke-"<<N[i][j]<<": ";
            cin>>a[i][j];
        }
    }
    cout<<"nilai array b\n";
    for (int i=0; i<2;i++){
        for (int j=0;j<2;j++){
            cout<<"masukan angka ke-"<<N[i][j]<<": ";
            cin>>b[i][j];
        }
    }
    for (int i=0;i<2;i++){
        for (int j=0;j<2;j++){
            for (int k=0;k<2;k++){
                hasil[i][j]=hasil[i][j]+(a[i][k]*b[k][j]);
               
            }
            cout<<hasil[i][j]<<" ";
        }
        cout<<"\n";
       
    }
    
    
        
    return 0;
}