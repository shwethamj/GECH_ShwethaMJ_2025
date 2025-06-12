#include<stdio.h>
int main(){
    int n;
    printf("enter the number of elements : \n");
    scanf("%d",&n);

    int arr[n];
    printf("enter the %d elemnts : \n",n);
    for(int i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }

    int *ptr=arr;
    int max =*ptr;

    for(int i= 1;i<n;i++){
        ptr++;
        if(*ptr>max){
            max=*ptr;
        }
    }
    printf("the maximun element is  : %d\n",max);
    return 0;
}