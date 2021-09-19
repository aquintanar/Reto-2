section .data
    cadena  db "oppo"
    lenCadena equ $-cadena

    mensaje1 db "T"
    mensaje2 db "F"
section .bss
    resultado resb 1    
section .text
global _start

_start:
    mov r8,cadena
    mov r9,cadena
    mov r10,lenCadena
    
    add r9,r10
    dec r9
    xor r11,r11
    xor r12,r12
    mov r11b,[r8]
    mov r12b,[r9]


    mov rax,r10
    mov r13,2
    div r13

    mov r14,0
    mov r13,rax
    ciclo:
        xor r11,r11
        xor r12,r12
        mov r11b,[r8]
        mov r12b,[r9]
        cmp r12,r11
        jne no_palindromo
        inc r8
        dec r9

        dec r13
        cmp r13,r14
    jne ciclo
    jmp palidromo 
    no_palindromo:
        xor r13,r13
        mov r13b,[mensaje2]
        mov [resultado],r13
    jmp terminar
    palidromo:
        xor r13,r13
        mov r13b,[mensaje1]
        mov [resultado],r13
    terminar:
        mov rax, 60
	    mov rdi, 0
	    syscall

    






