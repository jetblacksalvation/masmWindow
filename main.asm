option casemap:none
MessageBoxA proto	
ExitProcess proto

includelib kernel32.lib
includelib msvcrt.lib
includelib legacy_stdio_definitions.lib
.data
A db 5
B db 2
C dq 10

caption db 'window', 0,0
text db "this is a window", 0

.code
main proc
	xor rax,rax         ;avoid integer overflow during mul and div
	mov al,B
	mul C
	mov r8b,al
	idiv A
	mov r8b,al
	mov r9b,A
	sub r9b,r8b
	;mov result,r9b 

	sub rsp, 28h        ; space for 4 arguments + 16byte aligned stack
    xor r9d, r9d        ; 4. argument: r9d = uType = 0
    lea r8, [caption]   ; 3. argument: r8  = caption
    lea rdx, [text]     ; 2. argument: rdx = window text
    xor rcx, rcx        ; 1. argument: rcx = hWnd = NULL
    call MessageBoxA
    xor ecx, ecx        ; ecx = exit code
    call ExitProcess
main endp

end