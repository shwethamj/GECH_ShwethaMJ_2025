#include<stdio.h>
int main(){

    //SWAPPING OF TWO NUMBER USING POINTER
    
    int x =5,y=6,temp;
    int *a ,*b;

    a=&x;
    b=&y;

    temp=*a;
    *a=*b;
    *b=temp;
    printf("\n");
    printf("after swaping : x = %d and y= %d\n",x,y);
    return 0;

    
}