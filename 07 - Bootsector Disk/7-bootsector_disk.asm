disk_load:
    pusha
    push dx

    mov ah, 0x02 ; BIOS routine to read disk
    mov al, dh   ; # of sectors to read
    mov cl, 0x02  
    mov ch, 0x00 
    mov dh, 0x00 

    int 0x13      ; BIOS interrupt
    jc disk_error ; error handling 

    pop dx
    cmp al, dh    ; # of sectors read
    jne sectors_error ; error handling
    popa
    ret


disk_error:
    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah
    call print_hex 
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0