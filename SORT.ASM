.model small\

.data
a db 34h,22h,12h,24h
siz dw $-a



.code
start:     mov ax,@data
           mov ds,ax

           mov bx,siz
           dec bx

outloop:   mov cx,bx
           mov si,0

inloop:    mov al,a[si]
           inc si

           cmp al,a[si]
           jb goon

           xchg al,a[si]

           mov a[si-1],al

goon:      loop inloop

           dec bx
           jnz outloop

           mov ah,4ch
           int 21h

end start


