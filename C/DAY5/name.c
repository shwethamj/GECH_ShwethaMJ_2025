//String DMA
 
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main(){
    char* fname; //Char Pointer
    char* lname; //Char Pointer
    int fname_size, lname_size;
    printf("Enter the size/length of First Name:\n");
    scanf("%d", &fname_size);
    printf("Enter the size/length of Last Name:\n");
    scanf("%d", &lname_size);
    fname = (char*) malloc(fname_size * sizeof(char));
    lname = (char*) malloc(lname_size * sizeof(char));

    if(fname == NULL || lname == NULL){
        printf("Dynamic Memory Allocation didn't occur\n");
    }

    printf("Enter your First Name:");
    scanf(" %s", fname);  //3rd method for string input

    printf("Enter your Last Name:");
    scanf(" %[^\n]", lname);

    printf("Your name is %s", strcat(fname, lname));
    free(fname);
    free(lname);
}
