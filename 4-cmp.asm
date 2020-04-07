mov bx, 33

cmp bx, 4 ; compare bx and 4
jle less_equal_block ; if bx <= 4 then jump to less_equal_block
cmp bx, 40 ; else, compare bx and 40
jl less_block ; if bx < 40 then jump to less_block
mov al, 'C' ; else send char C
jmp the_end ; jump to the end

less_equal_block:
    mov al, 'A'
    jmp the_end

less_block:
    mov al, 'B'

the_end:
    mov ah, 0x0e
    int 0x10

    jmp $
    times 510-($-$$) db 0
    dw 0xaa55
