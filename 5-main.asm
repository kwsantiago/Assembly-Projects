; A boot sector that prints a string using our function in a different file
;
[org 0x7c00] ; Tell assembler where code is located (start of bootsector)

mov bx, HELLO_MSG
call print

call print_newline

mov bx, GOODBYE_MSG
call print

call print_newline

jmp $ ; hang

%include "5-print.asm"

HELLO_MSG:
    db 'Hello, World!', 0

GOODBYE_MSG:
    db 'Goodbye!', 0

; Padding and magic number
times 510-($-$$) db 0
dw 0xaa55
