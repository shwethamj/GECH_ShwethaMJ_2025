#include<stdio.h>
int main(){
     int num , original,reversed=0,digit;
     printf("enter a number to check a palindrome\n");
     scanf("%d",&num);

     original=num;

     do 
     {
        digit = num % 10;
        reversed = reversed*10 + digit;
        num =num/10; 
     }while (num !=0);
    

     if(original==reversed){
        printf("%d is palindrome \n",original);

     }
     else{
        printf("%d is not a palindrome \n",original);
     }
     return 0;
     
}