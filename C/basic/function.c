

    /**
     * FUNCTION IN C :
      ================
      1.FUNCTION PROTOTYPE :
        ---> It is used by the compiler to know some where else thier isfumction in the code 
        return_type function_name(parameters);

        ex: void add(int a , int b);

     2.FUNCTION DEFINITION :
        ---> return_type function_name(parameter){
                // code
              }

              void add(int a, int b){
                printf("the sum is : ",a+b)

              } 

     3. FUNCTION CALL :
        ---> function_name(argument);
                add(2,1); 
     */
#include<stdio.h>
int add (int num1, int num2 ); // function declaration

int main(){
    int a ,b;
    printf("enter two numbers: \n");
    scanf("%d %d",&a,&b);
    int res = add(a,b); // function call
    printf("the sum of %d and %d is %d ",a,b,res);
     return 0 ; //  means termination or successful execution
}

    int add(int num1 , int num2){
        return num1 + num2;
    }
