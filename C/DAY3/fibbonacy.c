#include<stdio.h>

int main() {
    int n, first = 0, second = 1, next, i = 0;

    printf("Enter the number : ");
    scanf("%d", &n);

    printf("Fibonacci Series: ");

    while (i < n) {
        if (i <= 1){
            next = i;  // First two terms: 0, 1
        }
        else {
            next = first + second;
            first = second;
            second = next;
        }
        printf("%d ", next);
        i++;
        
    }
    printf("\n");


    return 0;
}
