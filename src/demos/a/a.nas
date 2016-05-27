[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_api_putchar
	EXTERN	_api_end
[FILE "a.c"]
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	65
	CALL	_api_putchar
	POP	EAX
	LEAVE
	JMP	_api_end
