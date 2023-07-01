; The purpose of this file is to define generic symbols and to include
; the requested build configuration file to bring in platform specifics.

; There are several hardware platforms supported by SBC.
; 1.  SBC	Z80 SBC (v1 or v2) w/ ECB interface
; 2.  ZETA	Standalone Z80 SBC w/ SBC compatibility
; 3.  ZETA2	Second version of ZETA with enhanced memory bank switching
; 4.  N8	MSX-ish Z180 SBC w/ onboard video and sound
; 5.  MK4	Mark IV Z180 based SBC w/ ECB interface
; 6.  UNA	Any Z80/Z180 computer with UNA BIOS
; 7.  RCZ80	RCBUS based system with 512K banked RAM/ROM card
; 8.  RCZ180	RCBUS based system with Z180 CPU
; 9.  EZZ80	Easy Z80, Z80 SBC w/ RCBUS and CTC
; 10. SCZ180	Steve Cousins Z180 based system
; 11. DYNO	Steve Garcia's Dyno Micro-ATX Motherboard
; 12. RCZ280	Z280 CPU on RCBUS or ZZ80MB
; 13. MBC	Andrew Lynch's Multi Board Computer
; 14. RPH	Andrew Lynch's RHYOPHYRE Graphics Computer
; 15. Z80RETRO	Peter Wilson's Z80-Retro Computer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; INCLUDE VERSION
;
#INCLUDE "../ver.inc"			; ADD BIOSVER
;
FALSE		.EQU	0
TRUE		.EQU	~FALSE
;
; DEBUGGING OPTIONS
;
USENONE		.EQU	0		; NO DEBUG
USEXIO		.EQU	1		; BASIC SERIAL DRIVER
USEMIO		.EQU	2		; MEMORY BUFFER DRIVER
WBWDEBUG	.EQU	USENONE
;
; DIAGNOSTIC LEVEL OPTIONS
;
DL_NONE		.EQU	0		; HBIOS DISPLAY NO MESSAGES
DL_CRITICAL	.EQU	4		; HBIOS DISPLAY CRITICAL ERROR MESSAGES
DL_ERROR	.EQU	8		; HBIOS DISPLAYS ALL ERROR MESSAGES
DL_WARNING	.EQU	12		; HBIOS DISPLAYS WARNING MESSAGES
DL_INFO		.EQU	16		; HBIOS DISPLAYS INFORMATIONAL MESSAGES
DL_DETAIL	.EQU	20		; HBIOS DISPLAYS DETAILED DIAGNOSTIC MESSAGES
DL_VERBOSE	.EQU	24		; HBIOS DISPLAYS ANYTHING IT KNOWS HOW TO
;
; CPU TYPES
;
CPU_NONE	.EQU	0		; NO CPU TYPE DEFINED
CPU_Z80		.EQU	1		; Z80 FAMILY
CPU_Z180	.EQU	2		; Z180 FAMILY
CPU_Z280	.EQU	3		; Z280 FAMILY
;
; BIOS MODE
;
BIOS_NONE	.EQU	0		; NO BIOS TYPE DEFINED
BIOS_WBW	.EQU	1		; ROMWBW HBIOS
BIOS_UNA	.EQU	2		; UNA UBIOS
;
; MEMORY MANAGERS
;
MM_NONE		.EQU	0
MM_SBC		.EQU	1		; ORIGINAL N8VEM/RBC Z80 SBC BANKED MEMORY
MM_Z2		.EQU	2		; 16K X 4 BANKED MEMORY INTRODUCED ON ZETA2
MM_N8		.EQU	3		; Z180 CUSTOMIZED FOR N8 MEMORY EXTENSIONS
MM_Z180		.EQU	4		; Z180 NATIVE MEMORY MANAGER
MM_Z280		.EQU	5		; Z280 NATIVE MEMORY MANAGER
MM_ZRC		.EQU	6		; ZRC BANK SWITCHING
MM_MBC		.EQU	7		; MBC MEMORY MANAGER
MM_RPH		.EQU	8		; Z180 WITH RPH EXTENSIONS
;
; BOOT STYLE
;
BT_MENU		.EQU	1		; WAIT FOR MENU SELECTION AT LOADER PROMPT
BT_AUTO		.EQU	2		; AUTO SELECT BOOT_DEFAULT AFTER BOOT_TIMEOUT
;
; BOOT RECOVERY METHODS
;
BT_REC_NONE	.EQU	0		; NO RECOVERY MODE
BT_REC_FORCE	.EQU	1		; FORCE BOOT RECOVERY MODE
BT_REC_SBC01	.EQU	2		; ECB-SBCV2 - BIT 1 RTC HIGH
BT_REC_SBC1B	.EQU	3		; ECB-SBCV2 - 1-BIT IO PORT
BT_REC_SBCRI	.EQU	4		; ECB-SBCV2 - 16550 UART RING INDICATOR LINE
;
BT_REC_TYPE	.EQU	BT_REC_NONE	; BOOT RECOVERY METHOD TO USE
;
; FLOPPY DISK MEDIA SELECTIONS (ID'S MUST BE INDEX OF ENTRY IN FCD_TBL)
;
FDM720		.EQU	0		; 3.5" FLOPPY, 720KB, 2 SIDES, 80 TRKS, 9 SECTORS
FDM144		.EQU	1		; 3.5" FLOPPY, 1.44MB, 2 SIDES, 80 TRKS, 18 SECTORS
FDM360		.EQU	2		; 5.25" FLOPPY, 360KB, 2 SIDES, 40 TRKS, 9 SECTORS
FDM120		.EQU	3		; 5.25" FLOPPY, 1.2MB, 2 SIDES, 80 TRKS, 15 SECTORS
FDM111		.EQU	4		; 8" FLOPPY, 1.11MB, 2 SIDES, 74 TRKS, 15 SECTORS
;
; FLOPPY DISK TYPE
;
FDT_NONE	.EQU	0		; NONE
FDT_3DD		.EQU	1		; 3.5" FLOPPY, DOUBLE DENSITY
FDT_3HD		.EQU	2		; 3.5" FLOPPY, HIGH DENSITY
FDT_5DD		.EQU	3		; 5.25" FLOPPY, DOUBLE DENSITY
FDT_5HD		.EQU	4		; 5.25" FLOPPY, HIGH DNSITY
FDT_8		.EQU	5		; 8" FLOPPY, DOUBLE DENSITY
;
; ZILOG CTC MODE SELECTIONS
;
CTCMODE_NONE	.EQU	0		; NO CTC
CTCMODE_CTR	.EQU	1		; CTC COUNTER
CTCMODE_TIM16	.EQU	2		; CTC TIMER W/ DIV 16
CTCMODE_TIM256	.EQU	3		; CTC TIMER W/ DIV 256
;
; DS1302 RTC MODE SELECTIONS
;
DSRTCMODE_NONE	.EQU	0		; NO DSRTC
DSRTCMODE_STD	.EQU	1		; ORIGINAL DSRTC CIRCUIT (SBC, ZETA, MK4)
DSRTCMODE_MFPIC	.EQU	2		; MF/PIC VARIANT
;
; DS1307 RTC MODE SELECTIONS
;
DS7RTCMODE_NONE	.EQU	0		; NO DSRTC
DS7RTCMODE_PCF	.EQU	1		; PCF8584 I2C
;
; SIO MODE SELECTIONS
;
SIOMODE_NONE	.EQU	0
SIOMODE_STD	.EQU	1		; STD SIO REG CFG (EZZ80, KIO)
SIOMODE_RC	.EQU	2		; RCBUS SIO MODULE (SPENCER OWEN)
SIOMODE_SMB	.EQU	3		; RCBUS SIO MODULE (SCOTT BAKER)
SIOMODE_ZP	.EQU	4		; ECB-ZILOG PERIPHERALS BOARD
SIOMODE_Z80R	.EQU	5		; SIO A/B SWAPPED
;
; TYPE OF CONSOLE BELL TO USE
;
CONBELL_NONE	.EQU	0
CONBELL_PSG	.EQU	1
CONBELL_IOBIT	.EQU	2
;
; LED MODE SELECTIONS
;
LEDMODE_NONE	.EQU	0
LEDMODE_STD	.EQU	1
LEDMODE_RTC	.EQU	2
;
; DSKY MODE SELECTIONS
;
DSKYMODE_NONE	.EQU	0
DSKYMODE_V1	.EQU	1
DSKYMODE_NG	.EQU	2
;
; FD MODE SELECTIONS
;
FDMODE_NONE	.EQU	0
FDMODE_DIO	.EQU	1		; DISKIO V1
FDMODE_ZETA	.EQU	2		; ZETA
FDMODE_ZETA2	.EQU	3		; ZETA V2
FDMODE_DIDE	.EQU	4		; DUAL IDE
FDMODE_N8	.EQU	5		; N8
FDMODE_DIO3	.EQU	6		; DISKIO V3
FDMODE_RCSMC	.EQU	7		; RCBUS SMC 9266 @ $40 (SCOTT BAKER)
FDMODE_RCWDC	.EQU	8		; RCBUS WDC 37C65 @ $40 (SCOTT BAKER)
FDMODE_DYNO	.EQU	9		; DYNO WDC 37C65 @ $84
FDMODE_EPFDC	.EQU	10		; RCBUS ETCHED PIXELS FDC
FDMODE_MBC	.EQU	11		; MULTI-BOARD COMPUTER FDC
;
; IDE MODE SELECTIONS
;
IDEMODE_NONE	.EQU	0
IDEMODE_DIO	.EQU	1		; DISKIO V1
IDEMODE_DIDE	.EQU	2		; DUAL IDE
IDEMODE_MK4	.EQU	3		; MARK IV ONBOARD IDE (8 BIT ONLY)
IDEMODE_RC	.EQU	4		; RCBUS CF MODULE (8 BIT ONLY)
;
; PPIDE MODE SELECTIONS
;
PPIDEMODE_NONE	.EQU	0
PPIDEMODE_SBC	.EQU	1		; STANDARD SBC PARALLEL PORT
PPIDEMODE_DIO3	.EQU	2		; DISKIO V3 PARALLEL PORT
PPIDEMODE_MFP	.EQU	3		; MULTIFUNCTION / PIC
PPIDEMODE_N8	.EQU	4		; MULTIFUNCTION / PIC
PPIDEMODE_RC	.EQU	5		; RCBUS PPIDE MODULE @ $20 (ED BRINDLEY)
PPIDEMODE_DYNO	.EQU	6		; DYNO PPIDE @ $4C
PPIDEMODE_RPH	.EQU	7		; RHYOPHYRE (RPH)
;
; SD MODE SELECTIONS
;
SDMODE_NONE	.EQU	0
SDMODE_JUHA	.EQU	1		; JUHA MINI BOARD
SDMODE_N8	.EQU	2		; N8-2511, UNMODIFIED
SDMODE_CSIO	.EQU	3		; N8-2312 OR N8-2511 MODIFIED
SDMODE_PPI	.EQU	4		; PPISD MINI BOARD
SDMODE_UART	.EQU	5		; SD INTERFACE VIA UART
SDMODE_DSD	.EQU	6		; DUAL SD
SDMODE_MK4	.EQU	7		; MARK IV
SDMODE_SC	.EQU	8		; SC (Steve Cousins)
SDMODE_MT	.EQU	9		; MT (Shift register SPI WIZNET for RCBUS)
SDMODE_USR	.EQU	10		; USER DEFINED (in sd.asm) (NOT COMPLETE)
SDMODE_PIO	.EQU	11		; Z80 PIO bitbang
SDMODE_Z80R	.EQU	12		; Z80 Retro
;
; AY SOUND CHIP MODE SELECTIONS
;
AYMODE_NONE	.EQU	0
AYMODE_N8	.EQU	1		; N8 BUILT-IN SOUND
AYMODE_SCG	.EQU	2		; SCG ECB BOARD
AYMODE_RCZ80	.EQU	3		; RCBUS SOUND MODULE BY ED BRINDLEY ON Z80
AYMODE_RCZ180	.EQU	4		; RCBUS SOUND MODULE BY ED BRINDLEY ON Z180
AYMODE_MSX	.EQU	5		; RCBUS SOUND MODULE REV6 BY ED BRINDLEY ON Z80/Z180 AT MSX PORTS
AYMODE_LINC	.EQU	6		; LINC Z50 AY SOUND CARD
AYMODE_MBC	.EQU	7		; MBC SOUND BOARD
;
; SN SOUND CHIP MODE SELECTIONS
;
SNMODE_NONE	.EQU	0
SNMODE_RC	.EQU	1		; RCBUS SOUND MODULE
SNMODE_VGM	.EQU	2		; VGM ECB BOARD
;
; TMS VIDEO MODE SELECTIONS
;
TMSMODE_NONE	.EQU	0
TMSMODE_SCG	.EQU	1		; SCG ECB BOARD
TMSMODE_N8	.EQU	2		; N8 BUILT-IN VIDEO
TMSMODE_MSX	.EQU	3		; MSX PORT MAPPING
TMSMODE_MSX9958	.EQU	4		; MSX PORTS, V9958 CHIP
TMSMODE_MSXKBD	.EQU	5		; MSX PORTS + PS2 KEYBOARD
TMSMODE_MBC	.EQU	6		; MBC V9938/58 VIDEO BOARD
TMSMODE_COLECO	.EQU	7		; COLECOVISION PORT MAPPING
;
; CVDU VIDEO MODE SELECTIONS
;
CVDUMODE_NONE	.EQU	0
CVDUMODE_ECB	.EQU	1		; SCG ECB BOARD
CVDUMODE_MBC	.EQU	2		; MBC VDC BOARD
;
; CVDU MONITOR SELECTIONS
;
CVDUMON_NONE	.EQU	0
CVDUMON_CGA	.EQU	1		; CGA MONITOR TIMING (16.000 MHZ OSC)
CVDUMON_EGA	.EQU	2		; EGA MONITOR TIMING (16.257 MHZ OSC)
;
; GDC VIDEO MODE SELECTIONS
;
GDCMODE_NONE	.EQU	0
GDCMODE_ECB	.EQU	1		; ECB GDC
GDCMODE_RPH	.EQU	2		; RPH GDC
;
; LPT DRIVER MODE SELECTIONS
;
LPTMODE_NONE	.EQU	0		; NONE
LPTMODE_SPP	.EQU	1		; IBM PC STANDARD PAR PORT (SPP)
LPTMODE_MG014	.EQU	2		; RCBUS MG014 STYLE INTERFACE
;
; PPA DRIVER MODE SELECTIONS
;
PPAMODE_NONE	.EQU	0		; NONE
PPAMODE_SPP	.EQU	1		; IBM PC STANDARD PAR PORT (SPP)
PPAMODE_MG014	.EQU	2		; RCBUS MG014 STYLE INTERFACE
;
; IMM DRIVER MODE SELECTIONS
;
IMMMODE_NONE	.EQU	0		; NONE
IMMMODE_SPP	.EQU	1		; IBM PC STANDARD PAR PORT (SPP)
IMMMODE_MG014	.EQU	2		; RCBUS MG014 STYLE INTERFACE
;
; SYQ DRIVER MODE SELECTIONS
;
SYQMODE_NONE	.EQU	0		; NONE
SYQMODE_SPP	.EQU	1		; IBM PC STANDARD PAR PORT (SPP)
SYQMODE_MG014	.EQU	2		; RCBUS MG014 STYLE INTERFACE
;
; GDC MONITOR SELECTIONS
;
GDCMON_NONE	.EQU	0
GDCMON_CGA	.EQU	1		; CGA MONITOR TIMING (16.000 MHZ OSC)
GDCMON_EGA	.EQU	2		; EGA MONITOR TIMING (16.257 MHZ OSC)
;
; DMA MODE SELECTIONS
;
DMAMODE_NONE	.EQU	0
DMAMODE_ECB	.EQU	1		; ECB-DMA WOLFGANG KABATZKE'S Z80 DMA ECB BOARD
DMAMODE_Z180	.EQU	2		; Z180 INTEGRATED DMA
DMAMODE_Z280	.EQU	3		; Z280 INTEGRATED DMA
DMAMODE_RC	.EQU	4		; RCBUS Z80 DMA
DMAMODE_MBC	.EQU	5		; MBC
;
; KEYBOARD MODE SELECTIONS
;
KBDMODE_NONE	.EQU	0
KBDMODE_PS2	.EQU	1		; PS/2 KEYBOARD CONTROLLER
KBDMODE_VRC	.EQU	2		; VGARC KEYBOARD CONTROLLER
;
; SERIAL DEVICE CONFIGURATION CONSTANTS
;
SER_DATA5	.EQU	0 << 0
SER_DATA6	.EQU	1 << 0
SER_DATA7	.EQU	2 << 0
SER_DATA8	.EQU	3 << 0
;
SER_PARNONE	.EQU	0 << 3
SER_PARODD	.EQU	1 << 3
SER_PAREVEN	.EQU	3 << 3
SER_PARMARK	.EQU	5 << 3
SER_PARSPACE	.EQU	7 << 3
;
SER_STOP1	.EQU	0 << 2
SER_STOP2	.EQU	1 << 2
;
; SERIAL BAUD RATES ENCODED AS V = 75 * 2^X * 3^Y
; AND STORED AS 5 BITS: YXXXX
;
SER_BAUD75	.EQU	$00 << 8
SER_BAUD150	.EQU	$01 << 8
SER_BAUD300	.EQU	$02 << 8
SER_BAUD600	.EQU	$03 << 8
SER_BAUD1200	.EQU	$04 << 8
SER_BAUD2400	.EQU	$05 << 8
SER_BAUD4800	.EQU	$06 << 8
SER_BAUD9600	.EQU	$07 << 8
SER_BAUD19200	.EQU	$08 << 8
SER_BAUD38400	.EQU	$09 << 8
SER_BAUD76800	.EQU	$0A << 8
SER_BAUD153600	.EQU	$0B << 8
SER_BAUD307200	.EQU	$0C << 8
SER_BAUD614400	.EQU	$0D << 8
SER_BAUD1228800	.EQU	$0E << 8
SER_BAUD2457600	.EQU	$0F << 8
SER_BAUD225	.EQU	$10 << 8
SER_BAUD450	.EQU	$11 << 8
SER_BAUD900	.EQU	$12 << 8
SER_BAUD1800	.EQU	$13 << 8
SER_BAUD3600	.EQU	$14 << 8
SER_BAUD7200	.EQU	$15 << 8
SER_BAUD14400	.EQU	$16 << 8
SER_BAUD28800	.EQU	$17 << 8
SER_BAUD57600	.EQU	$18 << 8
SER_BAUD115200	.EQU	$19 << 8
SER_BAUD230400	.EQU	$1A << 8
SER_BAUD460800	.EQU	$1B << 8
SER_BAUD921600	.EQU	$1C << 8
SER_BAUD1843200	.EQU	$1D << 8
SER_BAUD3686400	.EQU	$1E << 8
SER_BAUD7372800	.EQU	$1F << 8
;
; UART DIVIDER VALUES
; STORED AS 5 BITS: YXXXX
;
DIV_1		.EQU	$00
DIV_2		.EQU	$01
DIV_4		.EQU	$02
DIV_8		.EQU	$03
DIV_16		.EQU	$04
DIV_32		.EQU	$05
DIV_64		.EQU	$06
DIV_128		.EQU	$07
DIV_256		.EQU	$08
DIV_512		.EQU	$09
DIV_1024	.EQU	$0A
DIV_2048	.EQU	$0B
DIV_4096	.EQU	$0C
DIV_8192	.EQU	$0D
DIV_16384	.EQU	$0E
DIV_32768	.EQU	$0F
DIV_3		.EQU	$10
DIV_6		.EQU	$11
DIV_12		.EQU	$12
DIV_24		.EQU	$13
DIV_48		.EQU	$14
DIV_96		.EQU	$15
DIV_192		.EQU	$16
DIV_384		.EQU	$17
DIV_768		.EQU	$18
DIV_1536	.EQU	$19
DIV_3072	.EQU	$1A
DIV_6144	.EQU	$1B
DIV_12288	.EQU	$1C
DIV_24576	.EQU	$1D
DIV_49152	.EQU	$1E
DIV_98304	.EQU	$1F
;
SER_XON		.EQU	1 << 6
SER_DTR		.EQU	1 << 7
SER_RTS		.EQU	1 << 13
;
SER_75_8N1	.EQU	SER_BAUD75 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_150_8N1	.EQU	SER_BAUD150 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_300_8N1	.EQU	SER_BAUD300 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_600_8N1	.EQU	SER_BAUD600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_1200_8N1	.EQU	SER_BAUD1200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_2400_8N1	.EQU	SER_BAUD2400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_4800_8N1	.EQU	SER_BAUD4800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_9600_8N1	.EQU	SER_BAUD9600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_19200_8N1	.EQU	SER_BAUD19200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_38400_8N1	.EQU	SER_BAUD38400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_76800_8N1	.EQU	SER_BAUD76800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_153600_8N1	.EQU	SER_BAUD153600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_307200_8N1	.EQU	SER_BAUD307200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_614400_8N1	.EQU	SER_BAUD614400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_1228800_8N1	.EQU	SER_BAUD1228800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_2457600_8N1	.EQU	SER_BAUD2457600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_225_8N1	.EQU	SER_BAUD225 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_450_8N1	.EQU	SER_BAUD450 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_900_8N1	.EQU	SER_BAUD900 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_1800_8N1	.EQU	SER_BAUD1800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_3600_8N1	.EQU	SER_BAUD3600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_7200_8N1	.EQU	SER_BAUD7200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_14400_8N1	.EQU	SER_BAUD14400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_28800_8N1	.EQU	SER_BAUD28800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_57600_8N1	.EQU	SER_BAUD57600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_115200_8N1	.EQU	SER_BAUD115200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_230400_8N1	.EQU	SER_BAUD230400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_460800_8N1	.EQU	SER_BAUD460800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_921600_8N1	.EQU	SER_BAUD921600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_1843200_8N1	.EQU	SER_BAUD1843200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_3686400_8N1	.EQU	SER_BAUD3686400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_7372800_8N1	.EQU	SER_BAUD7372800 | SER_DATA8 | SER_PARNONE | SER_STOP1
;
; TERMENABLE CONTROLS INCLUSION OF TERMINAL PSEUDO-DEVICE DRIVER
; IT IS SET TO TRUE BY THE INCLUSION OF ANY VDA DRIVER.
;
TERMENABLE	.EQU	FALSE		; TERM PSEUDO DEVICE, WILL AUTO-ENABLE IF A VDA IS ENABLED
;
; VIDEO MODES
;
V80X24		.EQU	0	; ECB-VDU
V80X25		.EQU	1	; ECB-VDU, ECB-VGA3
V80X30		.EQU	2	; ECB-VDU, ECB-VGA3
V80X25B		.EQU	3	; ECB-VDU
V80X24B		.EQU	4	; ECB-VDU
V80X43		.EQU	5	; ECB-VGA3
V80X60		.EQU	6	; ECB-VGA3
;
; KEYBOARD LAYOUTS
;
KBD_US		.EQU	0	; US ENGLISH
KBD_DE		.EQU	1	; GERMAN
;
; EMULATION TYPES
;
EMUTYP_NONE	.EQU	0		; NONE
EMUTYP_TTY	.EQU	1		; TTY
EMUTYP_ANSI	.EQU	2		; ANSI
;
; WATCHDOG TYPES
;
WDOG_NONE	.EQU	0		; NONE
WDOG_EZZ80	.EQU	1		; EASY Z80 WATCHDOG
WDOG_SKZ	.EQU	2		; SK Z80 CPU W/ 512K
;
; SYSTEM SPEED CAPABILITIES
;
SPD_FIXED	.EQU	0		; PLATFORM SPEED FIXED AND CANNOT CHANGE SPEEDS
SPD_HILO	.EQU	1		; PLATFORM CAN CHANGE BETWEEN TWO SPEEDS
;
; SYSTEM SPEED CHARACTERISTICS
;
SPD_UNSUP	.EQU	0		; PLATFORM CAN CHANGE SPEEDS BUT IS UNSUPPORTED
SPD_HIGH	.EQU	1		; PLATFORM CAN CHANGE SPEED, STARTS HIGH
SPD_LOW		.EQU	2		; PLATFORM CAN CHANGE SPEED, STARTS LOW
;
; SCSI COMMAND CODES (SHOULD BE IT IT'S OWN FILE)
;
SCSI_CMD_TSTRDY		.EQU	$00
SCSI_CMD_SENSE		.EQU	$03
SCSI_CMD_READ		.EQU	$08
SCSI_CMD_WRITE		.EQU	$0A
SCSI_CMD_INQ		.EQU	$12
SCSI_CMD_START		.EQU	$1B
SCSI_CMD_RDCAP		.EQU	$25
SCSI_CMD_READ10		.EQU	$28
SCSI_CMD_WRITE10	.EQU	$2A
;
#INCLUDE "build.inc"		; INCLUDE USER CONFIG, ADD VARIANT, TIMESTAMP, & ROMSIZE
;
; INCLUDE Z180 REGISTER DEFINITIONS
;
#IF (BIOS == BIOS_WBW)
  #IF (CPUFAM == CPU_Z180)
    #INCLUDE "z180.inc"
  #ENDIF
  #IF (CPUFAM == CPU_Z280)
    #INCLUDE "z280.inc"
  #ENDIF
  #IF (EIPCENABLE)
    #INCLUDE "eipc.inc"
  #ENDIF
#ENDIF
;
; SETUP DEFAULT CPU SPEED VALUES
;
CPUKHZ		.EQU	CPUOSC / 1000	; CPU FREQ IN KHZ
;
#IF (BIOS == BIOS_WBW)
  #IF (CPUFAM == CPU_Z180)
    #IF (Z180_CLKDIV == 0)
CPUKHZ		.SET	CPUKHZ / 2	; ADJUST FOR HALF SPEED OPERATION
    #ENDIF
    #IF (Z180_CLKDIV == 2)
CPUKHZ		.SET	CPUKHZ * 2	; ADJUST FOR DOUBLE SPEED OPERATION
    #ENDIF
  #ENDIF
  #IF (CPUFAM == CPU_Z280)
CPUKHZ		.SET	CPUKHZ / 2	; Z180 PHI IS ALWAYS 1/2 OSC
  #ENDIF
#ENDIF
;
CPUMHZ		.EQU	CPUKHZ / 1000	; CPU FREQ IN MHZ
;
; SYSTEM PERIODIC TIMER MODE
;
#IF (BIOS == BIOS_WBW)
;
TM_NONE	.EQU	0
TM_CTC	.EQU	1
TM_TMS	.EQU	2
TM_SIMH	.EQU	3
TM_Z180	.EQU	4
TM_Z280	.EQU	5
;
	.ECHO "SYSTEM TIMER:"
SYSTIM	.EQU	TM_NONE
;
  #IF (CTCENABLE & (INTMODE == 2))
    #IF (CTCTIMER)
SYSTIM	.SET	TM_CTC
	.ECHO	" CTC"
    #ENDIF
  #ENDIF
;
  #IF (TMSENABLE & (INTMODE == 1))
    #IF (TMSTIMENABLE)
SYSTIM	.SET	TM_TMS
	.ECHO	" TMS9918/V9958"
    #ENDIF
  #ENDIF
;
  #IF ((PLATFORM == PLT_SBC) & (INTMODE == 1))
    #IF (HTIMENABLE)
SYSTIM	.SET	TM_SIMH
	.ECHO	" SIMH"
    #ENDIF
  #ENDIF
;
  #IF ((CPUFAM == CPU_Z180) & (INTMODE == 2))
    #IF (Z180_TIMER)
SYSTIM	.SET	TM_Z180
	.ECHO	" Z180"
    #ENDIF
  #ENDIF
;
  #IF ((CPUFAM == CPU_Z280) & (MEMMGR == MM_Z280))
    #IF (Z280_TIMER)
SYSTIM	.SET	TM_Z280
	.ECHO	" Z280"
    #ENDIF
  #ENDIF
;
  #IF SYSTIM == TM_NONE
	.ECHO " NONE"
  #ENDIF
;
	.ECHO	"\n"
;
#ENDIF
;
; MEMORY BANK CONFIGURATION
;
WBW_ROM_R	.EQU	128	; 128K			; RESERVED ROM REQUIRED FOR ROMWBW
WBW_RAM_R	.EQU	256	; 256K			; RESERVED RAM REQUIRED FOR ROMWBW
TOT_ROM_RB	.EQU	(WBW_ROM_R / 32)		; TOTAL ROM BANKS RESERVED
TOT_RAM_RB	.EQU	(WBW_RAM_R / 32)		; TOTAL RAM BANKS RESERVED
;
#IF (BIOS == BIOS_UNA)
BID_ROM0	.EQU	$0000
BID_RAM0	.EQU	$8000
#ENDIF
;
#IF (BIOS == BIOS_WBW)
BID_ROM0	.EQU	$00
BID_RAM0	.EQU	$80
#ENDIF

BID_ROMN	.EQU	(BID_ROM0 + ((ROMSIZE / 32) - 1))
BID_RAMN	.EQU	(BID_RAM0 + ((RAMSIZE / 32) - 1))
;
BID_RAMD0	.EQU	BID_RAM0	; FIRST RAM DRIVE BANK			 ^  RAM
BID_RAMDN	.EQU	BID_RAMN - TOT_RAM_RB	; LAST RAM DRIVE BANK		 |  DRIVE
;					; OS BUFFERS CP/M3?			-+ THESE	CPM3 BNK 5 (BUF)
;					; OS BUFFERS CP/M3?			 | MAKE		CPM3 BNK 4 (BUF)
;					; OS BUFFERS CP/M3?			 | UP		CPM3 BNK 3 (BUF)
;					; OS BUFFERS CP/M3?			 | THE		CPM3 BNK 2 (BUF)
BID_AUX		.EQU	BID_RAMN - 3	; AUX BANK (BPBIOS, ETC.)		 | 256KB	CPM3 BNK 1 (TPA)
BID_BIOS	.EQU	BID_RAMN - 2	; BIOS BANK				 | RESERVED
BID_USR		.EQU	BID_RAMN - 1	; USER BANK (CP/M TPA, ETC.)		 | RAM		CPM3 BNK 0 (OS)
BID_COM		.EQU	BID_RAMN - 0	; COMMON BANK, UPPER 32K		-+ BANKS
BID_BOOT	.EQU	BID_ROM0 + 0	; BOOT BANK				-+ THESE MAKE
BID_IMG0	.EQU	BID_ROM0 + 1	; ROM LOADER AND FIRST IMAGES BANK	 | UP THE 128KB
BID_IMG1	.EQU	BID_ROM0 + 2	; SECOND IMAGES BANK		 	 | RESERVED
BID_IMG2	.EQU	BID_ROM0 + 3	; NETWORK BOOT				-+ ROM BANKS
BID_ROMD0	.EQU	BID_ROM0 + 4	; FIRST ROM DRIVE BANK			 |  ROM
BID_ROMDN	.EQU	BID_ROMN	; LAST ROM DRIVE BANK			 V  DRIVE
;
#IF (ROMSIZE == 0)
BID_BOOT	.SET	BID_RAM0	; SPECIAL CASE ROM-LESS SYSTEM
#ENDIF
;
#IF (BIOS == BIOS_WBW)
;
  #IF (!MDRAM)
BID_RAMD0	.SET	$FF		; RAM DRIVE DISABLED
BID_RAMDN	.SET	$FF		; RAM DRIVE DISABLED
  #ENDIF
;
  #IF (!MDROM)
BID_ROMD0	.SET	$FF		; ROM DRIVE DISABLED
BID_ROMDN	.SET	$FF		; ROM DRIVE DISABLED
  #ENDIF
;
#ENDIF
;
#IF FALSE
	.ECHO "BID_AUX: " \ .ECHO BID_AUX \ .ECHO "\n"
	.ECHO "BID_BIOS: " \ .ECHO BID_BIOS \ .ECHO "\n"
	.ECHO "BID_USR: " \ .ECHO BID_USR \ .ECHO "\n"
	.ECHO "BID_COM: " \ .ECHO BID_COM \ .ECHO "\n"

	.ECHO "BID_BOOT: " \ .ECHO BID_BOOT \ .ECHO "\n"
	.ECHO "BID_IMG0: " \ .ECHO BID_IMG0 \ .ECHO "\n"
	.ECHO "BID_IMG1: " \ .ECHO BID_IMG1 \ .ECHO "\n"
	.ECHO "BID_IMG2: " \ .ECHO BID_IMG2 \ .ECHO "\n"

	.ECHO "BID_ROMD0: " \ .ECHO BID_ROMD0 \ .ECHO "\n"
	.ECHO "BID_ROMDN: " \ .ECHO BID_ROMDN \ .ECHO "\n"
	.ECHO "BID_RAMD0: " \ .ECHO BID_RAMD0 \ .ECHO "\n"
	.ECHO "BID_RAMDN: " \ .ECHO BID_RAMDN \ .ECHO "\n"

	.ECHO "BID_ROM0: " \ .ECHO BID_ROM0 \ .ECHO "\n"
	.ECHO "BID_ROMN: " \ .ECHO BID_ROMN \ .ECHO "\n"
	.ECHO "BID_RAM0: " \ .ECHO BID_RAM0 \ .ECHO "\n"
	.ECHO "BID_RAMN: " \ .ECHO BID_RAMN \ .ECHO "\n"
#ENDIF
;
; MEMORY LAYOUT
;
SYS_SIZ		.EQU	$3000			; COMBINED SIZE OF SYSTEM AREA (OS + HBIOS PROXY)
HBBUF_SIZ	.EQU	1024			; INVARIANT HBIOS PHYSICAL DISK BUFFER, 1K
HBX_SIZ		.EQU	$200			; HBIOS PROXY SIZE (SUBJECT TO CHANGE)
CPM_SIZ		.EQU	SYS_SIZ - HBX_SIZ	; NET SIZE OF ALL OS COMPONENTS (EXCLUDING HBIOS PROXY)
CCP_SIZ		.EQU	$800			; INVARIANT SIZE OF CCP
BDOS_SIZ	.EQU	$E00			; INVARIANT SIZE OF BDOS
CBIOS_SIZ	.EQU	CPM_SIZ - CCP_SIZ - BDOS_SIZ	; CBIOS IS THE REMAINDER

MEMTOP		.EQU	$10000			; INVARIANT TOP OF Z80 ADDRESSABLE MEMORY
BNKTOP		.EQU	$8000			; BANK MEMORY BARRIER

HBX_IMG		.EQU	$200			; LOC OF HBX IMAGE IN HBIOS IMAGE BANK

HBBUF_END	.EQU	BNKTOP			; END OF PHYSICAL DISK BUFFER IN HBIOS
HBBUF_LOC	.EQU	HBBUF_END - HBBUF_SIZ	; START OF PHYSICAL DISK BUFFER
HBX_END		.EQU	MEMTOP			; END OF HBIOS PROXY
HBX_LOC		.EQU	HBX_END - HBX_SIZ	; START OF HBIOS PROXY
CPM_END		.EQU	HBX_LOC			; END OF CPM COMPONENTS (INCLUDING CBIOS)
CPM_LOC		.EQU	CPM_END - CPM_SIZ	; START OF CPM COMPONENTS
CBIOS_END	.EQU	HBX_LOC			; END OF CBIOS
CBIOS_LOC	.EQU	CBIOS_END - CBIOS_SIZ	; START OF CBIOS

CPM_ENT		.EQU	CBIOS_LOC		; CPM ENTRY POINT (IN CBIOS)

CPM_IMGSIZ	.EQU	$3000

; ROM BANK 1

LDR_LOC		.EQU	$0000
LDR_SIZ		.EQU	$1000
LDR_END		.EQU	LDR_LOC +LDR_SIZ
LDR_IMGLOC	.EQU	$0000

MON_LOC		.EQU	$EE00			; LOCATION OF MONITOR FOR RUNNING SYSTEM
MON_SIZ		.EQU	$1000			; SIZE OF MONITOR BINARY IMAGE
MON_END		.EQU	MON_LOC + MON_SIZ	; END OF MONITOR
MON_IMGLOC	.EQU	LDR_IMGLOC + LDR_SIZ

ZSYS_IMGLOC	.EQU	MON_IMGLOC + MON_SIZ

CPM_IMGLOC	.EQU	ZSYS_IMGLOC + CPM_IMGSIZ

; ROM BANK 2

FTH_LOC		.EQU	$0200			; CAMEL FORTH
FTH_SIZ		.EQU	$1700
FTH_END		.EQU	FTH_LOC + FTH_SIZ
FTH_IMGLOC	.EQU	$0000

BAS_LOC		.EQU	$0200			; NASCOM BASIC
BAS_SIZ		.EQU	$2000
BAS_END		.EQU	BAS_LOC + BAS_SIZ
BAS_IMGLOC	.EQU	FTH_IMGLOC + FTH_SIZ

TBC_LOC		.EQU	$0A00			; TASTYBASIC
TBC_SIZ		.EQU	$0A00
TBC_END		.EQU	TBC_LOC + TBC_SIZ
TBC_IMGLOC	.EQU	BAS_IMGLOC + BAS_SIZ

GAM_LOC		.EQU	$0200			; GAME 2048
GAM_SIZ		.EQU	$0900
GAM_END		.EQU	GAM_LOC + GAM_SIZ
GAM_IMGLOC	.EQU	TBC_IMGLOC + TBC_SIZ

EGG_LOC		.EQU	$F000			; EASTER EGG
EGG_SIZ		.EQU	$0200
EGG_END		.EQU	EGG_LOC + EGG_SIZ
EGG_IMGLOC	.EQU	GAM_IMGLOC + GAM_SIZ

NET_LOC		.EQU	$0100			; NETWORK BOOT
NET_SIZ		.EQU	$1000
NET_END		.EQU	NET_LOC + NET_SIZ
NET_IMGLOC	.EQU	EGG_IMGLOC + EGG_SIZ

UPD_LOC		.EQU	$0200			; ROM UPDATER
UPD_SIZ		.EQU	$0D00
UPD_END		.EQU	UPD_LOC + UPD_SIZ
UPD_IMGLOC	.EQU	NET_IMGLOC + NET_SIZ

USR_LOC		.EQU	$0200			; USER
USR_SIZ		.EQU	BNKTOP - UPD_IMGLOC - UPD_SIZ
USR_END		.EQU	USR_LOC + USR_SIZ
USR_IMGLOC	.EQU	UPD_IMGLOC + UPD_SIZ

MON_DSKY	.EQU	MON_LOC + (0 * 3)	; MONITOR ENTRY (DSKY)
MON_SERIAL	.EQU	MON_LOC + (1 * 3)	; MONITOR ENTRY (SERIAL PORT)
;
; INTERRUPT MODE 2 SLOT ASSIGNMENTS
;
#IF (((CPUFAM == CPU_Z180) | (CPUFAM == CPU_Z280)) & (INTMODE > 0))

; NOTE THAT Z180 PROCESSES ALL INTERNAL INTERRUPTS JUST LIKE
; IM2 EVEN WHEN CHIP IS IN IM1 MODE.  SO WE INCLUDE THE IM2
; INTERRUPT ASSIGNMENTS FOR IM1 BELOW.

; Z180-BASED SYSTEMS
INT_INT1	.EQU	0	; Z180 INT 1
INT_INT2	.EQU	1	; Z180 INT 2
INT_TIM0	.EQU	2	; Z180 TIMER 0
INT_TIM1	.EQU	3	; Z180 TIMER 1
INT_DMA0	.EQU	4	; Z180 DMA 0
INT_DMA1	.EQU	5	; Z180 DMA 1
INT_CSIO	.EQU	6	; Z180 CSIO
INT_SER0	.EQU	7	; Z180 SERIAL 0
INT_SER1	.EQU	8	; Z180 SERIAL 0
INT_PIO0A	.EQU	9	; ZILOG PIO 0, CHANNEL A
INT_PIO0B	.EQU	10	; ZILOG PIO 0, CHANNEL B
INT_PIO1A	.EQU	11	; ZILOG PIO 1, CHANNEL A
INT_PIO1B	.EQU	12	; ZILOG PIO 1, CHANNEL B
INT_SIO0	.EQU	13	; ZILOG SIO 0, CHANNEL A & B
INT_SIO1	.EQU	14	; ZILOG SIO 1, CHANNEL A & B

#ENDIF

#IF ((CPUFAM == CPU_Z80) & (INTMODE == 2))
  #IF (PLATFORM == PLT_MBC)

; MBC Z80
;INT_CTC0A	.EQU	0	; ZILOG CTC 0, CHANNEL A
;INT_CTC0B	.EQU	1	; ZILOG CTC 0, CHANNEL B
;INT_CTC0C	.EQU	2	; ZILOG CTC 0, CHANNEL C
;INT_CTC0D	.EQU	3	; ZILOG CTC 0, CHANNEL D
INT_UART0	.EQU	4	; UART 0
INT_UART1	.EQU	5	; UART 1
INT_SIO0	.EQU	8	; ZILOG SIO 0, CHANNEL A & B
INT_SIO1	.EQU	9	; ZILOG SIO 1, CHANNEL A & B
INT_CTC0A	.EQU	12	; ZILOG CTC 0, CHANNEL A
INT_CTC0B	.EQU	13	; ZILOG CTC 0, CHANNEL B
INT_CTC0C	.EQU	14	; ZILOG CTC 0, CHANNEL C
INT_CTC0D	.EQU	15	; ZILOG CTC 0, CHANNEL D
;INT_PIO0A	.EQU	9	; ZILOG PIO 0, CHANNEL A
;INT_PIO0B	.EQU	10	; ZILOG PIO 0, CHANNEL B
;INT_PIO1A	.EQU	11	; ZILOG PIO 1, CHANNEL A
;INT_PIO1B	.EQU	12	; ZILOG PIO 1, CHANNEL B

  #ELSE

; GENERIC Z80
INT_CTC0A	.EQU	0	; ZILOG CTC 0, CHANNEL A
INT_CTC0B	.EQU	1	; ZILOG CTC 0, CHANNEL B
INT_CTC0C	.EQU	2	; ZILOG CTC 0, CHANNEL C
INT_CTC0D	.EQU	3	; ZILOG CTC 0, CHANNEL D
INT_UART0	.EQU	4	; UART 0
INT_UART1	.EQU	5	; UART 1
INT_SIO0	.EQU	7	; ZILOG SIO 0, CHANNEL A & B
INT_SIO1	.EQU	8	; ZILOG SIO 1, CHANNEL A & B
INT_PIO0A	.EQU	9	; ZILOG PIO 0, CHANNEL A
INT_PIO0B	.EQU	10	; ZILOG PIO 0, CHANNEL B
INT_PIO1A	.EQU	11	; ZILOG PIO 1, CHANNEL A
INT_PIO1B	.EQU	12	; ZILOG PIO 1, CHANNEL B

    #ENDIF
#ENDIF

#DEFINE IVT(INTX) HB_IVT+(INTX * 4)+1
#DEFINE VEC(INTX) INTX*2

;
; SET DEFAULT CSIO SPEED (INTERNAL CLOCK, SLOW AS POSSIBLE)
; DIV 1280, 14KHZ @ 18MHZ CLK
;
#IF (BIOS == BIOS_WBW)
  #IF (CPUFAM == CPU_Z180)
Z180_CNTR_DEF	.EQU	$06	; DEFAULT VALUE FOR Z180 CSIO CONFIG
  #ENDIF
#ENDIF
;
; HELPER MACROS
;
#DEFINE	PRTC(C)	CALL PRTCH \ .DB C			; PRINT CHARACTER C TO CONSOLE - PRTC('X')
#DEFINE	PRTS(S)	CALL PRTSTRD \ .TEXT S			; PRINT STRING S TO CONSOLE - PRTD("HELLO")
#DEFINE	PRTX(X) CALL PRTSTRI \ .DW X			; PRINT STRING AT ADDRESS X TO CONSOLE - PRTI(STR_HELLO)
#DEFINE DEBUG(S) CALL PRTSTRD \ .TEXT S \ .TEXT "$"	; $$$$$$ PRINT STRING S TO CONSOLE - PRTD("HELLO") - NO TRAILING $ REQUIRED
;
#DEFINE	XIO_PRTC(C)	CALL XIO_PRTCH \ .DB C		; PRINT CHARACTER C TO CONSOLE - PRTC('X')
#DEFINE	XIO_PRTS(S)	CALL XIO_PRTSTRD \ .DB S	; PRINT STRING S TO CONSOLE - PRTD("HELLO")
#DEFINE	XIO_PRTX(X)	CALL XIO_PRTSTRI \ .DW X	; PRINT STRING AT ADDRESS X TO CONSOLE - PRTI(STR_HELLO)
