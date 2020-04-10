; value in dx = 0x1fb6
print_hex:
    pusha
    mov cx, 0 ; index variable

hex_loop:
    cmp cx, 4 ; loop 4 times
    je end
    
    ; convert last char to ASCII
    mov ax, dx
    and ax, 0x000f
    add al, 0x30
    cmp al, 0x39
    jle hex_loop2
    add al, 7

hex_loop2:
    mov bx, HEX_OUT ; base + length
    sub bx, cx ; index
    mov [bx], al
    ror dx, 4 

    ; increment index
    add cx, 1
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print
    popa
    ret

HEX_OUT:
    db '0x0000', 0
