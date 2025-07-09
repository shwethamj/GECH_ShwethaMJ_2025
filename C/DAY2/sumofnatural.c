#include<stdio.h>
int main(){

    //sum of n natural number(start from 1) given by user
    int n;
    int sum=0;
    printf("enter a natural number\n");
    scanf("%d",&n);

    for(int i=1;i<=n;i++){
         sum =sum + i; //or sum +=i;
 }
 
    printf("sum of number  is %d\n",sum);
    printf(" or using formula : %d",n*(n+1)/2);
    return 0;
}