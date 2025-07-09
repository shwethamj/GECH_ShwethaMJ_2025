#include<stdio.h>
int main(){
    
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

    // printf("---------------------------------\n");
    // String c;
    // printf("enter a String number\n");
    // scanf("%s",&c);
    // printf("the float number is: %s",c);
    // return 0;

    printf("---------------------------------\n");
    char c;
    printf("enter a String number\n");
    scanf("%c",&c);
    printf("the float number is: %s",c);
    return 0;

    printf("---------------------------------\n");
    double d;
    printf("enter a String number\n");
    scanf("%ld",&d);
    printf("the float number is: %ld",d);
    return 0;
    
}