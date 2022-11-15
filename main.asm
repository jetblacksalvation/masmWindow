option casemap:none
MessageBoxA proto	
ExitProcess proto

includelib kernel32.lib
includelib msvcrt.lib
includelib legacy_stdio_definitions.lib
.data


caption db 'window', 0
text db "your computer is hacked >:)", 0

.code
main proc
	;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messageboxexa
    ;https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messagebox

	sub rsp, 28h        ; space for 4 arguments + 16byte aligned stack
    xor r9d, r9d        ; 4. argument: r9d = uType = 0
    lea r8, caption   ; 3. argument: r8  = caption
    lea rdx, text     ; 2. argument: rdx = window text
    xor rcx, rcx        ; 1. argument: rcx = hWnd = NULL
    call MessageBoxA
    xor ecx, ecx        ; ecx = exit code
    call ExitProcess
main endp

end