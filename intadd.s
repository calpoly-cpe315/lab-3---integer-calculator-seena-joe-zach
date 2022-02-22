    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
    str x30,[sp,-32]!
    str x19,[sp,8]
    str x20,[sp,16]

    mov x19,x0
    mov x20,x1

if:
    cmp x20,0
    bne else
    b endif
else:
    EOR x0,x0,x1
    AND x1,x0,x1
    LSL x1,x1,1
    bl intadd
endif:
    ldr x30,[sp,-32]
    ldr x19,[sp,8]
    ldr x20,[sp,16]
    ret



