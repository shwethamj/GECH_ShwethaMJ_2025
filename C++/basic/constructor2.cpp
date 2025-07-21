#include<iostream>
using namespace std;

class Multiply{
    private:
    int num1 , num2;
    public:
    int product;

    //setter
    void setvalue(int n1,int n2){
        num1=n1;
        num2=n2;
    }
    //getter
    void findproduct(){
        product=num1 *num2;
        cout << " the product of :"<<num1 <<" & "<<num2 <<" is : "<<product<<endl;
    }

    Multiply(){
        num1=0;
        num2=0;
        cout << "theconstructor has been called"<<endl;
    }
};

int main(){
    int a ,b;
    //object 
    Multiply m1,m2,m3,m4;
    // constructor called automicaly as soon as object created 
    //how many times ==> constructor will call how many object are there
    cout << "enter two numbers :"<<endl;
    cin >> a >> b;
    m1.setvalue(a,b);
    m1.findproduct();//no value given  
    m2.findproduct();
    

    m3.setvalue(20,30);//value passing
    m3.findproduct();
}