/*
    POINTER  TO ARRAY
    =================
     int arr[5]={1,2,3,4,5};
    int *ptr;
    ptr =arr; arr= &arr[0] and arr stores the value of first element address

*/
#include<stdio.h>
int main(){
    int arr[5]={1,2,3,4,5};
    int *ptr;
    ptr =arr;
    printf("thh arr value : %p \n",arr); // o/p = 0061ff08 //arr also pointer in c and c++
    printf("thh adress of 0th element : %p \n",&arr[0]); //o/p =  0061ff08
    printf("thh arr value of ptr : %p\n",ptr); // o/p = 0061ff08

    // using arr
    printf("the value of first element using arr : %d\n",arr[0]);
    printf("the value of first element using arr : %d\n",0[arr]);
    printf("the value of first element using arr : %d\n",*arr);

    // using ptr
    printf("the value of first element using ptr[0] : %d\n",ptr[0]);
    printf("the value of first element using 0[ptr] : %d\n",0[ptr]);
    printf("the value of first element using *ptr : %d\n",*ptr);

    //using increment method
    ptr++; //index=1
    printf("the value using ptr: %d\n",*ptr);
    ptr=ptr+2; //index=1+2=3
    printf("the value  using ptr : %d\n",*ptr);
    *ptr=100;

    for (int i = 0; i < 5; i++)
    {
       printf("%d",i[arr]);
    }
    
    return 0; 
}