#include <stdio.h>

int main() {
    int num, original, remainder, result = 0, n = 0, temp, power, i;

    printf("Enter a number: ");
    scanf("%d", &num);

    original = num;
    temp = num;

    // Step 1: Count the number of digits
    while (temp != 0) {
        temp /= 10;
        n++;
    }

    temp = num;

    // Step 2: Calculate the sum of digits raised to the power n
    while (temp != 0) {
        remainder = temp % 10;

        // Calculate remainder^n manually
        power = 1;
        for (i = 0; i < n; i++) {
            power *= remainder;
        }

        result += power;
        temp /= 10;
    }

    // Step 3: Check if Armstrong
    if (result == original)
        printf("%d is an Armstrong number.\n", original);
    else
        printf("%d is not an Armstrong number.\n", original);

    return 0;
}

