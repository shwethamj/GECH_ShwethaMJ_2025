/*
STRUCTURE:
=========
     structure is user defined datatype
     it stores multiple data of different datypes
 syntax:
        Struct name{
            int regnum;
            char name[10];
            char gender;
        };
            strcut struct_name s1,s2; // to access the reg num 
            ex: struct name ss1,s2;
dot operator==> access operator

UNION
=========
IT is simlar to structure but we can accees only one(ex :regnum or name) at time so they introduced structure

*/
#include<stdio.h>
int main(){
    // structure decalration
    struct Student{
        int id;
        char name[20];
        char branch[10];
        int sem;
    };

    // value inserting
    struct Student s1 ={1,"shwetha","CSE",8};
    struct Student s2 ={2,"sindhu","ISE",5};

    // dot opeartor == to access data
    printf("the s1 name : %s\n",s1.name);
    printf("the s1 branch : %s\n",s1.branch);
    printf("the s1 sem : %d\n",s1.sem);

    printf("the s2 name : %s\n",s2.name);
    printf("the s2 branch : %s\n",s2.branch);
    printf("the s2 sem : %d\n",s2.sem);


   
}
