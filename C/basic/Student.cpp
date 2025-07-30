#include<iostream>
using namespace std;
class Student{
    public:
    string name;
    public : int rollno;
    public :double marks;

    void display(){
        cout<<"name = " <<name<<" roll num = "<< rollno<<"marks = "<<marks<<endl;
    }
};

int main(){
    Student s1;
    s1.name ="shwetha";
    s1.rollno=4;
    s1.marks=35;
    s1.display();
}
