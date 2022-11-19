[ORG  0x7c00]

[SECTION .data] ;定义一个数据段
BOOT_MAIN_ADDR equ 0x500 ;定义一个变量

[SECTION .text]
[BITS 16]
global _start
_start:
    xchg bx, bx
    ; 设置屏幕模式为文本模式，清除屏幕
    mov ax, 3
    int 0x10

    mov ch, 0 ;柱面
    mov dh, 0 ;磁头
    mov cl, 2 ;扇区
    mov bx, BOOT_MAIN_ADDR ;数据写入道哪，参考实模式下段内存分布

    mov ah, 0x02 ;读盘才做
    mov al, 1 ;连续读取多少个扇区
    mov dl, 0 ;驱动器编号

    int 0x13

    ;跳到setup的位置
    mov si, jmp_to_setup
    call print

    xchg bx, bx

    jmp BOOT_MAIN_ADDR

read_floppy_error:
    mov si, read_floppy_error_msg
    call print

    jmp $

; 如何调用
; mov     si, msg   ; 1 传入字符串
; call    print     ; 2 调用
print:
    mov ah, 0x0e
    mov bh, 0
    mov bl, 0x01
.loop:
    mov al, [si]
    cmp al, 0
    jz .done
    int 0x10

    inc si
    jmp .loop
.done:
    ret

read_floppy_error_msg:
    db "read floppy error ~!", 10, 13, 0

jmp_to_setup:
    db "jump to setup~~~", 10, 13, 0

times 510 - ($ - $$) db 0
db 0x55, 0xaa