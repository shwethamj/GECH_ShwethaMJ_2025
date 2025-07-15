#include<stdio.h>
int main(){
    int num,i,j,val;


    printf("enter the size of array\n");
    scanf("%d",&num);
    int  arr[num];

    printf("enter array\n");
    for(int i=0;i<num;i++){
        scanf("%d",&val); //or scanf("%d",&a[i]
        arr[i] = val;
    }
    for(int j=0;j<num;j++){
        printf(" the array elements are:\n");
        printf("%d\n",arr[j]);
    }

}
