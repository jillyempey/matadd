    	.arch armv7-a
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
        
main:
   ldr   r0, =matc
   ldr   r1, =mata
   ldr   r2, =matb
/*   mov   r3, #0
   str   r3, [r0, #0]
   str   r3, [r0, #4]
   str   r3, [r0, #8]
   str   r3, [r0, #12]
   mov   r3, #1
   str   r3, [r1, #0]
   str   r3, [r1, #4]
   str   r3, [r1, #8]
   str   r3, [r1, #12]
   mov   r3, #2
   str   r3, [r2, #0]
   str   r3, [r2, #4]
   str   r3, [r2, #8]
   str   r3, [r2, #12]*/
   mov   r3, #2
   mov   r4, #2
   push  {r4}

   b     matadd
   ldr   r0, =matc
   bl    printf
   ldr   r0, =mata
   bl    printf
   ldr   r0, =matb
   bl    printf
matc:
   .asciz   "0000"
mata:
   .asciz   "1111"
matb:
   .asciz   "2222"


