#include <stdio.h>
#include "source.h"

void simple_sum(void)
{
	int a, b;
	scanf("%d%d", &a, &b);
	int result = a + b;
	printf("%d + %d = %d\n", a, b, result);
}

void simple_math(void)
{
	double a, b;
	char operator;
	scanf("%lf %c %lf", &a, &operator, &b);

	if (operator == '+') {
		printf("%.1lf\n", a + b);
	} else if (operator == '-') {
		printf("%.1lf\n", a - b);
	} else if (operator == '*') {
		printf("%.1lf\n", a * b);
	} else if (operator == '/') {
		printf("%.1lf\n", a / b);
	} else {
		printf("ERR\n");
	}
}
