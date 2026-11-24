global addstr
global is_palindromeASM
global factstr
global palindrome_check

extern atoi
extern fact
extern is_palindromeC
extern printf
extern scanf
extern strlen

section .data

prompt      db "Enter string: ",0
scanfmt     db "%s",0

palmsg      db "Palindrome",10,0
notmsg      db "Not Palindrome",10,0

section .bss

buffer      resb 100

section .text

; Adds two strings converted to ints
addstr:

    push ebp
    mov ebp, esp

    push ebx

    mov eax, [ebp+8]
    push eax
    call atoi
    add esp, 4

    mov ebx, eax

    mov eax, [ebp+12]
    push eax
    call atoi
    add esp, 4

    add eax, ebx

    pop ebx

    mov esp, ebp
    pop ebp
    ret

; Converts string to int and call fact()
factstr:

    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    push eax
    call atoi
    add esp, 4

    push eax
    call fact
    add esp, 4

    pop ebp
    ret


; Reused Assignment 3 palindrome code
is_palindromeASM:

    push ebp
    mov ebp, esp

    push ebx
    push esi
    push edi

    mov esi, [ebp+8]      ; string pointer

    push esi
    call strlen
    add esp, 4

    mov ecx, eax          ; length

    xor ebx, ebx          ; left index

    mov edi, ecx
    dec edi               ; right index

compare_loop:

    mov eax, ecx
    shr eax, 1

    cmp ebx, eax
    jge palindrome

    mov al, [esi+ebx]
    cmp al, [esi+edi]
    jne not_palindrome

    inc ebx
    dec edi

    jmp compare_loop

palindrome:

    mov eax, 1
    jmp done

not_palindrome:

    mov eax, 0

done:

    pop edi
    pop esi
    pop ebx

    mov esp, ebp
    pop ebp
    ret

; ASM -> C palindrome test
palindrome_check:

    push ebp
    mov ebp, esp

    push prompt
    call printf
    add esp, 4

    push buffer
    push scanfmt
    call scanf
    add esp, 8

    push buffer
    call is_palindromeC
    add esp, 4

    cmp eax, 1
    je pc_palindrome

pc_not_palindrome:

    push notmsg
    call printf
    add esp, 4
    jmp pc_done

pc_palindrome:

    push palmsg
    call printf
    add esp, 4

pc_done:

    pop ebp
    ret
