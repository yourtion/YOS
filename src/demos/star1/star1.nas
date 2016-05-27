[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_api_initmalloc
	EXTERN	_api_malloc
	EXTERN	_api_openwin
	EXTERN	_api_boxfilwin
	EXTERN	_api_point
	EXTERN	_api_getkey
	EXTERN	_api_end
[FILE "star1.c"]
[SECTION .data]
LC0:
	DB	"star1",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EBX
	CALL	_api_initmalloc
	PUSH	15000
	CALL	_api_malloc
	PUSH	LC0
	PUSH	-1
	PUSH	100
	PUSH	150
	PUSH	EAX
	CALL	_api_openwin
	PUSH	0
	PUSH	93
	MOV	EBX,EAX
	PUSH	143
	PUSH	26
	PUSH	6
	PUSH	EAX
	CALL	_api_boxfilwin
	ADD	ESP,48
	PUSH	3
	PUSH	59
	PUSH	75
	PUSH	EBX
	CALL	_api_point
	ADD	ESP,16
L2:
	PUSH	1
	CALL	_api_getkey
	POP	EDX
	CMP	EAX,10
	JNE	L2
	MOV	EBX,DWORD [-4+EBP]
	LEAVE
	JMP	_api_end
