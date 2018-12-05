main:
	addiu	$sp,$sp,-32
	sd	$fp,24($sp)
	move	$fp,$sp
	li	$2,25	# 0x19
	sw	$2,0($fp)
	li	$2,75	# 0x4b
	sw	$2,4($fp)
	j	.L2
	nop
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
	j	.L2
	nop
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
