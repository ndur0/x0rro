; parameter order is: %rdi, %rsi, %rdx, %rcx, %r8, %r9, then push the rest on the stack in reverse order
; 74	AUE_MPROTECT	ALL	{ int mprotect(caddr_t addr, size_t len, int prot); }

_save_registers:
    push rdi
    push rcx
{{#sections_xor}}
    lea rdi, [{{{vaddr}}}]
    mov rcx, rdi
    add rcx, {{{vsize}}}
_xor_loop{{{name}}}:
    xor byte ptr [rdi], {{{xor_key}}}
    inc rdi
    cmp rdi, rcx
    jl _xor_loop{{{name}}}
{{/sections_xor}}
_restore_registers:
    pop rcx
    pop rdi
_jmp_back:
    jmp {{{entry_point}}}
