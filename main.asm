;
; AssemblerApplication1.asm
;
; Created: 3/11/2022 4:05:15 PM
; Author : Jing
; Sample code for motor speed control


; Replace with your application code


; function/subroutine
; rotation count
;	counter rotation per quarter second
;	timer0ovf
; drive motor
;	PWM?
; feedback control?

.include "m2560def.inc"
// debuging macro
.macro write_to_led
	ldi r16, @0
	out PORTB, r16
.endmacro

// Start of the interupt vector
// Reset int
.org RESET
	jmp reset_routine
// motor int (light reciever) might need to keep checking int0 pin to make sure it's  not triggered
.org INT0
	jmp int0_routine
// timer0 int (to count 1 second or 1/4 second)
.org TIMER0OVF
	jmp timer0_routine
reset:
	// enable LED for debugging purpose
	ser r16 ; set all bits in r16 to 1
	out DDRB, r16 ; set Port B for output
main:
	write_to_led 0b01010101

end:
	rjmp end

int0_routine:

	reti

timer0ovf_routine:
	
	reti
