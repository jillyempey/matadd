    /* This function has 5 parameters, and the declaration in the
       C-language would look like:

       void matadd (int **C, int **A, int **B, int height, int width)

       C, A, B, and height will be passed in r0-r3, respectively, and
       width will be passed on the stack.

       You need to write a function that computes the sum C = A + B.

       A, B, and C are arrays of arrays (matrices), so for all elements,
       C[i][j] = A[i][j] + B[i][j]

       You should start with two for-loops that iterate over the height and
       width of the matrices, load each element from A and B, compute the
       sum, then store the result to the correct element of C. 

       This function will be called multiple times by the driver, 
       so don't modify matrices A or B in your implementation.

       As usual, your function must obey correct ARM register usage
       and calling conventions. */

	.arch armv7-a
	.text
	.align	2
	.global	matadd
	.syntax unified
	.arm
matadd:
   push  {r4, r5, r6, r7, r8, r9, r10, r11, r12, lr}
   ldr   r4, [sp, #44]
/**
   R0: base addr of C
   R1: base addr of A
   R2: base addr of B
   R3: height
   R4: width
   R5: row counter
   R6: column counter
   R7: sum
   R8: A[r][c]
   R9: B[r][c]
   R10: address of C[r][c]
   R11: temp
   R12: offset 
**/

   mov   r5, #0 // initial row = 0
   mov   r6, #0 // intial col = 0

   mov   r12, #0 //offset initialized to 0

// if at the end of a row, go to next row
rows:
   // is col < width
   cmp   r6, r4     
   blt   cont1
   //increment row and set col = 0
   mov   r6, #0    
   add   r5, r5, #1
   //if row == height, we're done
   cmp   r3, r5
   beq   done

cont1:
   // calculate offset : r12 = 4(r(r5) * width(r4) + c(r6))
   mul   r12, r5, r4
   add   r12, r12, r6
   lsl   r12, #2
   // calculate address of A[r][c] and B[r][c] and C[r][c]
   add   r8, r1, r12 //A[r][c] in r8
   add   r9, r2, r12 // B[r][c] in r9
   add   r10, r0, r12
   // get value of A[r][c], B[r][c]
   ldr   r8, [r8]
   ldr   r9, [r8]
   // compute sum
   add   r7, r8, r9
   // store value into C[r][c]
   str   r7, [r0, r12]
   //increment col
   add   r6, r6, #1
   b  rows

done:

   pop   {r4, r5, r6, r7, r8, r9, pc}
