	.text

	.equ	SWITCHES,	0xFF200040
	.equ 	HEX0,		0xFF200020
	.equ 	HEX_PATTERN, 0x00
	.global _start

_start:
	movia	r3, SWITCHES	# Address of switches
	movia 	r4,	HEX0		# Address of the HEX display
	movia 	r6, HEX_PATTERN	# pattern for seven segment off
	ldwio	r7, 0(r6)		# load pattern into hex

LOOP:
	ldwio	r5, 0(r3)		# Read the state of switches, put into r5


	bne		r5, r8, CHANGE_SEVEN	#compare current state to last state, if not equal change seven_segment.

	
	br LOOP					#if they are equal just go back to the top of the loop


CHANGE_SEVEN:
	ldwio	r8, 0(r3)		# store the state
	addi	r6, r6, 1	#incirment the r6 register
	stwio	r6, (r4)
#need a wrap around case?
	br LOOP

	.end
	
