[BITS 16]
[ORG 0000h]

jmp OSMain

BackWidth db 0
BackHeight db 0
Pagination db 0

OSMain:
    call ConfigSegment
    call ConfigStack
    call TEXT.SetVideoMode

ConfigSegment:
    mov ax, es
    mov ds, ax
ret

ConfigStack:
    mov ax, 7D00h
    mov ss, ax
    mov sp, 03FEh
ret

TEXT.SetVideoMode:
    mov ah, 00h
    mov al, 03h
    int 10h
    mov BYTE[BackWidth], 80
    mov BYTE[BackHeight], 20
ret
