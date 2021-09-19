section .data
    a   dd  5
    N   dd  254
    mensaje_fallo db "Los numeros deben estar (0,255)",10
    len_mensaje_fallo equ $-mensaje_fallo

section .bss
    

section .text
global _start

_start:
    mov r8,a
    mov r9,N
    mov r10,0
    mov r11,255

    xor r12,r12
    mov r12d,[r8]
    cmp r12d,r10d
    jl fallo

    xor r12,r12
    mov r12d,[r9]
    cmp r12d,r10d
    jl fallo

    xor r12,r12
    mov r12d,[r8]
    cmp r12d,r11d
    jg fallo

    xor r12,r12
    mov r12d,[r9]
    cmp r12d,r11d
    jg fallo
    

    ;1.Formula de la derecha
    xor r14,r14
    mov r14d,[r9]
    mov r15d,[r8]
    mov rax,r15
    mov r11,rax
    mov r10,0
    potencia:
        MUL r11 
        dec r14
        cmp r14,r10
    jne potencia

    xor r10,r10
    xor r11,r11
    mov r10d,[r8]
    mov r11d,[r8]
    dec r11
    sub rax,r10
    div r11
    ;Guardamos el primer resultado en r15
    mov r15,rax

    ;2.Iteracion
    xor r10,r10
    xor r11,r11 
    mov r8,a
    mov r9,N
    mov r10d,[r8]
    mov r11d,[r9]
    mov rax,1
    mov r12,1
    mov r14,0
    mov r8,0
    sumatoria:
        mov r13,r12
        potencia2:
            mul r10
            dec r13
            cmp r13,r14
        jne potencia2 
        ADD r8,rax
        INC r12 
        mov rax,1
        cmp r11,r12
    jge sumatoria

    mov r14,r8

    jmp terminar

    fallo:
        mov rax, 1
	    mov rdi, 1
	    mov rsi, mensaje_fallo
	    mov rdx, len_mensaje_fallo
	    syscall

    terminar:
    ;Terminamos el programa
    mov rax, 60
	mov rdi, 0
	syscall

