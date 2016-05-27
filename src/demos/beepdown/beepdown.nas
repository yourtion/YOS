[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_api_alloctimer
	EXTERN	_api_inittimer
	EXTERN	_api_beep
	EXTERN	_api_settimer
	EXTERN	_api_getkey
	EXTERN	_api_end
[FILE "beepdown.c"]
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	MOV	EBX,20000000
	CALL	_api_alloctimer
	PUSH	128
	MOV	ESI,EAX
	PUSH	EAX
	CALL	_api_inittimer
	POP	EDX
	POP	ECX
L7:
	PUSH	EBX
	CALL	_api_beep
	PUSH	1
	PUSH	ESI
	CALL	_api_settimer
	PUSH	1
	CALL	_api_getkey
	ADD	ESP,16
	ADD	EAX,-128
	JNE	L3
	MOV	EAX,EBX
	MOV	EDX,100
	MOV	EDI,EDX
	CDQ
	IDIV	EDI
	SUB	EBX,EAX
	CMP	EBX,19999
	JG	L7
L3:
	PUSH	0
	CALL	_api_beep
	POP	EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_api_end
