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
   push  {r4, r5, r6, r7, r8, lr}
   /*
      R0: C[0][0]
      R1: A[0][0]
      R2: B[0][0]
      R3: height
      R4: r
      R5: c
      R6: width/temp
      R7: temp
      R8: width*4
   */
   //set r to -4 so it will start row loop at 0
   //set r8 to 4 to multiply things by 4 later on
   mov r4, #-4
   //mov r8, #4
   ldr   r8, [sp, #24] //width in r8
   mov   r8, r8, lsl #2  //width *4 in r8
rows:
   // increment row
   add   r4, r4, #4
   // put 4*height in r7
   mov   r7, r3, lsl #2
   // if 4*height == row we're done
   cmp   r7, r4    
   beq   done
   //else set col to 0 to start on current row
   mov   r5, #0
cols:
   // if 4*width == col then we've finished a row
   cmp   r8, r5
   beq rows
  //  get value of A[r][c], B[r][c]
   ldr   r6, [r1, r4] //A[r]
   ldr   r6, [r6, r5] //A[r][c]
   ldr   r7, [r2, r4] //B[r]
   ldr   r7, [r7, r5] //B[r][c]
   // compute sum
   add   r6, r6, r7
   //load addr of C[r]
   ldr   r7, [r0, r4]
   // store value into C[r][c]
   str   r6, [r7, r5]
   //increment col
   add   r5, r5, #4


   cmp   r8, r5
   beq rows
  //  get value of A[r][c], B[r][c]
   ldr   r6, [r1, r4] //A[r]
   ldr   r6, [r6, r5] //A[r][c]
   ldr   r7, [r2, r4] //B[r]
   ldr   r7, [r7, r5] //B[r][c]
   // compute sum
   add   r6, r6, r7
   //load addr of C[r]
   ldr   r7, [r0, r4]
   // store value into C[r][c]
   str   r6, [r7, r5]
   //increment col
   add   r5, r5, #4
   b  cols
done:
   pop   {r4, r5, r6, r7, r8, pc}
