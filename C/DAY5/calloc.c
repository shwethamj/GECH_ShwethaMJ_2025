#include<stdio.h>
#include<stdlib.h>
//DMA ==> Dynamic memory allocation

int main(){
    float *fptr;
    int num,i;

    printf("enter a size :\n");
    scanf("%d",&num);
    //CALLOC  ==> pr_name = (datatype_ptr *) calloc (size , sizeof(datatype_name))
    //calloc provide space how mcuch we wnat and not store garbage
    fptr= (float *)calloc(num , sizeof(float));
    printf("enter a %d  elemnts\n",num);
    for (int i = 0; i < num; i++)
    {
    scanf("%d",&fptr[i]);
    }

    printf("allocated value using Calloc during runtime :\n");
    for(int i=0;i<num;i++){
        printf("%d",fptr[i]);
    }


}