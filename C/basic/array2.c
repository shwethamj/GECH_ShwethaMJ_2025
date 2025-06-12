
// SUM OF EVEN AND ODD NUMBERS

#include<stdio.h>
int main(){
    int n ,i;
    int evensum=0 ,oddsum=0;
    printf("enter the number of elements in array:");
    scanf("%d",&n);
    int arr[n];
    printf("enter %d elements:\n",n);

    for(i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }

    for(i=0;i<n;i++){
       if(arr[i] %2 ==0){
        evensum += arr[i];
       }
       else{
        oddsum +=arr[i];
       }
    }
    printf(" sum of even numbers: %d\n",evensum);
    printf(" sum of odd numbers: %d\n",oddsum);
    return 0;
}