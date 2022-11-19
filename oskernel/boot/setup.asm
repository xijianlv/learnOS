;0磁道0柱面2扇区
[ORG 0x0500]

[SECTION .text]
[BITS 16]

global _start
_start:

    xchg bx, bx

    mov ax, 0
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov si, ax

; 如何调用
; mov     si, msg   ; 1 传入字符串
; call    print     ; 2 调用
    mov si, msg
    call print

    jmp $

print:
    mov ah, 0x0e
    mov bh, 0
    mov bl, 0x01
.loop:
    mov al, [si]
    cmp al, 0
    jz .done
    int 0x10
.done:
    ret

msg:
    db "hello", 10, 13, 0