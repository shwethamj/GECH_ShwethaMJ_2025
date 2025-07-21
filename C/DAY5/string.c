#include <stdio.h>
#include <string.h> //For Working with Strings
int main()
{
    // char section; // Single character
    char name[20], copy[20], some[20] = "Something", lname[10] = " Rao"; // Character Array : String

    // printf("Enter your section:");
    // // scanf("%c", &section);
    // printf("You're currently present in %c section\n", section);
    printf("Enter your name and click enter:");

    // gets(name); //It will take input without checking the size allocated for that character array until Enter key is pressed
    // Syntax for fgets:
    // fgets(char_array, sizeof(char_array), stdin)
    fgets(name, sizeof(name), stdin); // It will check the size allocated and restrict the number of characters until the size limit reached
    printf("Your name is %s", name);

    
    // String Handling functions
    printf("The given string contains %d characters.\n", strlen(name)); // strlen is used to find the number of characters
    // strcpy(new_string, old_string) : copy the data of old_string to new_string
    printf("The copy array contains: %s", strcpy(copy, name));
    printf("Both array contains same data: %d\n", strcmp(copy, name)); // strcmp is used to company any 2 given strings which will return 0 if both are same, else it returns -1
    printf("Both array contains same data: %d\n", strcmp(copy, some));
    printf("Original string: %s\n", name);
    printf("Reversed string: %s\n", strrev(name));      // strrev is used to reverse the data present in the string
    printf("My Full Name is: %s", strcat(copy, lname)); // strcat is used to combine 2 strings into the single string
}