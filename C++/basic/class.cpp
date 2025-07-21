#include<iostream>
using namespace std;

/*
    Syntax for decaring class 
        class Class_name{
            data member decaration
            member function
        }
*/
class Student{
    
    public :    //access specifeier- public
    //data members
    int age ;
    string name , college,branch;
    char   section;

    // member function
    void print(){
        cout << "my name is  : " <<name<<" . i'm studing in : " << branch << " ,at " << college<<" , in section : "<< section <<" .\n";
    }

};

int main(){
    //object has been creting
    // Syntax for creating object 
    // Class_name obejct_name ;  // class_naem obj1 , obj2,obj3 ;
    Student std1 ,std2,std3;
    std1.name = "shwetha";
    std1.branch ="cse";
    std1.college ="gech";
    std1.section = 'A';
    std1.print();  //to print details call method name which decalred in class

    std2.name = "Nitya";
    std2.branch ="Ece";
    std2.college ="gech";
    std2.section = 'B';
    std2.print();

    //user input taking    
    cout << "enter name : \n";
    cin >> std3.name;
    cout << "enter college :\n";
    cin>> std3.college;
    cout << "enter branch : \n";
    cin >> std3.branch;
    cout << "eneter section : \n";
    cin >> std3.section;
    cout << "my name is  : " <<std3.name<<" . i'm studing in : " << std3.branch << " ,at " << std3.college<<" , in section : "<<std3.section <<" .\n";
}