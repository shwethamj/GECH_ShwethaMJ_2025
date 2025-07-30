#include <stdio.h>
int main() {
    int num, i = 1, sum = 0;

    printf("Enter a number: ");
    scanf("%d", &num);

    while (i < num) {
        if (num % i == 0) {
            sum += i;
        }
        i++;
    }

    if (sum == num)
        printf("%d is a Perfect number.\n", num);
    else
        printf("%d is not a Perfect number.\n", num);

    return 0;
}
