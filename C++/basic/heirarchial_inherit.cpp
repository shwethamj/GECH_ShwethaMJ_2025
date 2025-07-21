#include<iostream>
using namespace std;

//heirachial inheritance  --> one parent extends to multiiple childs

class  Animal {
    public :
    string foodtype,animaltype;

    void setanimal(string food,string type){
        foodtype =food;
        animaltype=type;
    }

    void showanimal(){
        cout << "this animal type  is : "<< animaltype <<" and it is a : "<<foodtype<<endl;
    }
};

class Dog : public Animal{
    public:
    string dog_fod;

    void feeddog(string dogifood){
        dog_fod=dogifood;
    }

    void showdog(){
        cout << " the animal is a  : " << animaltype << "  and  it eats " <<dog_fod <<endl;
    }
};

class cow : public Animal{
    public:
    string cow_fod;

    void feeddog(string dogifood){
        cow_fod=dogifood;
    }

    void showcow(){
        cout << " the animal is a  : " << animaltype << "  and  it eats " <<cow_fod <<endl;
    }
};

int main(){
    string a_food , a_type, d_food,c_food;

    Animal a1;
    Dog d1;
    cow c1;
    cout<<"enter tha animal details as follows : \n";
    cout << "FoodType(Herbivorous,carnivorous & omniorous):\n";
    cin >>a_food;

    cout<<"2. animaltype (wild/pet animal) : \n ";
    cin>>a_type;
    cout<<"3. type of food(ex:pedigree) : \n";
    cin>>d_food;

    a1.setanimal(a_food,a_type);
    a1.showanimal();

    d1.setanimal(a_food,a_food);
    d1.feeddog(d_food);
    d1.showdog();

    c1.setanimal(a_food,a_food);
    c1.feeddog(d_food);
    c1.feeddog(c_food);
    c1.showcow();
    c1.showanimal();


}