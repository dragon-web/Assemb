; ΢��ԭ���һ�ο����ϻ���2020-9-15 ���

; Standard header:
	#make_COM#
        ORG  100H  

; Jump to start:
	JMP START

; Data:
msg1 DB 13, 10, 'Hello, World!', 13, 10, 13, 10 ,'$'
msg2 DB 'Come on ,Youth,AO-LI-GEI', 13, 10, 13, 10 ,'$'
msg3 DB 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
     DB 16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
     DB 32,41H,13, 10,'$'
msg4 DB 'Our journey is a sea of stars','$'	;�������ǵ���;���ǳ��󺣡������Ӣ�Ĳ����⴮�ַ���ʾ����Ļ��
msg5 DB 'FanLongFei','$'           ;�˴��洢�������ƴ��������Ӣ�����ַ������������ʾ
msg6 DB '2001-01-22','$'             ;�˴��洢��ǰ��������Ϣ���������ʾ
	
xx  DB 11101111B	;�˴��洢DATA OF PAGE 31 EXE9
YY  DB 11001001B
ZZ  DB 10
VV  DB 10


; Load address of msg to DX register:
START:  	
	;�˴�����PAGE 31 EXE9����һ��
	MOV AL,XX	;COPY XX TO AL
	MOV BL,YY	;COPY YY TO BL
	ADD AL,BL	;AL=XX+YY
			
			;�˴�����PAGE 31 EXE9���ڶ���
	MOV AL XX
	MOV BL ZZ
	ADD AL,BL
			;�˴�����PAGE 31 EXE9��������
	MOV AL YY
	MOV BL ZZ
	ADD AL,BL			
			;�˴�����PAGE 31 EXE9��������
			
	MOV AL ZZ
	MOV BL VV		
	ADD AL,BL	
			
			
			
			
        LEA DX, msg4	
        MOV AH, 9
        INT 21h
        
        LEA DX, msg5	
        MOV AH, 9
        INT 21h
        
        LEA DX, msg6	
        MOV AH, 9
        INT 21h
        


; Exit to operating system:
        MOV AH, 4Ch
        INT 21h
