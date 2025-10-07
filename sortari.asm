struc node
    .val resd 1
    .next resd 1
endstruc

section .text
global sort

;   struct node {
;    int val;
;    struct node* next;
;   };

;; struct node* sort(int n, struct node* node);
;   The function will link the nodes in the array
;   in ascending order and will return the address
;   of the new found head of the list
; @params:
;   n -> the number of nodes in the array
;   node -> a pointer to the beginning in the array
;   @returns:
;   the address of the head of the sorted list
sort:
    ; create a new stack frame
    enter 0, 0
    xor eax, eax

    ; ecx = n
    mov ecx, [ebp + 8]
    ; ebx = pointer la inceputul vectorului de noduri
    mov ebx, [ebp + 12]

    ; esi = valoarea pe care o cautam
    xor esi, esi
    ; edi = capul listei sortate
    xor edi, edi
    ; eax = ultimul nod pe care l am legat
    xor eax, eax

for_i:
    ; i++
    inc esi
    ; j = 0
    xor edx, edx

for_j:

    ; punem in ecx valoarea nodului de la indexul j
    mov ecx, [ebx + edx + node.val]
    ; daca valoarea nodului este i
    cmp ecx, esi
    ; sarim la gasit deoarece am gasit nodul
    je gasit

    ; adunam la edx 8 (8 = dimensiunea unui node, adica trecem la urmatorul node)
    add edx, 8
    jmp for_j

gasit:
    ; ecx = adresa nodului gasit
    lea ecx, [ebx + edx]

    ; daca esi nu e primul nod sarim in ultimul_legat
    cmp esi, 1
    jne ultimul_legat

    ; daca esi e primul nod, salvam in capul listei sortate pe ecx
    mov edi, ecx
    ; si sarim in salvam_ultimul_nod
    jmp salvam_ultimul_nod

ultimul_legat:
    ; legam pe ultimul nod cu acesta nou
    mov [eax + node.next], ecx

salvam_ultimul_nod:
    ; ultimul nod legat va fi acesta nou
    mov eax, ecx

    ; ecx = n
    mov ecx, [ebp + 8]

    ; daca i e mai mic decat n
    cmp esi, ecx
    ; sarim inapoi in for_i
    jl for_i

gata:
    ; eax = capul listei sortate
    mov eax, edi

    leave
    ret

