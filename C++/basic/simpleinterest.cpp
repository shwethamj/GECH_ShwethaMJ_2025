// SI = PTR/100  Rate;int
// SI = PTR*0.01  Rate;float

#include <iostream>
using namespace std;
class Simple{
    int principal, time,rateint;
    float ratedec;
    public : float simpleinterest;

    Simple()
    {
     principal=0;
        time=0;
        rateint=0;
        simpleinterest =(principal*time*rateint)/100;   
    }

    Simple(int p, int t,int r){
        principal=p;
        time=t;
        rateint=r;
        simpleinterest =(principal*time*rateint)/100;
        cout << "simple interset for integer" <<endl;
        cout << "principal" << principal<<endl;
        cout << "time " << time<<endl;
        cout << "rateint " << rateint<<endl;
        cout << "total amount " << simpleinterest<<endl<<endl;
    }

      Simple(int p, int t,float r){
        principal=p;
        time=t;
        ratedec=r;
        simpleinterest =(principal*time*ratedec)*0.01;
        cout << "simple interset for decimal" <<endl;
        cout << "principal" << principal<<endl;
        cout << "time " << time<<endl;
        cout << "rateint " << ratedec<<endl;
        cout << "total amount " << simpleinterest<<endl<<endl;
    }

    //destructor
    ~Simple(){
        cout<< "class work done\n";
    }
};

int main(){
    int amount,duration,integerrate;
    float decimalrate;
    Simple type1,type2;

    cout<<"enetr the principal and time: \n ";
    cin >>amount>>duration;
    cout<<"enter int rate: \n";
    cin >>integerrate;
     cout<<"enter decimal rate :\n";
    cin >>decimalrate;

    type1 =Simple(amount,duration,integerrate);
    type2 =Simple(amount,duration,decimalrate);
   

}

