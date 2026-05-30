#include <stddef.h>
#include <stdio.h>
#include <math.h>
#include "source.h"

void multi_table(unsigned int xsize, unsigned int ysize)
{
	for (size_t i = 1; i <= xsize; ++i) {
		for (size_t j = 1; j < ysize; ++j) {
			printf("%4zu ", i * j);
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
