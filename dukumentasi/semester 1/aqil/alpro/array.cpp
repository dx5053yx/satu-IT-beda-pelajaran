#include <iostream>

using namespace std;
int a[2][2]={{6,3},{10,13}};
int b[2][2]={{9,16},{19,8}};
int main(){
    for (int i=0;i<2;i++){
        for (int j=0;j<2;j++){
            cout<<a[i][j]*b[i][j]<<" ";
        }
        cout<<endl;
    }
    return 0;
}