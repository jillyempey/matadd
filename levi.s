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
    push {r4, r5, r6, r7, r8, lr} // r4=i, r5=j, r6r7=temp, r8=4
    mov r8, #4
    mov r4, #-4
iloop:
    add r4, r4, #4
    mul r7, r3, r8
    cmp r7, r4 // Compare i with height
    beq return
    mov r5, #0
jloop:
    ldr r6, [sp, #24] //width in r6
    mul r7, r6, r8 //width*4
    cmp r7, r5 // Compare j with width
    beq iloop

    // Load A[i][j] into r6
    ldr r6, [r4, r1]
    ldr r6, [r6, r5]

    // Load B[i][j] into r7
    ldr r7, [r4, r2]
    ldr r7, [r7, r5]

    add r6, r6, r7 // Put sum in r6

    // Store address for C[i][j] in r7
    ldr r7, [r4, r0]
    
    str r6, [r7, r5] // Store sum into C
    add r5, r5, #4
    b jloop
return:
    pop {r4, r5, r6, r7, r8, pc} 
