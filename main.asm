;
; AssemblerApplication1.asm
;
; Created: 3/11/2022 4:05:15 PM
; Author : User
;


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

.org 0x0000
	rjmp reset

reset:
	// enable LED for debugging purpose
	ser r16 ; set all bits in r16 to 1
	out DDRB, r16 ; set Port B for output
main:
	write_to_led 0b01010101

end:
	rjmp end
