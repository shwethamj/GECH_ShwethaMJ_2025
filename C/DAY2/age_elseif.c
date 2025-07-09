#include <stdio.h>
int main()
{
    int age;

    printf("enter age\n");
    scanf("%d", &age);

    if (age >= 0 && age <= 12)
    {
        printf("it is child");
    }
    else if (age >= 13 && age <= 19)
    {
        printf("it is teenager");
    }
    else if (age >= 20 && age <= 59)
    {
        printf("person is adult");
    }
    else if (age >= 60)
    {
        printf("person is senior");
    }
    else if (age < 0)
    {
        printf("invalid");
    }
    else
    {
        printf("give correct age");
    }
}