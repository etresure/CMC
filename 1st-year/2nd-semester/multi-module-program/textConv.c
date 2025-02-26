#include <stdio.h>
#include "textConv.h"
int scanText(char *s);
void printText(char *s, int k);
int checkText(char *s, int k);
int main(void)
{
	char str[101];
	int count = scanText(str);
	printf("Original text: ");
	printText(str, count);
	printf("Applied rule number: %d \n", checkText(str, count));
	if (checkText(str, count) == 1)
		rule_one(str);
	else 
		rule_two(str);
	printf("Converted text: ");
	printText(str, count);
	return 0;
}
int scanText(char *s)
{
	int count=0;
	for (int i = 0; i < 100; i++)
	{
		*(s + i) = getchar();
		if (*(s + i) == '\n')
			break;
		count += 1;	
	}
	printf("\n");
	return count;	
}

void printText(char *s, int k)
{
	for (int i = 0; (i < k) && (*(s + i) != '\n'); i++)
		printf("%c", *(s + i));
	printf("\n");
}

int checkText(char *s, int k)
{
	char x = *(s + k - 1);
	if (!((x >= 'A') && (x <= 'Z')))
		return 2;
	for (int i = 0; i < k - 1; i++)
		if (*(s + i) == x)
			return 2;
	return 1;
}

