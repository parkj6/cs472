# compile the code
gcc -std=c11 ./prime_number.c

# print the return value and see if it is 1 or 0
a.out; echo $?

# generate x86 assembly code
gcc -fno-asynchronous-unwind-tables -std=c11 -Og -S -o ./prime_number_x86.s ./prime_number.c

# generate MIPS assembly code
mips64-linux-gnu-gcc -fno-asynchronous-unwind-tables -std=c11 -Og -S -o ./prime_number_mips.s ./prime_number.c