[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_s.0
	EXTERN	_api_putstr0
	EXTERN	_api_end
[FILE "iroha.c"]
[SECTION .data]
_s.0:
	DB	-78
	DB	-37
	DB	-54
	DB	-58
	DB	-50
	DB	-51
	DB	-60
	DB	10
	DB	0
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	_s.0
	CALL	_api_putstr0
	POP	EAX
	LEAVE
	JMP	_api_end
