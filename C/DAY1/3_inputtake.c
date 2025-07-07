#include<stdio.h>
int main(){
    //for printing the variable value
    int var=10;
    printf("the var value : %d\n",var);
    printf("\n");

    // user input taking & printing
    printf("---------------------------------\n taking user input\n");
    int a;
    printf("enter a number\n");
    scanf("%d",&a);
    printf("the number given by user is: %d\n",a);

    // for float
    printf("---------------------------------\n");
    float b;
    printf("enter a float number\n");
    scanf("%f",&b);
    printf("the float number is: %f",b);
    return 0;
}