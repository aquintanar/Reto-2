section .data

    numero db "145"
    len_numero equ $-numero

    mensaje1 db "T"

    mensaje2 db "F"
   

section .bss
    respuesta resb 1
section .text
global _start

_start:
    mov r8,numero
    mov r9,numero
    ;1.Hallamos suma del factorial de cada digito
    mov r14,1
    mov r13,len_numero
    mov rcx,0
    next_digito:
        mov rax,1
        xor r10,r10
        mov r10b,[r8]
        mov r11,48
        sub r10,r11 ;En r10 esta el numero
        mov r11,1
        factorial:
            mul r11
            inc r11
            cmp r10,r11
        jge factorial
        add rcx,rax
        mov rax,1
        inc r14
        inc r8
        cmp r13,r14
    jge next_digito
    
    mov r15,rcx

    ;2.Hallamos al numero
    mov r8,numero
    mov r13,len_numero
    mov r14,0
    mov rcx,0
    next_digito2:
            xor r9,r9
            mov r9b,[r8]
            mov r10,48
            sub r9,r10
            mov rax,1
            mov r11,10
            mov r12,1
            calcular_magnitud:
                cmp r12,r13
                je digito_1
                MUL r11
                inc r12
                cmp r12,r13
                jne calcular_magnitud
            digito_1:
            mul r9
            add r14,rax
            inc r8
            dec r13
            cmp r13,rcx
        jne next_digito2

    cmp r14,r15
    je palindromo

    no_palindromo:
        xor r9,r9
        mov r9b,[mensaje2]
        mov [respuesta],r9
        jmp terminar
    palindromo:
        xor r9,r9
        mov r9b,[mensaje1]
        mov [respuesta],r9
     terminar:
        mov rax, 60
	    mov rdi, 0
	    syscall









