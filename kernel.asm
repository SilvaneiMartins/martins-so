[BITS 16]
[ORG 0000h]

jmp OSMain

; --------------------------------------------------------
; Diretivas e Inclusões
%INCLUDE "Hardware/monintor.lib"

; --------------------------------------------------------
; Iniciando o sistema
OSMain:
    call ConfigSegment
    call ConfigStack
    call VGA.SetVideoMode
    call DrawBackground
    call EffectInit
    jmp END

; --------------------------------------------------------
; Funções do Kernel
ConfigSegment:
    mov ax, es
    mov ds, ax
ret

ConfigStack:
    mov ax, 7D00h
    mov ss, ax
    mov sp, 03FEh
ret

END:
    mov ah, 00h
    int 16h
    mov ax, 0040h
    mov ds, ax
    mov ax, 1234h
    mov [0072h], ax
    jmp 0FFFFh:0000h

; --------------------------------------------------------
