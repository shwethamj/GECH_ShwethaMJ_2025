/**
 * function types
 * 1. no argument and no return value
 * 
 */

 // no argument no return value
 #include<stdio.h>
  void hello(){
    printf("\n no arg and no return value: HELLO \n");
    printf("\n ");

}
//2. with argument and no return value
void display(int num){
    printf("with arg and no return value \n");
    printf("the number is : %d\n",num);
    printf("\n");
}

//3. no arg and with return value
int get(){
    int n;
    printf("no args and with return value \n");
    printf("enter a number:");
    scanf("%d",&n);
    return n;
}

// with arg and return value:
 int add(int a , int b){
    return a +b ;
 }


int main(){
    //1.
    hello();

    //2.
    int x=5;
    display(x);
  

    //3.
    int res = get();
    printf("entered :%d\n",res);
    printf("\n");

    //4.
    int a,b;
    printf("with args and return value \n");
    printf("enter two numbers: \n");
    scanf("%d %d",&a,&b);
    int result = add(a,b); // function call
    printf("the sum of %d and %d is %d ",a,b,result);
    
    return 0;
}