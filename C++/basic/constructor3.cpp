#include<iostream>
using namespace std;

class Employee{

    private:
    int empid;
    string dept;
    public:
    string name, designation;

    //no-args constructor/default 
    Employee(){
        empid=0;
        dept ="NA";
        name = "NA";
        designation ="NA";
        cout << "default constructor has called \n";
    }

    //parameter constructor (act as setter)
    Employee(int e_id,string e_name,string e_dept,string e_designation){
        empid =e_id;
        dept =e_dept;
        name=e_name;
        designation=e_designation;
        cout<<"4 parameter constructor called\n";

    }

    //for 2 parameter --> called constructor overloading
    Employee(int e_id ,string e_dept){
        empid =e_id;
        dept =e_dept;
        name="NA";
        designation="NA";
        cout<<"2 parameter constructor called\n";

    }

    void showDetails(){
        cout<< "welcome " <<name <<
        "! your id is : "<<empid<<
        "  you will be working in  " << dept <<
        "  as a  "<<designation<<endl;
    }

};

int main(){
    Employee e1,e2,e3,e4;
    int empid;
    string dept;
    cout<< "enetr the deatils of employee (ID ,name ,departement , designation):\n";
    cin >> empid >> e1.name >> dept >> e1.designation ;

    //passing the  arguments to the parameter constructor
    // ob_name = class_name(arg1,arg2....);
    e1 = Employee(empid,e1.name,dept,e1.designation);
    e1.showDetails(); //input data display

    e2.showDetails(); //deafult constructor call

    e3 = Employee(2,"swhetha","cse","hassan"); //parameter constructor call
    e3.showDetails();

    
    e4 = Employee(2,"swhetha"); //parameter constructor call
    e4.showDetails();

    return 0;

}