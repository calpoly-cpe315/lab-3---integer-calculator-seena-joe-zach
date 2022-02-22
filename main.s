    // Template main.s file for Lab 3
    // partner names here

    .arch armv8-a

    // --------------------------------
    .global main
main:
    // driver function main lives here, modify this for your other functions0
    stp    x29,x30, [sp,-32]!
    mov    x29,sp
    

loop:
    // prompt for first number
    ldr    w0, printprompt1
    bl     printf

    ldr	   w0, =scanint
    mov    x1, x29
    bl     scanf
    ldrb   w19, [sp]

    // prompt for second number
    ldr    w0, printprompt1+4
    bl     printf

    ldr    w0, =scanint
    mov    x1, x29
    bl     scanf
    ldrb   w20, [sp]

    // read operation
    ldr    w0, printprompt1+8
    bl     printf
    
    ldr    w0, =scanchar
    mov    x1, x29
    bl     scanf
    ldrb   w21, [sp]

    // check if multiplication
    ldr    x1, =multsign
    ldrb   w1, [x1]
    cmp    w21, w1
    b.eq   multiply
    
    // check if addition
    ldr    x1, =addsign
    ldrb   w1, [x1]
    cmp    w21, w1
    b.eq   add

    // check if subtraction
    ldr    x1, =subsign
    ldrb   w1, [x1]
    cmp    w21, w1
    b.eq   subtract


    // multiply
multiply:
    mov    x0, x19
    mov    x1, x20
    bl     intmul
    b      finish
    
    // add
add:
    mov    x0, x19
    mov    x1, x20
    bl     intadd
    b      finish
    
    // subtract 
subtract:
    mov    x0, x19
    mov    x1, x20
    bl     intsub
    b      finish


    // Print result and prompt for looping
finish: 
    mov    x1, x0
    ldr    w0, printprompt1 + 12
    bl     printf

    ldr    w0, printprompt1 + 16
    bl     printf 

    ldr    w0, =scanchar
    mov    x1, sp          // Save stack pointer to x1, you must create space
    bl     scanf           // Scan user's answer
    ldr    x1, =yes        // Put address of 'y' in x1
    ldrb   w1, [x1]        // Load the actual character 'y' into x1
    ldrb   w0, [sp]        // Put the user's value in r0
    cmp    w0, w1          // Compare user's answer to char 'y'
    b.eq   loop            // branch to appropriate location
    
end:

printprompt1:
    .word   numprompt1
    .word   numprompt2
    .word   opprompt
    .word   result
    .word   again
yes:
    .byte   'y'
multsign:
    .byte   '*'
addsign:
    .byte   '+'
subsign:
    .byte   '-'
scanchar:
    .asciz  " %c"
numprompt1:
    .asciz  "Enter Number 1: "
scanint:
    .asciz  "%d"
    .space  1
numprompt2:
    .asciz  "Enter Number 2: "
opprompt:
    .asciz  "Enter Operation: "
result:
    .asciz  "Result is: %d\n"
again:
    .asciz  "Again? "
