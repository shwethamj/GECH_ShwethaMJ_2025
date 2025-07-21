#include<iostream>
using namespace std;

//SINGLE INHERITANCE
class Operation{
    private :
        string type_of_operation;
    public:
    int a ,b; 

        //constructor
    Operation(){
        type_of_operation ="NA";
        a=0;
        b=0;
    }  
    
    //parameter construtor
    Operation(string type){
        type_of_operation =type;
    }

    //setter
    void setint(int n1,int n2){
        a=n1;
        b=n2;
    }


    void showoperator(){
        cout << "we are performing the opeartionw "<< type_of_operation<< " operation " << a <<" and " << b <<endl;

       
    }
};

class Addition:public Operation{
    public : int num;

    void caluclate(){
        num = a+b; //accessing a b  by inheriting parentclass
        cout <<"the additin of "<<a <<" and "<< b <<" is  = "<<num<<endl;
    }
};

int main(){
    int num1,num2;
    string operationtype;

    Addition a1;

    cout<<"enter opearatin type  : \n";
    cin>>operationtype;

    //o1=operation(operationtype); // by using this it overwrite the value so we are getting the junk value it wont take value e]we given
     Operation o1(operationtype);
    cout<<"enter two numbers: \n";
    cin>> num1 >>num2;

    o1.showoperator();
    o1.setint(num1,num2);
    // o1= Operation(operationtype);
    o1.showoperator();

    a1.setint(num1,num2);
    a1.caluclate();
    a1.showoperator();

}