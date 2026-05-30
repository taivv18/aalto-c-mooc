#include <stddef.h>
#include <stdio.h>
#include <math.h>
#include "source.h"

void multi_table(unsigned int xsize, unsigned int ysize)
{
	for (size_t i = 1; i <= ysize; ++i) {
		for (size_t j = i; j < xsize + i; ++j) {
			if (i == 1 || j == i) {
				printf("%zu ", j);
			} else {
				printf("%zu ", j + i - 1);
			}
		}
		printf("\n");
	}
}

void draw_triangle(unsigned int size)
{
}

double distance(int x, int y)
{
	return sqrt(x * x + y * y);
}

void draw_ball(unsigned int radius)
{
}
