
/*
 Short program to determine whether a provided positive number is prime.
*/
int main() {
	// do not change this section
	// you MUST retain the following two variable names:
	int num = 59;
	int is_prime;
	
	// your code goes in between the following markers

	// Base cases 
	if (num <=1) {
		is_prime = 0; // no negatives allowed.
	}
	else if (num <= 3) {
		is_prime = 1;	// 2 and 3 are prime #
	}
	else if (num%2==0 || num%3==0){
		is_prime = 0; // anything divisible by 2 or 3 are non-prime
	}
	int i = 5;
	while (i * i <= num) {
		if (num%i==0 || num%(i+2)==0){
			is_prime=0;
		}
		i+=6;
	is_prime = 1;
	}
	
	// should return 0 if "num" was not prime
	// should return 1 if "num" was prime
	return is_prime;
}