#include <iostream>

using namespace std;
int n;
int hasil;
int faktorial(int bil){
    int hasil=1;
    for (int i=1;i<=bil;i++){
        hasil=hasil*i;
    }
    return hasil;
}

int main(){
    cout<<"masukin mass: ";
    cin>>n;
    hasil=faktorial(n);
    cout<<hasil<<endl;

    return 0;
}