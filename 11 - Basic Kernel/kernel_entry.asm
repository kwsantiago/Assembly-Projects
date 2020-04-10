[bits 32] ; Bit-32 protected mode
[extern main] ; Define calling point. Must have same name as kernel.c 'main' function
call main ; Invoke main() from C kernel
jmp $ ; Hang