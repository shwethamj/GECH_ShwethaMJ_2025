/*
pointer:
=========
    pointer --> %p

declaration:
===========
     datatype *pointer_name;
     int *ptr;

initialization:
===============
    pointer_name = $avar_name;
    ptr = &a;

& --> address operator;
* --> dereference operator / value operator take the valueinside the addres which itstore

advantage : 
===========
    manipulate tha data inside array .list etx =using pointer
    this is not availablein other java ,pythton

 */

 // pointer with variable

 #include<stdio.h>
 int main(){
    //variable
    int a=20;
    
    //pointer
    int *ptr; //ptr is pointer that stores the address of integer 
              // and variable need to int a =20 not like float a=20;  bcs of above reson
    ptr = &a ;

    printf("the value of a : %d \n",a);
    printf("the addres of a : %d \n", &a);
    printf("the value of pointer : %p \n", ptr);
    printf("the address of ptr : %p \n", &ptr);
    printf("the value of a using pointer : %d \n", *ptr); //20 =*ptr= means value of a  
    printf("the value of a using pointer 1 : %d \n", *(&a));
    printf("the value of a using pointer 2 : %d \n", *(*(&ptr)));

    *ptr =50; //*ptr = value of a ==> so the value a 20 will replace by 50 ==> a =*ptr=50
    printf(" value of a using pointer after manupulation : %d\n",*ptr); //50
    printf("the value of a : %d \n",a); //50


 }
 
