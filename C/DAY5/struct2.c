//user input taek

#include<stdio.h>
int main(){
    struct Internship{
        int regid;
        char name[10];
        char domain[10];
        float fees;
        int duaration;

    }i1,i2;

    printf("enter the deatils\n");
    printf("registration id : \n");
    scanf("%d",&i1.regid);
    printf("name: \n");
    scanf("%[^\n]",&i1.name);
    // scanf("%s",&i1.name)
    // fgets(i1.name,sizeof(i1.name),stdin)
    printf("domain: \n");
    scanf("%[^ \n]",&i1.domain);
    printf("fees: \n");
    scanf("%f",i1.fees);
    printf("duaration : \n");
    scanf("%d",&i1.duaration);

    printf("-------------------------\n the deatils are\n");
    printf("id:%d\t , has NAME: %s\t doing internship in domain :%s\t has fees : %f\t of duration: %d\n",i1.regid,i1.name,i1.domain,i1.fees,i1.duaration);



}