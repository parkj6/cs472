/*	Filename: 	size_calculator.c
 *	Author: 		Jong Park (parkj6@oregonstate.edu)
 *	Description:	
 *		
 *	Inputs:
 *		arg0: size_calculator (this program)
 *		arg1: Width of virtual addresses (in bits) 
 *		arg2: Width of physical addresses (in bits)
 *		arg3: Size of Memory in page (in bytes)
 *		 
 *		Output1 (No error):
 *		size_calculator 35 32 8192 
 *		Full page table requires 146800640 bits.
 *	 
 *		Output2 (Not enough inputs):
 *		size_calculator 1 2
 *		You must enter exactly 4 arguments in order:
 *		arg0, arg1, arg2, arg3
 *					arg0: "size_calculator" (this program)
 *					arg1: Width of virtual addresses (in bits) 
 *					arg2: Width of physical addresses (in bits)
 *					arg3: Size of Memory in page (in bytes)
 *
 */
 
#include <stdio.h>
#include <math.h>
#include <ctype.h>
#include <stdlib.h>
#define	DEBUG 1
#define NORM	"\033[0m"
#define GRAY	"\033[1;30m"
#define RED		"\033[1;31m"
#define GR 		"\033[1;32m"
#define YEL 	"\033[1;33m"
#define BLUE 	"\033[1;34m"
#define PINK 	"\033[1;35m"
#define CYAN 	"\033[1;36m"
#define WH		"\033[1;37m"


/* Checking if arguments are number or not */
char* isNumber(char numb[]){
	int i=0;
	if (numb[0] == '-')
		i=1;
	for (; numb[i]!=0; i++){
		if(!isdigit(numb[i])){
			return "Is NOT a number";
		}
		else
			return "Is a number";
	}
}

int argTest(int argc, char **argv){

	/* Wrong # of inputs */
	if (argc<4 || argc>4){
		printf("You must enter exactly 4 argument in order:\n"
				"%sarg0, arg1, arg2, arg3\n"
				"\targ0:%s \"size_calculator\" (this program)\n%s" 
				"\targ1:%s Width of virtual addresses (in bits) \n%s" 
				"\targ2:%s Width of physical addresses (in bits)\n%s" 
				"\targ3:%s Size of Memory in page (in bytes)\n%s", GR, WH, GR, WH, GR, WH, GR, WH, NORM);
		return -1;	
	}
	
	/* Testing if argument is # or not */
	if (argc>1){
		for (int i=1; i<=argc; i++){
			char* test = isNumber(argv[i]);
		
			if (DEBUG){
				printf("argv[%i]: %s\n", i, test);
			}
		}
	}
	return 0;
}

int main(int argc, char **argv){
	
	/* DEBUG */
	if (DEBUG){
		printf("argc = %i\n", argc);		// How many arguments?
		for (int i=1; i<argc; i++){
			printf("argv[%i] = %s\n", i, argv[i]);	// Print the arguments.
		}
	}
	/* /DEBUG */

	int test = argTest(argc, argv);
	if (test<0){
		return -1;
	}

	else{
	/* Real fun begins here */
		printf("blah");
		long va = atol(argv[1]);
		long pa = atol(argv[2]);
		long mem = atol(argv[3]);
		long size = 0;
		

		if (DEBUG){
			printf(	"Virtual:	%li-bits,\n"
					"Physical:	%li-bits,\n"
					"Memory:	%li-bytes.\n"
					"Table:		%li-bits (0-bits by default).\n", va, pa, mem, size);
		}

		// Do some math here. 

		printf("Full page table requires %li bits.\n\n",size);

	}
		
	
	return 0;
}

