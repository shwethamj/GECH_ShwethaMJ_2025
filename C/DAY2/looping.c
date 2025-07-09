#include<stdio.h>
/*

LOOPE STATEMENT ==> to avoid code repeatation
    1.FOR ==> if we know the  number iteration
        for(init;condition;incre/decrement){
            //code        
        }
    2.WHILE ==> dont know the number of iteration/ precheck condition 

    3.DOWHILE ==> at least one time print loop/postcheck condition
*/
 int main(){
    int a;

    //for print 1-10
    // for(int a=0;a<=10;a++){
    //     printf(" even number from 0-50 : %d\n",a);
    // }

    //for even number print from 0-50
    for(int a=0;a<=50;a++){
        if(a%2==0){
        printf(" even number from 0-50 : %d\n",a);
    }
    }


    //table of user input print
    int b;

    printf("enter a number\n");
    scanf("%d",&b);

    for(int n=1;n<=10;n++){
        printf("%d * %d =%d\n",b,n,b*n);
        
    }
 }