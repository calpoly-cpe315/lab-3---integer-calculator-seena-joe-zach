    // Template main.s file for Lab 3
    // partner names here

    .arch armv8-a

    // --------------------------------
    .global main
main:
    // driver function main lives here, modify this for your other functions0
    stp    x29,x30, [sp,-32]!
    mov    x29,sp
    
    // prompt for first number
    ldr    w0, printprompt1
    bl     printf

    ldr	   w0, =input
    mov    x1, x29
    bl     scanf
    ldrb   w19, [sp]

    // prompt for second number
    ldr    w0, printprompt1+4
    bl     printf

    ldr    w0, =input
    mov    x1, x29
    bl     scanf
    ldrb   w20, [sp]




    // You'll need to scan characters for the operation and to determine
    // if the program should repeat.
    // To scan a character, and compare it to another, do the following
loop: ldr     w0, =scanchar
      mov     x1, sp          // Save stack pointer to x1, you must create space
      bl      scanf           // Scan user's answer
      ldr     x1, =yes        // Put address of 'y' in x1
      ldrb    w1, [x1]        // Load the actual character 'y' into x1
      ldrb    w0, [sp]        // Put the user's value in r0
      cmp     w0, w1          // Compare user's answer to char 'y'
      b       loop            // branch to appropriate location

printprompt1:
    .word numprompt1
    .word numprompt2
    .word opprompt
    .word result
    .word again
yes:
    .byte   'y'
scanchar:
    .asciz  " %c"
numprompt1:
    .asciz  "Enter Number 1: "
input:
    .asciz "%d"
    .space 1
numprompt2:
    .asciz  "Enter Number 2: "
opprompt:
    .asciz  "Enter Operation: "
result:
    .asciz  "Result: "
again:
    .asciz  "Again? "
