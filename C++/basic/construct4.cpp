#include<iostream>
using namespace std;

//constructor overloading ===> using same constructor with different parameters
class Add{

    private:
    int a,b,c;
    public:
    int result;

    //default constructor
    Add(){
        a=0;
        b=0;
        c=0;
        result= a+b+c;
        cout<<"default constructor\n";
    }

    //1 parameter
     Add(int n1){
        a=n1;
        b=0;
        c=0;
        result = a +b +c;
        cout<<"1 parameter constructor \n";
     }
    
    //2 parameter
     Add(int n1,int n2){
        a=n1;
        b=n2;
        c=0;
        result = a +b +c;
        cout<<"2 parameter constructor \n";
    }
    
    //3 parameter
    Add(int n1,int n2,int n3){
        a=n1;
        b=n2;
        c=n3;
        result = a +b +c;
        cout<<"3 parameter constructor \n";
    }

    void display(){
        cout <<" the sum of  : "<<a<< "  and "<<b<< "  and " << c << " is "<<result<<endl; 
    }
    //  /t ==> tab space

};

int main(){
    Add a1,a2,a3,a4;
    int a,b,c;

    cout<<"enter  3 numbers \n";
    cin >>  a  >> b >>c ;  //which declated in main()

    a1 = Add(a,b,c); //user input ==> abc(which decalred in main() ) is passing as a parameter
    a1.display();

    a2.display();

    a3= Add(4,5);
    a3.display();

    a4 = Add(10);
    a4.display();


}
