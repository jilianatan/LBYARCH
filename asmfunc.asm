section .text
bits 64
default rel

global asmstencil

asmstencil:   
    sub rsp, 8*11       
    mov rsi, rcx 
    mov rdx, rdx 
    mov rdi, r8  
    mov rcx, 3  
    mov rax, 0 

LOOP:
    cmp rax, rsi
    je end
    movsd xmm5, [rdx-24+8*rcx] 
    addsd xmm5, [rdx-16+8*rcx]
    addsd xmm5, [rdx-8+8*rcx]
    addsd xmm5, [rdx+8*rcx]
    addsd xmm5, [rdx+8+8*rcx]
    addsd xmm5, [rdx+16+8*rcx]
    addsd xmm5, [rdx+24+8*rcx]
    movsd [rdi+8*rax], xmm5
    inc rcx
    inc rax
    jmp SHORT LOOP

end:
    add rsp, 8*11
    mov rdx, rdi
    ret      