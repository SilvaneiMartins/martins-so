[BITS 16]
[ORG 0x7c00]

call HelloWorld ;primeira forma de hello word
call JumpLine

call PointerString ;segunda forma de hello word
call PrintString

call PointerBuffer ;terceira forma de hello word
call ReadString
call PointerStringBuf
call PrintString
jmp $ ; Trava aqui nesta linha para não executar novamente

HelloWorld:
    mov ah, 0eh
    mov al, 48h
    int 10h
    mov al, 65h
    int 10h
    mov al, 6ch
    int 10h
    mov al, 20h
    int 10h
    mov al, 57h
    int 10h
    mov al, 6fh
    int 10h
    mov al, 72h
    int 10h
    mov al, 6ch
    int 10h
    mov al, 64h
    int 10h
    ret

JumpLine:
    mov ah, 0eh
    mov al, 0ah
    int 10h
    mov al, 0db
    int 10h
    ret

PointerString:
    mov si, hello
    ret

PointerBuffer:
    mov di, buffer
    ret

PointerStringBuf
    mov si, buffer
    ret

PrintString:
    mov ah, 0eh
    mov al, [si]
    print:
        int 10h
        inc si
        mob al, [si]
        cmp al, 0
        jne print
    ret

ReadString
    mov ah, 00h
    int 16h
    mov ah, 0eh
    int 19h
    mov [di], al
    cmp al, 0dh
    jne ReadString
    mov ah, 0eh
    mov al, 0ahint 10h
ret

hello db "Ola Mundo!", 13, 10, 0
buffer times 20 db 0

times 510 - ($-$$) db 0
dw 0xAA55
