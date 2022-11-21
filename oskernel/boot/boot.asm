[ORG  0x7c00]

[SECTION .data] ;定义一个数据段
BOOT_MAIN_ADDR equ 0x500 ;定义一个变量

[SECTION .text]
[BITS 16]
global _start
_start:
    ; 设置屏幕模式为文本模式，清除屏幕
    mov ax, 3
    int 0x10
    ;--------------------------------------------------------
    ;从软盘读MBR
    ;mov ch, 0 ;柱面
    ;mov dh, 0 ;磁头
    ;mov cl, 2 ;扇区
    ;mov bx, BOOT_MAIN_ADDR ;数据写入道哪，参考实模式下段内存分布

    ;mov ah, 0x02 ;读盘才做
    ;mov al, 1 ;连续读取多少个扇区
    ;mov dl, 0 ;驱动器编号
    ;--------------------------------------------------------
    ;从硬盘读MBR
    mov ecx, 2;从硬盘段哪个扇区开始读取
    mov bl, 2;连续读取多少个扇区

    ;0x01f2->->读取多少扇区
    mov dx,0x01f2
    mov al,bl
    out dx,al;写（out）指令,将数据写入地址
    ;0x01f3->8bit->lba地址低8位
    inc dx
    mov al,cl
    out dx,al
    ;0x01f4->8bit->lba地址中8位
    inc dx
    mov al,0b00000000
    out dx,al
    ;0x01f5->8bit->lba地址高8位
    inc dx
    mov al,0b00000000
    out dx,al
    ;0x01f6->8bit->0-3位位lba的最高的四位->5、7位固定位1->4表示主(0)从(1)盘->6 CHL模式(0)LAB模式(1)
    inc dx
    mov al,0b00000000
    and al,0b1110_1111
    out dx,al
    ;0x01f7->8bit->命令或者端口状态
    inc dx
    mov al,0x20;0x20->00100000
    out dx,al


.read_hd_check:
    mov dx,0x01f7
    in al,dx;读（in）指令,从地址读取数据
    and al,0b10001000;取硬盘状态的第3、7位
    cmp al,0b00001000;硬盘数据准备好了且不忙了
    jnz .read_hd_check

    ;.read_hd_check执行完成，表示硬盘检测通过或准备就绪，开始读数据
    mov dx, 0x01f0
    mov cx, 256;每次读取两个字节，每个扇区512字节，需读取256次
    mov edi, BOOT_MAIN_ADDR;将读取到的数据写入道哪里


.read_data_from_hd:
    in ax,dx
    mov [edi], ax
    add edi, 2
    loop .read_data_from_hd

    ;将硬盘的0磁道0磁头2扇区段数据读出来写入道BOOT_MAIN_ADDR的位置，读取之后，跳到BOOT_MAIN_ADDR执行
    mov si, jmp_to_setup
    call print


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