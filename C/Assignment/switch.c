#include <stdio.h>

int main() {
    int choice;
    float a, b;

    // Enter initial numbers
    printf("Enter two numbers: ");
    scanf("%f %f", &a, &b);

    do {
        printf("\n--- Menu ---\n");
        printf("1. Add\n");
        printf("2. Subtract\n");
        printf("3. Divide\n");
        printf("4. Multiply\n");
        printf("5. Switch numbers\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Result: %.2f + %.2f = %.2f\n", a, b,( a + b));
                break;
            case 2:
                printf("Result: %.2f - %.2f = %.2f\n", a, b, (a - b));
                break;
            case 3:
                if (b != 0)
                    printf("Result: %.2f / %.2f = %.2f\n", a, b,( a / b));
                else
                    printf("Error: Division by zero is not allowed.\n");
                break;
            case 4:
                printf("Result: %.2f * %.2f = %.2f\n", a, b, (a * b));
                break;
            case 5:
                printf("Enter two new numbers: ");
                scanf("%f %f", &a, &b);
                break;
            case 6:
                printf("Exiting program.\n");
                break;
            default:
                printf("Invalid choice. Try again.\n");
        }

    } while (choice != 6);

    return 0;
}