section .data
sum dq 0.0
msg1 db "(X86-64) Y Output: %.2lf, %.2lf, %.2lf, %.2lf, %.2lf, %.2lf, %.2lf, %.2lf, %.2lf, %.2lf", 10, 0

section .text
bits 64
default rel

global stencil_asm
extern printf

stencil_asm:   
    sub rsp, 8*11       
    mov r12, rcx 
    mov r13, rdx 
    mov r14, r8  
    mov rbx, 3
    mov r11, 0

LOOP:
    cmp r11, r12
    je print_result
    movsd xmm5, [r13 - 24 + 8*rbx] 
    addsd xmm5, [r13 - 16 + 8*rbx]
    addsd xmm5, [r13 - 8 + 8*rbx]
    addsd xmm5, [r13 + 8*rbx]
    addsd xmm5, [r13 + 8 + 8*rbx]
    addsd xmm5, [r13 + 16 + 8*rbx]
    addsd xmm5, [r13 + 24 + 8*rbx]
    movsd [r14 + 8*r11], xmm5
    inc rbx
    inc r11
    jmp LOOP

print_result:
    cmp r11, 10
    jg limit_10
    cmp r11, 3
    jg result_loop 
    cmp r11, 3
    je printsecond
    cmp r11, 2
    je printfirst
    cmp r11, 1
    je printzero
    cmp r11, 0
    je end
    
    limit_10:
        mov r11, 10
        jmp result_loop
    
    result_loop:
        cmp r11, 3
        je printsecond
        movsd xmm6, [r14 - 8 + 8*r11]
        movsd qword [sum], xmm6
        mov rax, [sum]
        mov [rsp + 8*r11], rax
        dec r11
        jmp result_loop
    
    printsecond:
        movsd xmm6, [r14 + 8*2]
        movsd qword [sum], xmm6
        mov r9, [sum]
        
    printfirst:
        movsd xmm6, [r14 + 8]
        movsd qword [sum], xmm6
        mov r8, [sum]
        
    printzero:
        movsd xmm6, [r14]
        movsd qword [sum], xmm6
        mov rdx, [sum]
    jmp end

end:
    mov rcx, msg1
    call printf
    add rsp, 8*11
    mov rax, r14 
    ret       