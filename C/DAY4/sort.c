#include <stdio.h>
int main()
{
    int size, val;

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

    // sorting(bubble sort = O(n^4))
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }

    printf(" the sorted array elements are:\n");
    for (int j = 0; j < size; j++)
    {
        printf("%d\n", arr[j]);
    }

    // ARRAY==>[12543]
    /* step 1 : i=0 ;j=0 <5 -tr
    arr[j]>arr[j+1]==> arr[0]>arr[1] ==> 1 >2 ==fal

    step 2 : i=0 ;j=1 <5 -tr
    arr[j]>arr[j+1]==> arr[1]>arr[2] ==> 2 >5 ==fal

    step 3 : i=0 ;j=2 <5 -tr
    arr[j]>arr[j+1]==> arr[2]>arr[3] ==> 5 >4 ==true
        temp=arr[j]; ==> temp =arr[2]=5  ==>arr[2] == empty
        arr[j]=arr[j+1]; ==> arr[2] = arr[3] ==> arr[2] =4
        arr[j+1]=temp; ==> arr[3] =temp ==> arr[3]=5


     ARRAY==>[12453]
    step 3 : i=0 ;j=3 <5 -tr
    arr[j]>arr[j+1]==> arr[3]>arr[4] ==> 4 >5 ==fal

    step 4 : i=0 ;j=4 <5 -tr
    arr[j]>arr[j+1]==> arr[4]>arr[5] ==> 5 >3 ==true
        temp=arr[j]; ==> temp =arr[4]=5  ==>arr[4] == empty
        arr[j]=arr[j+1]; ==> arr[4] = arr[5] ==> arr[4] =3
        arr[j+1]=temp; ==> arr[5] =temp ==> arr[5]=5

    ARRAY ==> [12435];
    step 5 : i=0 ;j=5 <5 -FALSE
    //  STOP J LOOP i++ happens

    //ARRAY ==> [12435];
    step 6 : i=1 ;j=0<5 --true
    arr[j]>arr[j+1]==> arr[0]>arr[1] ==> 1 >2 ==fal

    step 7 : i=1 ;j=1`<5 --true
    arr[j]>arr[j+1]==> arr[1]>arr[2] ==> 2 >4 ==fal

    step 8 : i=1 ;j=2<5 --true
    arr[j]>arr[j+1]==> arr[2]>arr[3] ==> 4 >5 ==tru
        temp=arr[j]; ==> temp =arr[2]=4  ==>arr[2] == empty
        arr[j]=arr[j+1]; ==> arr[2] = arr[3] ==> arr[2] =3
        arr[j+1]=temp; ==> arr[3] =temp ==> arr[3]=4

    ARRAY ==> [12345]
    step 9 : i=1 ;j=3<5 --true
    arr[j]>arr[j+1]==> arr[3]>arr[4] ==> 3 >4 ==fal
    //SAME REPEAT

    */
}
