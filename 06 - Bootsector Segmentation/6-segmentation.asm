mov ah, 0x0e

mov al, [the_secret]
int 0x10 

mov bx, 0x7c0 ; indirectly setting ds to 0x7c0 since it cannot be set directly in this manner
mov ds, bx
mov al, [the_secret]
int 0x10

mov al, [es:the_secret]
int 0x10 

mov bx, 0x7c0 ; indirectly setting es to 0x7c0 since it cannot be set directly in this manner
mov es, bx
mov al, [es:the_secret]
int 0x10

jmp $

the_secret:
    db "X"

times 510 - ($-$$) db 0
dw 0xaa55