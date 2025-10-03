#include <iostream>
#include <cstdlib>

using namespace std;

int main(){
    while(true){
        cout<<"lamjut gak nih? (y/n) : ";
        char jawab;
        cin>>jawab;
        if(jawab=='y'){
            cout<<"dadunay: "<<rand()%6+1<<" dan "<<rand()%6+1<<endl;

        }else if(jawab=='n'){
            cout<<"yaudah sihh"<<endl;
            break;
        }else{
            cout<<"y/n doang. bisa baca?"<<endl;
        }
    }
    return 0;
}
    
