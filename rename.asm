%define SYS_EXIT 60
%define SYS_RENAME 82
%define SYS_WRITE 1
%define STDOUT 1

section .text
global _start

_start:
    pop rax                ; Armazena o valor do primeiro argumento em rax
    cmp rax, 3             ; Compara o valor de rax com 3
    jne .erro              ; Salta para .erro se a comparação for falsa
    pop rax                ; Armazena o valor do segundo argumento em rax
    mov rax, SYS_RENAME    ; Define o número do sistema SYS_RENAME em rax
    pop rdi                ; Armazena o primeiro argumento da pilha em rdi
    pop rsi                ; Armazena o segundo argumento da pilha em rsi
    syscall                ; Chama o sistema operacional para renomear o arquivo
    mov rax, SYS_EXIT      ; Define o número do sistema SYS_EXIT em rax
    xor rdi, rdi           ; Define rdi como 0 (código de saída)
    syscall                ; Chama o sistema operacional para sair do programa

.erro:
    lea rdi, [msgerroargs] ; Carrega o endereço da mensagem de erro em rdi
    mov rax, SYS_WRITE     ; Define o número do sistema SYS_WRITE em rax
    mov rdi, STDOUT        ; Define o descritor de arquivo STDOUT em rdi
    lea rsi, [msgerroargs] ; Carrega o endereço da mensagem de erro em rsi
    mov rdx, msglen        ; Carrega o comprimento da mensagem de erro em rdx
    syscall                ; Chama o sistema operacional para escrever a mensagem de erro

    mov rax, SYS_EXIT      ; Define o número do sistema SYS_EXIT em rax
    mov rdi, 1             ; Define o código de saída como 1
    syscall                ; Chama o sistema operacional para sair do programa

section .data
msgerroargs: db 'Quantidade de argumentos inválida', 10, 0  ; Mensagem de erro
msglen:     equ $-msgerroargs                               ; Comprimento da mensagem de erro
