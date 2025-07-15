#include<stdio.h>

int main(){
    int n, i , max,min;
    printf("enter the number of elemtes: \n");
    scanf("%d",&n);
    int arr[n];
    printf("enter a %d elements: \n",n);

    for(i=0;i<n;i++){
        scanf("%d", &arr[i]);
    }
    min=max=arr[0];
    for(i=0;i<n;i++){
        if(arr[i]>max){
            max= arr[i];
        }
        if(arr[i]<min){
            min= arr[i];
        }
    }

 printf("the maximun element in the array is : %d\n",max);
 printf("the manimun element in the array is : %d\n",min);
}