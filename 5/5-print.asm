print:
    pusha

start:
    mov al, [bx] ; bx is the base address of the string
    cmp al, 0
    je done

    mov ah, 0x0e ; teletype BIOS print routine
    int 0x10 ; print

    ; increment pointer
    add bx, 1
    jmp start

done:
    popa
    return

print_newline:
    pusha
    mov ah, 0x0e
    mov al, 0x0a ; newline char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

    popa
    ret
