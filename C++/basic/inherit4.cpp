#include<iostream>
using namespace std;

class Student{
    public: 
        string name;

    public:
        void setname(string sname){
            name=sname;
        } 
    void showmessage(){
        cout<< name<< " was a  student\n";
    }
};

//if we dont give any visibilityname so if take private as a default 
class Employee :public Student{
    public :


    void showdetails(){
        cout <<  name  << " is not working as a employee \n";

    }

};

int main(){
    string name_person;

    Student s1;
    Employee e1;

    cout<< "enter the name of the person : \n";
    cin>>name_person;

    s1.setname(name_person);
    s1.showmessage();

    //or without above one  we can directly give value to child (like below) and access the parent class
    //both above and below work as same
    e1.setname(name_person);
    e1.showdetails();
    e1.showmessage();


}