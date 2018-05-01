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
    push {r4, r5, r6, r7, lr} // r4=i, r5=j, r6,r7=temp
    mov r4, #-1
iloop:
    add r4, r4, #1
    cmp r4, r3 // Compare i with height-1
    beq return
    mov r5, #-1
jloop:
    ldr r6, [sp, #24]
    add r5, r5, #1
    cmp r5, r6 // Compare j with width
    beq iloop
    
    // Load A[i][j] into r6
    add r6, r2, r5
    ldr r6, [r6]
    add r6, r6, r4
    ldr r6, [r6]

    // Load B[i][j] into r7
    add r7, r3, r5
    ldr r7, [r7]
    add r7, r7, r4
    ldr r7, [r7]

    add r6, r6, r7 // Put sum in r6

    // Store address for C[i][j] in r7
    add r7, r2, r5
    ldr r7, [r6]
    add r7, r6, r4
    
    str r6, [r7] // Store sum into C
    b jloop
return:
    pop {r4, r5, r6, r7, pc} 
