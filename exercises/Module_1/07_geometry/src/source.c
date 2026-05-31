#include <stddef.h>
#include <stdio.h>
#include <math.h>
#include "source.h"

void multi_table(unsigned int xsize, unsigned int ysize)
{
	for (size_t i = 1; i <= ysize; ++i) {
		for (size_t j = 1; j <= xsize; ++j) {
			printf("%4u", i * j);
		}
		printf("\n");
	}
}

void draw_triangle(unsigned int size)
{
	for (int i = 1; i <= size; ++i) {
		for (int j = 1; j <= size; ++j) {
			if (j == size - i || (i < size - j || j < size - i)) {
				printf(".");
			} else {
				printf("#");
			}
		}
		printf("\n");
	}
}

double distance(int x, int y)
{
	return sqrt(x * x + y * y);
}

void draw_ball(unsigned int radius)
{
}
