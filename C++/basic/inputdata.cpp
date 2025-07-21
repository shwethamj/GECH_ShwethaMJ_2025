#include<iostream>
using namespace std; // by using these we can skip the std in in and out //std::cout ==> cout
int main(){
    string  name;
    int age;

    cout << "enter your name";
    cin >>name;
    cout << "enter your age";
    cin >>age;

    cout<< "yur name is :  " <<name<< " and your age is : "<<age;
    return 0;
}