	.text

	.equ	SWITCHES,	0xFF200040
	.equ 	HEX0,		0xFF200020
	.equ 	OFF_PATTERN 0x00
	.global _start

_start:
	movia	r3, SWITCHES	# Address of switches
	movia 	r4,	HEX0		# Address of the HEX display
	movia 	r6, OFF_PATTERN	# pattern for seven segment off

LOOP:
	ldwio	r4, (r3)		# Read the state of switches
	stw 	r5,	r4			# store the value of the swtiches to R5

	bne		r5, r4, CHANGE_SEVEN	#compare current state to last state, if not equal change seven_segment.
	br LOOP					#if they are equal just go back to the top of the loop


CHANGE_SEVEN:
	addi	r6, 1	#incirment the r6 register
	stwio	HEX0, (r6)
	br LOOP

	.end
	