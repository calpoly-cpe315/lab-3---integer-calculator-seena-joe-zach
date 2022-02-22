    // intadd function in this file

    .arch armv8-a
    .global intadd

intadd:
  
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
    ret



