[BITS 16]
[ORG 0000h]

jmp OSMain

; --------------------------------------------------------
; Diretivas e Inclusões
%INCLUDE "Hardware/wmemory.lib"
%INCLUDE "Hardware/monintor.lib"
%INCLUDE "Hardware/disk.lib"

; --------------------------------------------------------
; Iniciando o sistema
OSMain:
    call ConfigSegment
    call ConfigStack
    call VGA.SetVideoMode
    call DrawBackground
    call EffectInit
    call GraficInterface
    jmp END

; --------------------------------------------------------
; Funções do Kernel
GraficInterface:
    mov byte[Window_Bar], 1
    mov byte[Window_PositionX], 5
    mov byte[Window_PositionY], 5
    mov byte[Window_Height], 100
    mov byte[Window_Width], 150
    mov byte[Window_Border_Color], 21
    mov byte[Window_Bar_Color], 16
    mov byte[Window_Back_Color], 55
    mov byte[Sector], 3
    mov byte[Drive], 80h
    mov byte[NumSectors], 1
    mov word[SegmentAddr], 0800h
    mov word[OffsetAddr], 0500h
    call ReadDisk
    call WindowAddress
    mov byte[Window_Bar], 0
    mov byte[Window_PositionX], 110
    mov byte[Window_PositionY], 5
    mov byte[Window_Height], 50
    mov byte[Window_Width], 50
    mov byte[Window_Border_Color], 30
    mov byte[Window_Back_Color], 60
    call WindowAddress
ret

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
