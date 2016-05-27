[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	__alloca
	EXTERN	_api_openwin
	EXTERN	_api_getkey
	EXTERN	_api_end
[FILE "winhelo.c"]
[SECTION .data]
LC0:
	DB	"hello",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EAX,7504
	MOV	EBP,ESP
	CALL	__alloca
	PUSH	LC0
	PUSH	-1
	LEA	EAX,DWORD [-7504+EBP]
	PUSH	50
	PUSH	150
	PUSH	EAX
	CALL	_api_openwin
	ADD	ESP,20
L2:
	PUSH	1
	CALL	_api_getkey
	POP	EDX
	CMP	EAX,10
	JNE	L2
	CALL	_api_end
	LEAVE
	RET
