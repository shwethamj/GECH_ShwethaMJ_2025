#include <stdio.h>

int main() {
    int num, original, remainder, sum = 0, i, fact;

    printf("Enter a number: ");
    scanf("%d", &num);

    original = num;

    while (num != 0) {
        remainder = num % 10;

        // Calculate factorial of the digit
        fact = 1;
        i = 1;
        while (i <= remainder) {
            fact *= i;
            i++;
        }

        sum += fact;
        num /= 10;
    }

    if (sum == original)
        printf("%d is a Strong number.\n", original);
    else
        printf("%d is not a Strong number.\n", original);

    return 0;
}
