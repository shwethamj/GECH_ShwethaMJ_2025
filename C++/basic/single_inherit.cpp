#include<iostream>
using namespace std;


//SINGLE INHERITANCE :
//base class
class Parent{
    public:
        string name;
    void showparentdetails(){
        cout <<"parent name : "<<name<<endl;
    }
};

//derived class
//syntax: ==> class derived_class : visibility_mode Base_class{}
class  Child : public Parent
{   
public:
    string childname;
    
    void showchilddetails(){
        cout<<"the child name : "<< childname <<endl;
    }
};

int main(){
    Parent p1;
    Child c1;

    p1.name="radha";
    c1.childname ="shwetha";


    p1.showparentdetails();
    c1.showchilddetails(); 
    c1.name="dileep";
    c1.showparentdetails();//child class can access the member function and datammbers of the base class
}



