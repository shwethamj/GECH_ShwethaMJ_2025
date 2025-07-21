#include<stdio.h>
#include<stdlib.h>

//DMA ==> Dynamic memory allocation

int main(){
    int *iptr,i;
    int size,new_size;

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
    printf("Numbers stored using malloc:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", iptr[i]);
    }

    //REALLOC
    printf("\n--------------------------------------\n REALLOC\n");
    printf("enter a new size\n");
    scanf("%d",&new_size);

    iptr = (int*)realloc(iptr,new_size*sizeof(int));

    printf("enter a %d  elemnts\n",new_size);
    for (int i = 0; i < new_size; i++)
    {
    scanf("%d",&iptr[i]);
    }
    printf("Numbers stored using realloc:\n");
    for (int i = 0; i < new_size; i++) {
        printf("%d ", iptr[i]);
    }

    //FREE
    //free(ptr_name);
    free(iptr);
    
}