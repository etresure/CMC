section .text

global _rule_one
global _rule_two 

_rule_one:
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword[ebp + 8]; str
.cycle:    
    mov dl, byte[esi]
    cmp dl, 0
    je .finish
    cmp dl, 'A'
    jb .skip
    cmp dl, 'Z'
    ja .skip
    mov al, dl
    sub al, 'A'
    mov ah, 'Z'
    sub ah, al
    mov byte[esi], ah
.skip:
    inc esi
    jmp .cycle
.finish:
    pop esi
    mov esp, ebp
    pop ebp
    ret
      
_rule_two:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 104; 26*4
    mov edx, dword[ebp + 8]; str
    xor edi, edi; all count
.cycle1:
    mov al, byte[edx]; s[0]
    cmp byte[edx], 0
    je .newStr
    mov ecx, dword[ebp + 8]
    xor esi, esi; count of cur symb
.cycle2:
    cmp byte[ecx], 0; end of str
    je .nextSymb; move to next symb
    cmp byte[ecx], al
    jne .notEq
    inc esi
.notEq:
    inc ecx
    jmp .cycle2
.nextSymb:
    inc edx
    cmp esi, 1
    jne .cycle1
    mov byte[esp-104+edi], al
    inc edi
    jmp .cycle1
.newStr:
    mov byte[esp-104+edi], 0
    xor edi, edi
    mov edx, dword[ebp + 8]
    mov al, byte[esp-104+edi]
.cycle:
    cmp al, 0
    je .finish
    mov byte[edx], al
    inc edx
    inc edi
    mov al, byte[esp-104+edi]
    jmp .cycle
.finish:
    mov byte[edx], 0
    add esp, 104
    pop edi 
    pop esi
    mov esp, ebp
    pop ebp
    ret
    
           
    
    
    
    
    
    
    
  

    
        
            
                
                    
                        
                            
                                
                                    
                                        
                                            
                                                    