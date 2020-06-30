[bits 32] ; 32-bit protected mode

; Constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f ; color byte for each char

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx] ; [ebx] is the address of the character
    mov ah, WHITE_ON_BLACK

    cmp al, 0 ; check for null char / end of string
    je print_string_pm_done

    mov [edx], ax ; store character and attribute in video memory
    add ebx, 1 ; increment to next char
    add edx, 2 ; increment to next video memory position

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret
