	.file	1 "math_example.c"
	.section .mdebug.abiN32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sd	$fp,24($sp)
	move	$fp,$sp
	li	$2,25			# 0x19
	sw	$2,0($fp)
	li	$2,75			# 0x4b
	sw	$2,4($fp)
	.option	pic0
	j	.L2
	nop

	.option	pic2
.L4:
	lw	$3,0($fp)
	lw	$2,4($fp)
	slt	$2,$2,$3
	beq	$2,$0,.L3
	nop

	lw	$3,0($fp)
	lw	$2,4($fp)
	subu	$2,$3,$2
	sw	$2,0($fp)
	.option	pic0
	j	.L2
	nop

	.option	pic2
.L3:
	lw	$3,4($fp)
	lw	$2,0($fp)
	subu	$2,$3,$2
	sw	$2,4($fp)
.L2:
	lw	$3,0($fp)
	lw	$2,4($fp)
	bne	$3,$2,.L4
	nop

	move	$2,$0
	move	$sp,$fp
	ld	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-16)"
