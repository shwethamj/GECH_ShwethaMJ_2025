#include<iostream>
using namespace std;

class Area{
    int length ,breadth,height;
    public :
        int area;
    
       Area(){
        length =0;
        breadth=0;
        height =0;
        cout << "area is equal to 0";
       } 

       Area(int side){
        length =side;
        area = side *side;
        cout<< " Area of Square : "<< area<<endl;
       }

    //    Area(int len,int wid){
    //     length =len;
    //     breadth=wid;
    //     area = length *breadth;
    //     cout<< " Area of Recatangle  : "<< area<<endl;
    //    }

       Area(int len,int widt ,int hiegh){
          length =len;
        breadth=widt;
        height =hiegh;
        area = length *breadth *height;
        cout<< " Area of Cube  : "<< area<<endl;
       }

       //constructor// abstract method
       Area(int len,int bre);

};

//Scope resolution operator has beem used  to define the  parameter
// className::Constructor(parameter1,parameter2)
//implematation of abstract constructor

Area:: Area(int len,int bre){
     length =len;
        breadth=bre;
        area = length *breadth;
        cout<< " Area of Recatangle  : "<< area<<endl;
    }


int main(){
    int length ,height,breadth;
    Area square,rectangle, cube;
    

}
