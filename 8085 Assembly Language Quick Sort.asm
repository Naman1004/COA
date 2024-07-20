ORG 1000H         ; Origin point of the program

; Initialize stack pointer
LXI SP, 5000H     ; Set stack pointer

; Initialize pointers and array length
LXI H, 8000H      ; Point to the array start (8000H)
MOV C, M          ; Load array length into register C

; Check if array length is less than 2
MOV A, C
CPI 02H
JC END            ; If length < 2, end the program

CALL PUSH_STACK   ; Push initial low and high indices (0 and length-1)

QUICKSORT:
CALL POP_STACK    ; Pop low and high indices
MOV B, A          ; Move low index to B
MOV D, L          ; Move high index to D

CPI FFH
JZ END            ; If stack is empty, end the program

CALL PARTITION    ; Partition the array and get the pivot index

MOV A, E          ; Pivot index is in E

; Push left sub-array indices (low to pivot-1)
MOV L, A
DCR L
MOV A, B
CALL PUSH_STACK

; Push right sub-array indices (pivot+1 to high)
INX E
MOV L, D
MOV A, E
CALL PUSH_STACK

JMP QUICKSORT     ; Repeat quicksort

END:
HLT               ; Halt the program

PUSH_STACK:
MOV A, L
PUSH PSW          ; Push low index onto stack
MOV A, H
PUSH PSW          ; Push high index onto stack
RET

POP_STACK:
POP PSW           ; Pop high index from stack
MOV H, A
POP PSW           ; Pop low index from stack
MOV L, A
MOV A, H          ; Return low index in A and high index in L
RET

PARTITION:
MOV H, B          ; Low index in H
MOV L, D          ; High index in L
MOV A, M          ; Pivot element

; Initialize i and j
MOV E, H          ; i = low
MOV D, L          ; j = high

PARTITION_LOOP:
; Move i to the right until M[i] > pivot
PARTITION_I:
INX H
MOV A, M
CMP M
JNC PARTITION_I

; Move j to the left until M[j] < pivot
PARTITION_J:
DCX L
MOV A, M
CMP M
JC PARTITION_J

MOV A, H
CMP L
JNC PARTITION_DONE

; Swap M[i] and M[j]
XCHG
MOV A, H
MOV H, L
MOV L, A

JMP PARTITION_LOOP

PARTITION_DONE:
MOV A, L
MOV E, A         ; Pivot index in E
RET
