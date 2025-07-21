#include<iostream>
#include<string>
 int main()
{
    int age;
    float wieght;
    std::string name;
    char grade;

    /*
    //there is no format specifier in c++
    extension ==> .cpp
    run:
        g++ basic.cpp
        a

    */
    std::cout << "enter a age";
    std ::cin >> age;
    std :: cout << "enter your weight(in kgs)";
    std :: cin >>wieght;
    std ::cout<<"enter name";
    std:: cin >>name;
    std::cout <<"enter grade";
    std::cin >> grade ;

    std::cout << "u r name is :"<<name<<". you are : "<<age<< " years old "<<"u r weight is:  "<<wieght<< " kgs"<<"and has grade : "<<grade;
    return 0;
}
