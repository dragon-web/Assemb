; 微机原理第一次课内上机，2020-9-15 申辉

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
msg4 DB 'Our journey is a sea of stars','$'	;将“我们的征途是星辰大海”翻译成英文并将这串字符显示到屏幕上
msg5 DB 'FanLongFei','$'           ;此处存储你的姓名拼音，或者英文名字符串，并输出显示
msg6 DB '2001-01-22','$'             ;此处存储当前年月日信息，并输出显示
	
xx  DB 11101111B	;此处存储DATA OF PAGE 31 EXE9
YY  DB 11001001B
ZZ  DB 10
VV  DB 10


; Load address of msg to DX register:
START:  	
	;此处计算PAGE 31 EXE9，第一问
	MOV AL,XX	;COPY XX TO AL
	MOV BL,YY	;COPY YY TO BL
	ADD AL,BL	;AL=XX+YY
			
			;此处计算PAGE 31 EXE9，第二问
	MOV AL XX
	MOV BL ZZ
	ADD AL,BL
			;此处计算PAGE 31 EXE9，第三问
	MOV AL YY
	MOV BL ZZ
	ADD AL,BL			
			;此处计算PAGE 31 EXE9，第四问
			
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
