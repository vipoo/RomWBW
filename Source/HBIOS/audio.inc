#IF AUDIOTRACE
#DEFINE	AUDTRACE(STR)	PUSH DE \ LD DE, STR \ CALL WRITESTR \ POP DE
#DEFINE AUDTRACE_A	CALL PRTHEXBYTE
#DEFINE AUDTRACE_B	PUSH AF \ LD A, B \ CALL PRTHEXBYTE \ POP AF
#DEFINE AUDTRACE_D	PUSH AF \ LD A, D \ CALL PRTHEXBYTE \ POP AF
#DEFINE AUDTRACE_E	PUSH AF \ LD A, E \ CALL PRTHEXBYTE \ POP AF
#DEFINE AUDTRACE_L	PUSH AF \ LD A, L \ CALL PRTHEXBYTE \ POP AF
#DEFINE AUDTRACE_HL	CALL PRTHEXWORDHL
#DEFINE AUDTRACE_BC	PUSH HL \ PUSH BC \ POP HL \ CALL PRTHEXWORDHL \ POP HL
#DEFINE AUDTRACE_DE	PUSH HL \ PUSH DE \ POP HL \ CALL PRTHEXWORDHL \ POP HL
#DEFINE AUDTRACE_IY	PUSH HL \ PUSH IY \ POP HL \ CALL PRTHEXWORDHL \ POP HL

#DEFINE AUDDEBUG(S) push hl \ CALL PRTSTRD \ .TEXT S \ .TEXT "$" \ pop hl	; $$$$$$ PRINT STRING S TO CONSOLE - PRTD("HELLO") - NO TRAILING $ REQUIRED

#DEFINE AUDTRACE_CR AUDDEBUG("\r\n$")

#ELSE
#DEFINE	AUDTRACE(S)
#DEFINE AUDTRACE_A
#DEFINE AUDTRACE_B
#DEFINE AUDTRACE_D
#DEFINE AUDTRACE_E
#DEFINE AUDTRACE_L
#DEFINE AUDTRACE_BC
#DEFINE AUDTRACE_HL
#DEFINE AUDTRACE_DE
#DEFINE AUDTRACE_IY

#DEFINE AUDDEBUG(STR)

#DEFINE AUDTRACE_CR
#ENDIF


#IFNDEF AUDIOUTILS
#DEFINE AUDIOUTILS

AUD_NOTE:
	AUDDEBUG("AUDNOTE ")
	AUDTRACE_HL
	AUDTRACE_CR
	AUDTRACE_DE
	AUDTRACE_CR

	push	de
	LD	DE, 48
	CALL	DIV16
					; BC IS OCTAVE COUNT
					; HL is NOTE WITIN OCTAVE
	ADD	HL, HL
	pop	de
	ADD	HL, DE

	LD	A, (HL)			; RETRIEVE PERIOD COUNT FROM SN7NOTETBL
	INC	HL
	LD	H, (HL)
	LD	L, A

	INC	C
AUD_NOTE1:
	DEC	C
	JR	Z, AUD_NOTE2
	SRL	H
  	RR	L
	JR	AUD_NOTE1

AUD_NOTE2:
	LD	A, L			; IF NOT ZERO
	OR	H
	RET	NZ			; RETURN THE CALCULATED PERIOD

	LD	H, $FF			; OTHERWISE RETURN -1 PERIOD (ERROR)
	LD	L, $FF
	RET
#ENDIF