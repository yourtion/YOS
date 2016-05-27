[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_printf
	EXTERN	_exit
[FILE "hello4.c"]
[SECTION .data]
LC0:
	DB	"aaa",0x00
LC1:
	DB	"hello, world : %s %d",0x0A,0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	10
	PUSH	LC0
	PUSH	LC1
	CALL	_printf
	PUSH	0
	CALL	_exit
