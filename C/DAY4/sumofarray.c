#include <stdio.h>
int main()
{
    int size, val,sum=0;

    printf("enter the size of array\n");
    scanf("%d", &size);
    int arr[size];

    printf("enter array\n");
    for (int i = 0; i < size; i++)
    {
        scanf("%d", &val); // or scanf("%d",&a[i]
        arr[i] = val;
    }
    printf(" the original array elements are:\n");
    for (int j = 0; j < size; j++)
    {
        printf("%d\n", arr[j]);
    }

    //sum of array element
    for(int i=0;i<size;i++){
        sum += arr[i];
    }
    printf("the sum is : %d",sum);
}