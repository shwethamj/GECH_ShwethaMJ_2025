#include<iostream>
using namespace std;
 class Addition
 {
 private:
    /* data */
    int a,b;
 public:
   int result;
   void setdata(int num1,int num2){
    a=num1;
    b=num2;
   }
   void getdata(){
    result =a +b;
    cout << "addittion of " << a << " and " << b<< "is : "<<result <<endl;   //endl is --> \n
   }
 };

 int main(){
    Addition a1,a2;
    int n1,n2,n3,n4;
    cout <<" enter any two number";
    a1.setdata(n1,n2);
    a1.getdata();

    cout <<" enter any two number";
    a2.setdata(n3,n4);
    a2.getdata();

 }
 

 