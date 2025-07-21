#include<stdio.h>
#include<stdlib.h>

//DMA ==> Dynamic memory allocation

int main(){
    int *iptr,i;
    int size;

    printf("enter a size :\n");
    scanf("%d",&size);
    //MALLOC  ==> pr_name = (datatype_ptr *) malloc (size * sizeof(datatype_name))
    //malloc provide space how mcuch we wnat and also store garbage
    iptr= (int *)malloc(size * sizeof(int));
    printf("enter a %d  elemnts\n",size);
    for (int i = 0; i < size; i++)
    {
    scanf("%d",&iptr[i]);
    }
    printf("the numbers are store using malloc during runtime :%d\n",iptr[i]);
    
    for(int i=0;i<size;i++){
        printf("%d",iptr[i]);
    }

}