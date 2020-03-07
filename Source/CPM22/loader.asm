;===============================================================================
; LOADER.ASM
;
; BOOTLOADER FOR ROMWBW DISK OPERATING SYSTEMS.
;
; CP/M DISK FORMATS ALLOW FOR RESERVED TRACKS THAT CONTAIN AN IMAGE OF THE
; OPERATING SYSTEM TO BE LOADED WHEN THE DISK IS BOOTED.  THE OPERATING SYSTEM
; IMAGE ITSELF IS NORMALLY PREFIXED BY A 1-N SECTORS CONTAINING OS BOOTSTRAP
; CODE AND DISK METADATA.
;
; THE RETROBREW COMPUTING GROUP HAS BEEN USING A CONVENTION OF PREFIXING THE
; OS IMAGE WITH 3 SECTORS (512 BYTES X 3 FOR A TOTAL OF 1536 BYTES):
;
;   SECTOR 1: IBM-PC STYLE BOOT BLOCK CONTAINING BOOTSTRAP, 
;             PARTITION TABLE, AND BOOT SIGNATURE
;   SECTOR 2: RESERVED
;   SECTOR 3: METADATA
;
; THE HARDWARE BIOS IS EXPECTED TO READ AND LOAD THE FIRST TWO SECTORS FROM THE
; DISK TO MEMORY ADDRESS $8000 AND JUMP TO THAT LOCATION TO BEGIN THE BOOT
; PROCESS.  THE BIOS IS EXPECTED TO VERIFY THAT A STANDARD BOOT SIGNATURE
; OF $55, $AA IS PRESENT AT OFFSET $1FE-$1FF.  IF THE SIGNATURE IS NOT FOUND,
; THE BIOS SHOULD ASSUME THE DISK HAS NOT BEEN PROPERLY INITIALIZED AND SHOULD
; NOT JUMP TO THE LOAD ADDRESS.
;
;===============================================================================
;
#INCLUDE "../ver.inc"
;
SYS_ENT		.EQU	$E600		; SYSTEM (OS) ENTRY POINT ADDRESS
SYS_LOC		.EQU	$D000		; STARTING ADDRESS TO LOAD SYSTEM IMAGE
SYS_END		.EQU	$FE00		; ENDING ADDRESS OF SYSTEM IMAGE
;
BYT		.EQU	1	; used to describe METADATA_SIZE below
WRD		.EQU	2
;
SECTOR_SIZE	.EQU	512
BLOCK_SIZE	.EQU	128
PREFIX_SIZE	.EQU	(3 * SECTOR_SIZE)	; 3 SECTORS
METADATA_SIZE	.EQU	BYT+WRD+(4*BYT)+16+BYT+WRD+WRD+WRD+WRD	; (as defined below)
;
PARTTBL_LOC	.EQU	$1BE
PARTTBL_SIZ	.EQU	$40
BOOTSIG_LOC	.EQU	$1FE
;
;-------------------------------------------------------------------------------
; SECTOR 1
;
;   THIS SECTOR FOLLOWS THE CONVENTIONS OF AN IBM-PC MBR CONTAINING THE OS
;   BOOTSTRAP CODE, PARTITION TABLE, AND BOOT SIGNATURE
;
;----------------------------------------------------------------------------
;
; THE FOLLOWING BOOTSTRAP CODE IS BUILT TO ASSUME IT WILL BE EXECUTED AT A STARTING
; ADDRESS OF $8000.
;
	.ORG	$8000
	JR	BOOT
;
BOOT:
	LD	DE,STR_LOAD	; LOADING STRING
	CALL	PRTSTR		; PRINT
	CALL	PRTDOT		; PROGRESS
;
	LD	BC,$00FC	; UNA FUNC: GET BOOTSTRAP HISTORY
	CALL	$FFFD		; CALL UNA
	JR	NZ,ERROR	; HANDLE ERROR
	CALL	PRTDOT		; PROGRESS
	LD	B,L		; MOVE BOOT UNIT ID TO B
;
	LD	C,$41		; UNA FUNC: SET LBA
	LD	DE,0		; HI WORD ALWAYS ZERO
	LD	HL,3		; IMAGE STARTS AT FOURTH SECTOR
	CALL	$FFFD		; SET LBA
	JR	NZ,ERROR	; HANDLE ERROR
	CALL	PRTDOT		; PROGRESS
;
	LD	C,$42		; UNA FUNC: READ SECTORS
	LD	DE,$D000	; STARTING ADDRESS FOR IMAGE
	LD	L,22		; READ 22 SECTORS
	CALL	$FFFD		; DO READ
	JR	NZ,ERROR	; HANDLE ERROR
	CALL	PRTDOT		; PROGRESS
;
	LD	DE,STR_DONE	; DONE MESSAGE
	CALL	PRTSTR		; PRINT IT
;
	LD	D,B		; PASS BOOT UNIT TO OS
	LD	E,0		; ASSUME LU IS ZERO
	JP	SYS_ENT		; GO TO SYSTEM
;
PRTCHR:
	PUSH	BC
	PUSH	DE
	LD	BC,$0012	; UNIT 0, WRITE CHAR
	LD	E,A		; CHAR TO PRINT
	CALL	$FFFD		; PRINT
	POP	DE
	POP	BC
	RET
;
PRTSTR:
	PUSH	BC
	PUSH	HL
	LD	BC,$0015	; UNIT 0, WRITE CHARS UNTIL TERMINATOR
	LD	L,0		; TERMINATOR IS NULL
	CALL	$FFFD		; PRINT
	POP	HL
	POP	BC
	RET
;
PRTDOT:
	LD	A,'.'		; DOT CHARACTER
	JR	PRTCHR		; PRINT AND RETURN
;
; PRINT THE HEX BYTE VALUE IN A
;
PRTHEXBYTE:
	PUSH	AF
	PUSH	DE
	CALL	HEXASCII
	LD	A,D
	CALL	PRTCHR
	LD	A,E
	CALL	PRTCHR
	POP	DE
	POP	AF
	RET
;
; CONVERT BINARY VALUE IN A TO ASCII HEX CHARACTERS IN DE
;
HEXASCII:
	LD	D,A
	CALL	HEXCONV
	LD	E,A
	LD	A,D
	RLCA
	RLCA
	RLCA
	RLCA
	CALL	HEXCONV
	LD	D,A
	RET
;
; CONVERT LOW NIBBLE OF A TO ASCII HEX
;
HEXCONV:
	AND	0FH	     ;LOW NIBBLE ONLY
	ADD	A,90H
	DAA	
	ADC	A,40H
	DAA	
	RET	
;
ERROR:
	LD	DE,STR_ERR		; POINT TO ERROR STRING
	CALL	PRTSTR			; PRINT IT
	HALT				; HALT
;
; DATA
;
STR_LOAD	.DB	"\r\nLoading",0
STR_DONE	.DB	"\r\n",0
STR_ERR		.DB	" Read Error!",0
;
	.ORG	$ - $8000		; RESTORE ORG
	.FILL	PARTTBL_LOC - $		; FILL TO START OF PARTITION TABLE
;
; RESERVE SPACE FOR STANDARD IBM-PC PARTITION TABLE.  ALTHOUGH A
; PARTITION TABLE IS NOT RELEVANT FOR A FLOPPY DISK, IT DOES NO HARM.
; THE CONTENTS OF THE PARTITION TABLE MUST BE MANAGED BY FDISK80.
;
PARTTBL	.FILL	PARTTBL_SIZ,$00		; PARTITION TABLE, FILL WITH ZEROES
;
; THE END OF THE FIRST SECTOR MUST CONTAIN THE TWO BYTE BOOT
; SIGNATURE.
;
BOOTSIG	.DB	$55,$AA			; STANDARD BOOT SIGNATURE
;
;-------------------------------------------------------------------------------
; SECTOR 2
;
;   THIS SECTOR HAS NOT BEEN DEFINED AND IS RESERVED.
;
;----------------------------------------------------------------------------
;
	.FILL	512,0			; JUST FILL SECTOR WITH ZEROES
;
;-------------------------------------------------------------------------------
; SECTOR 3
;
;   OS AND DISK METADATA
;
;----------------------------------------------------------------------------
;
	.FILL	128 * 3,0		; FIRST 384 BYTES ARE NOT YET DEFINED
;
; THE FOLLOWING TWO BYTES ARE AN ADDITIONAL SIGNATURE THAT IS VERIFIED BY
; SOME HARDWARE BIOSES.
;
PR_SIG		.DB	$5A,$A5		; SIGNATURE GOES HERE
;
; FIRST CHUNK OF METADATA IMMEDIATELY FOLLOWS THE SIGNATURE BYTES
;
PR_PLATFORM	.DB	0		; PLATFORM ID (SEE STD.ASM)
PR_DEVICE	.DB	0		; ? (PROBABLY UNUSED)
PR_FORMATTER	.DB	0,0,0,0,0,0,0,0	; ? (PROBABLY UNUSED)
PR_DRIVE	.DB	0		; ? (PROBABLY UNUSED)
PR_LOG_UNIT	.DW	0		; ? (PROBABLY UNUSED)
;
; FILLER TO PLACE SECOND CHUNK OF METADATA AT THE END OF THE SECTOR
;
		.FILL	((PREFIX_SIZE - METADATA_SIZE) - $),00H
;
; SECOND CHUNK OF METADATA 
;
PR_WP		.DB	0		; WRITE PROTECT BOOLEADN
PR_UPDSEQ	.DW	0		; PREFIX UPDATE SEQUENCE NUMBER (DEPRECATED?)
PR_VER		.DB	RMJ,RMN,RUP,RTP	; OS BUILD VERSION
PR_LABEL	.DB	"Unlabeled Drive ","$"	; DISK LABEL (EXACTLY 16 BYTES!!!)
		.DW	0		; DEPRECATED
PR_LDLOC	.DW	SYS_LOC		; ADDRESS TO START LOADING SYSTEM
PR_LDEND	.DW	SYS_END		; ADDRESS TO STOP LOADING SYSTEM
PR_ENTRY	.DW	SYS_ENT		; ADDRESS TO ENTER SYSTEM (OS)
;
;
;
		.END
