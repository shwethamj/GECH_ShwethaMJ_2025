#include<stdio.h>
int main(){

    //factorial of number given by user
    int n;
    int fact=1;
    printf("enter a natural number\n");
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
        fact =fact * i; //or fact *=i;
    }
    printf("factorial of %d is %d\n",n,fact);
   

}
