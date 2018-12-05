//#include <stdio.h>

/*
	Short example program to compute the greatest common divisor of two positive numbers.
*/
int main() {
	int num_a = 25;
	int num_b = 75;

	while (num_a != num_b) {
		if (num_a > num_b)
			num_a = num_a - num_b;
		else
			num_b = num_b - num_a;
	}

//	printf("GCD = %d\n", num_a);
	
//	return 0;
}
