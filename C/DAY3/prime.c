#include <stdio.h>

int main() {
    int num, i = 2, count = 0; //count: counts how many times num is divisible by numbers other than 1 and itself

    printf("Enter a number: ");
    scanf("%d", &num);

    while (i < num) {
        if (num % i == 0) {
            count++;
        }
        i++;
    }

    if (num > 1 && count == 0) {
        printf("This is a prime number.\n");
    } else {
        printf("This is not a prime number.\n");
    }

    return 0;
}
