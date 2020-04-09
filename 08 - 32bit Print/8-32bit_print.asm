[bits 32] ; using 32-bit protected mode

; constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f ; color byte for each char

print_string:
    pusha
    mov edx, VIDEO_MEMORY

print_string_loop:
    mov al, [ebx] ; [ebx] is the address of the character
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je done

    mov [edx], ax ; store char and attribute in video memory
    add ebx, 1 ; increment to next char
    add ebx, 2 ; increment to next video memory position

    jmp print_string_loop

done:
    popa
    ret
