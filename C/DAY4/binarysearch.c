
// linear will take long time bcs it start frrom start element to last element
// more time consumption ==> time complexity is more

//BINARY SEARCH : 
#include <stdio.h>

int main() {
    int arr[100], n, i, key, low, high, mid; //int found=1; //here 1-->true 0--> false 

    printf("Enter number of elements: ");
    scanf("%d", &n);

    printf("Enter %d elements in sorted order:\n", n);
    for (i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    printf("Enter the element to search: ");
    scanf("%d", &key);

    low = 0;
    high = n - 1;

    while (low <= high) {
        mid = (low + high) / 2;

        if (arr[mid] == key) {
            printf("Element %d found at index %d (position %d).\n", key, mid, mid + 1);
            // this methods works or u can add extra these 2 lines
            //found =1;
            //break;
            return 0;
        } else if (key < arr[mid]) {
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }

    printf("Element %d not found in the array.\n", key);
    return 0;
}