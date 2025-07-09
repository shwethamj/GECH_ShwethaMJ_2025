#include <stdio.h>
int main()
{
    /*
     WHILE
     ======
        * when we dont know the iteration
        * synatax =>
            initialize (int n,i=0;)

            while(condition){
                //code
                //increment /  decrement
            }

    */
   
    // sum of n natural number using while
    int n, i = 0;
    int sum = 0;
    printf("enter a natural number\n");
    scanf("%d", &n);

    while (i <= n)
    {
        sum += i;
        i++;
    }
    printf("the sum of %d natural number is : %d\n", n, sum);

    return 0;
}