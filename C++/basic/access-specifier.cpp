//Access Specifier ==> public ,private & protected
// if i dont dont decalre any acess specifiers then it is private 
#include<iostream>
using namespace std;

class Train{
    private :
        string aadar,phone;
    public :
        string name,address,source, destination,date,time;
        int age;
        
    //private can not be access directly outside class we  need to create method to access
    void setDeatils(string a_no,string p_no){
        aadar= a_no;
        phone = p_no;
    } 
    void getDeatils(){
        cout << "  the deatails :\n";
        cout << "Name :"<<name << "\n";
        cout << "address :"<<address << "\n";
        cout << "source  :"<<source << "\n";
        cout << "destination :"<<destination << "\n";
        cout << "date :"<<date << "\n";
        cout << "time :"<<time << "\n";
        cout << "age :"<<age<< "\n";
        cout << "Addar NUMber : " <<aadar<<"\n";
        cout << "phone number : "<<phone<< "\n";
    }
};

int main(){
    Train t;
    string phone_num, addar_num;

    cout << "enter deatils \n";
    cout<< "name : ";
    cin>> t.name;
    cout<< "address : ";
    cin>> t.address;
    cout<< "source : ";
    cin>> t.source;
    cout<< "destination : ";
    cin>> t.destination;
    cout<< "date : ";
    cin>> t.date;
    cout<< "time : ";
    cin>> t.time;
    cout<< "age : ";
    cin>> t.age;

    // it will not dislay only take input
    cout<< "adar : ";
    cin>> addar_num;
    cout<< "phone_num : ";
    cin>> phone_num;
    // t.setDeatils( "45666777","984728646648") //manual 
    t.setDeatils(addar_num,phone_num);

    t.getDeatils();
    
}