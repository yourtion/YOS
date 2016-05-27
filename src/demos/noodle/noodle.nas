[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_api_initmalloc
	EXTERN	_api_malloc
	EXTERN	_api_openwin
	EXTERN	_api_alloctimer
	EXTERN	_api_inittimer
	EXTERN	_sprintf
	EXTERN	_api_boxfilwin
	EXTERN	_api_putstrwin
	EXTERN	_api_settimer
	EXTERN	_api_getkey
	EXTERN	_api_end
[FILE "noodle.c"]
[SECTION .data]
LC0:
	DB	"noodle",0x00
LC1:
	DB	"%5d:%02d:%02d",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	EDI,EDI
	PUSH	EBX
	XOR	ESI,ESI
	SUB	ESP,28
	MOV	DWORD [-40+EBP],0
	CALL	_api_initmalloc
	PUSH	7500
	CALL	_api_malloc
	PUSH	LC0
	PUSH	-1
	PUSH	50
	PUSH	150
	PUSH	EAX
	CALL	_api_openwin
	MOV	DWORD [-32+EBP],EAX
	CALL	_api_alloctimer
	PUSH	128
	PUSH	EAX
	MOV	DWORD [-36+EBP],EAX
	CALL	_api_inittimer
	ADD	ESP,32
L2:
	PUSH	EDI
	LEA	EBX,DWORD [-28+EBP]
	PUSH	ESI
	PUSH	DWORD [-40+EBP]
	PUSH	LC1
	PUSH	EBX
	CALL	_sprintf
	PUSH	7
	PUSH	41
	PUSH	115
	PUSH	27
	PUSH	28
	PUSH	DWORD [-32+EBP]
	CALL	_api_boxfilwin
	ADD	ESP,44
	PUSH	EBX
	PUSH	11
	PUSH	0
	PUSH	27
	PUSH	28
	PUSH	DWORD [-32+EBP]
	CALL	_api_putstrwin
	PUSH	100
	PUSH	DWORD [-36+EBP]
	CALL	_api_settimer
	ADD	ESP,32
	PUSH	1
	CALL	_api_getkey
	POP	EDX
	ADD	EAX,-128
	JNE	L3
	INC	EDI
	CMP	EDI,60
	JNE	L2
	INC	ESI
	XOR	EDI,EDI
	CMP	ESI,60
	JNE	L2
	XOR	ESI,ESI
	INC	DWORD [-40+EBP]
	JMP	L2
L3:
	CALL	_api_end
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
