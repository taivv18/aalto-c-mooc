#include <math.h>

double vectorlength(double x, double y, double z)
{
	double expressions = pow(x, 2) + pow(y, 2) + pow(z, 2);
	return sqrt(expressions);
}
