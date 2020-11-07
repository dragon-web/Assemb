TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'

; TODO: add your data here!!!!

string DB 13,10,'please input a letter $',13,10,13,10

DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

;*******************************************

START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
    MOV     AX, DSEG
    MOV     DS, AX
    MOV     ES, AX


; TODO: add your code here!!!!
LOOP:
	MOV AH,1
	INT 21H
	XOR AL,00100000B
	
	MOV DL,AL
	MOV AH,2
	INT 21H
	
	MOV DX,offset string
	MOV AH,9
	INT 21H
	
	MOV AH,1
	INT 21H
	CMP AL,'Y'
	JE LOOP
	CMP AL,'y'
	JE LOOP
	JNE OVER
	HLT
	OVER:HLT



; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

