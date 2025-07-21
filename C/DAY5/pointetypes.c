#include<stdio.h>
int main(){

    int a=50;
    //1.wild pointer
    int *ptr1 ; //wild ppinter //it takes random //it taks different at every time run
    printf(" wild pointer 1 : %d \n", ptr1); 

    //2.null pointer
    int *ptr2 =NULL; //null pointer 
    printf("NULL pointer 2 : %d \n",ptr2);

    //3.void pointer
    //void pointer //datatype can be changed when we want use a diiferent dattaypes
    //typecasting can donelater when and where we want ==>syntax ==>*(dattype)(ptr_name)
    //ex: *(int)(ptr) ==>void pointer to --> int pointer
    //*(float)(ptr) ==> void pointer --> float pointer
    void *ptr3=NULL; 
    printf("void pointer 2 : %d \n",ptr3);
    ptr3=&a;  
    printf("void integer\n",*(int *)(ptr3),ptr3);


}