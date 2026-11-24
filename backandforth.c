#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Assembly functions
extern int addstr(char *a, char *b);
extern int is_palindromeASM(char *s);
extern int factstr(char *s);
extern void palindrome_check();

// C functions
int fact(int n);
int is_palindromeC(char *s);

// Recursive factorial
int fact(int n)
{
    if (n <= 1)
        return 1;

    return n * fact(n - 1);
}

// Checks whether a string is a palindrome
int is_palindromeC(char *s)
{
    int left = 0;
    int right = strlen(s) - 1;

    while (left < right)
    {
        if (s[left] != s[right])
            return 0;

        left++;
        right--;
    }

    return 1;
}
int main()
{
    int choice;

    char str1[100];
    char str2[100];

    while (1)
    {
        printf("\n1) Add two numbers together\n");
        printf("2) Test if a string is a palindrome (C -> ASM)\n");
        printf("3) Print the factorial of a number\n");
        printf("4) Test if a string is a palindrome (ASM -> C)\n");
        printf("5) Exit\n");

        printf("Choice: ");
        scanf("%d", &choice);

        switch(choice)
        {
            case 1:

                printf("Enter first number: ");
                scanf("%99s", str1);

                printf("Enter second number: ");
                scanf("%99s", str2);

                printf("Answer = %d\n", addstr(str1, str2));
                break;

            case 2:

                printf("Enter string: ");
                scanf("%99s", str1);

                if(is_palindromeASM(str1))
                    printf("Palindrome\n");
                else
                    printf("Not Palindrome\n");

                break;

            case 3:

                printf("Enter a number: ");
                scanf("%99s", str1);

                printf("Factorial = %d\n", factstr(str1));
                break;

            case 4:

                palindrome_check();
                break;

            case 5:

                return 0;

            default:

                printf("Invalid choice\n");
        }
    }

    return 0;
}
