;
;==================================================================================================
;   ROMWBW 3.X CONFIGURATION DEFAULTS FOR SIMPLE Z80 RETRO
;==================================================================================================
;
; THIS FILE CONTAINS THE FULL SET OF DEFAULT CONFIGURATION SETTINGS FOR THE PLATFORM
; INDICATED ABOVE. THIS FILE SHOULD *NOT* NORMALLY BE CHANGED.	INSTEAD, YOU SHOULD
; OVERRIDE ANY SETTINGS YOU WANT USING A CONFIGURATION FILE IN THE CONFIG DIRECTORY
; UNDER THIS DIRECTORY.
;
; THIS FILE CAN BE CONSIDERED A REFERENCE THAT LISTS ALL POSSIBLE CONFIGURATION SETTINGS
; FOR THE PLATFORM.
;
#DEFINE PLATFORM_NAME "Z80Retro", " [", CONFIG, "]"
;
#INCLUDE "hbios.inc"
;
PLATFORM	.EQU	PLT_Z80RETRO	; PLT_[SBC|ZETA|ZETA2|N8|MK4|UNA|RCZ80|RCZ180|EZZ80|SCZ180|DYNO|RCZ280|MBC|RPH|Z80RETRO|S100|DUO|HEATH|MON]
CPUFAM		.EQU	CPU_Z80		; CPU FAMILY: CPU_[Z80|Z180|Z280]
BIOS		.EQU	BIOS_WBW	; HARDWARE BIOS: BIOS_[WBW|UNA]
BATCOND		.EQU	FALSE		; ENABLE LOW BATTERY WARNING MESSAGE
HBIOS_MUTEX	.EQU	FALSE		; ENABLE REENTRANT CALLS TO HBIOS (ADDS OVERHEAD)
USELZSA2	.EQU	TRUE		; ENABLE FONT COMPRESSION
TICKFREQ	.EQU	50		; DESIRED PERIODIC TIMER INTERRUPT FREQUENCY (HZ)
;
BOOT_TIMEOUT	.EQU	-1		; AUTO BOOT TIMEOUT IN SECONDS, -1 TO DISABLE, 0 FOR IMMEDIATE
BOOT_DELAY	.EQU	0		; FIXED BOOT DELAY IN SECONDS PRIOR TO CONSOLE OUTPUT
AUTOCON		.EQU	TRUE		; ENABLE CONSOLE TAKEOVER AT LOADER PROMPT
;
CPUSPDCAP	.EQU	SPD_FIXED	; CPU SPEED CHANGE CAPABILITY SPD_FIXED|SPD_HILO
CPUSPDDEF	.EQU	SPD_HIGH	; CPU SPEED DEFAULT SPD_UNSUP|SPD_HIGH|SPD_LOW
CPUOSC		.EQU	14745600	; CPU OSC FREQ IN MHZ
INTMODE		.EQU	2		; INTERRUPTS: 0=NONE, 1=MODE 1, 2=MODE 2, 3=MODE 3 (Z280)
DEFSERCFG	.EQU	SER_38400_8N1 | SER_RTS	; DEFAULT SERIAL LINE CONFIG (SEE STD.ASM)
;
RAMSIZE		.EQU	512		; SIZE OF RAM IN KB (MUST MATCH YOUR HARDWARE!!!)
ROMSIZE		.EQU	512		; SIZE OF ROM IN KB (MUST MATCH YOUR HARDWARE!!!)
APP_BNKS	.EQU	$FF		; BANKS TO RESERVE FOR APP USE ($FF FOR AUTO SIZING)
MEMMGR		.EQU	MM_Z2		; MEMORY MANAGER: MM_[SBC|Z2|N8|Z180|Z280|MBC|RPH|MON]
MPGSEL_0	.EQU	$60		; Z2 MEM MGR BANK 0 PAGE SELECT REG (WRITE ONLY)
MPGSEL_1	.EQU	$61		; Z2 MEM MGR BANK 1 PAGE SELECT REG (WRITE ONLY)
MPGSEL_2	.EQU	$62		; Z2 MEM MGR BANK 2 PAGE SELECT REG (WRITE ONLY)
MPGSEL_3	.EQU	$63		; Z2 MEM MGR BANK 3 PAGE SELECT REG (WRITE ONLY)
MPGENA		.EQU	$64		; Z2 MEM MGR PAGING ENABLE REGISTER (BIT 0, WRITE ONLY)
;
RTCIO		.EQU	$70		; RTC LATCH REGISTER ADR
;
KIOENABLE	.EQU	FALSE		; ENABLE ZILOG KIO SUPPORT
KIOBASE		.EQU	$80		; KIO BASE I/O ADDRESS
;
CTCENABLE	.EQU	TRUE		; ENABLE ZILOG CTC SUPPORT
CTCDEBUG	.EQU	FALSE		; ENABLE CTC DRIVER DEBUG OUTPUT
CTCBASE		.EQU	$40		; CTC BASE I/O ADDRESS
CTCTIMER	.EQU	FALSE		; ENABLE CTC PERIODIC TIMER (too fast for RomWBW right now)
CTCMODE		.EQU	CTCMODE_CTR	; CTC MODE: CTCMODE_[NONE|CTR|TIM16|TIM256]
CTCPRE		.EQU	256		; PRESCALE CONSTANT (1-256)
CTCPRECH	.EQU	0		; PRESCALE CHANNEL (0-3)
CTCTIMCH	.EQU	1		; TIMER CHANNEL (0-3)
CTCOSC		.EQU	7372800		; CTC CLOCK FREQUENCY
;
PCFENABLE	.EQU	FALSE		; ENABLE PCF8584 I2C CONTROLLER
PCFBASE		.EQU	$F0		; PCF8584 BASE I/O ADDRESS
;
EIPCENABLE	.EQU	FALSE		; EIPC: ENABLE Z80 EIPC (Z84C15) INITIALIZATION
;
SKZENABLE	.EQU	FALSE		; ENABLE SERGEY'S Z80-512K FEATURES
;
WDOGMODE	.EQU	WDOG_NONE	; WATCHDOG MODE: WDOG_[NONE|EZZ80|SKZ]
;
FPLED_ENABLE	.EQU	FALSE		; FP: ENABLES FRONT PANEL LEDS
FPLED_IO	.EQU	$00		; FP: PORT ADDRESS FOR FP LEDS
FPLED_INV	.EQU	FALSE		; FP: LED BITS ARE INVERTED
FPLED_DSKACT	.EQU	TRUE		; FP: ENABLES DISK I/O ACTIVITY ON FP LEDS
FPSW_ENABLE	.EQU	FALSE		; FP: ENABLES FRONT PANEL SWITCHES
FPSW_IO		.EQU	$00		; FP: PORT ADDRESS FOR FP SWITCHES
FPSW_INV	.EQU	FALSE		; FP: SWITCH BITS ARE INVERTED
;
DIAGLVL		.EQU	DL_CRITICAL	; ERROR LEVEL REPORTING
;
LEDENABLE	.EQU	FALSE		; ENABLES STATUS LED
LEDMODE		.EQU	LEDMODE_RTC	; LEDMODE_[STD|RTC|NABU]
LEDPORT		.EQU	$00		; STATUS LED PORT ADDRESS
LEDDISKIO	.EQU	TRUE		; ENABLES DISK I/O ACTIVITY ON STATUS LED
;
DSKYENABLE	.EQU	FALSE		; ENABLES DSKY FUNCTIONALITY
DSKYDSKACT	.EQU	TRUE		; ENABLES DISK ACTIVITY ON DSKY DISPLAY
ICMENABLE	.EQU	FALSE		; ENABLES ORIGINAL DSKY ICM DRIVER (7218)
ICMPPIBASE	.EQU	$60		; BASE I/O ADDRESS OF ICM PPI
PKDENABLE	.EQU	FALSE		; ENABLES DSKY NG PKD DRIVER (8259)
PKDPPIBASE	.EQU	$60		; BASE I/O ADDRESS OF PKD PPI
PKDOSC		.EQU	3000000		; OSCILLATOR FREQ FOR PKD (IN HZ)
H8PENABLE	.EQU	FALSE		; ENABLES HEATH H8 FRONT PANEL
;
BOOTCON		.EQU	0		; BOOT CONSOLE DEVICE
SECCON		.EQU	$FF		; SECONDARY CONSOLE DEVICE
CRTACT		.EQU	FALSE		; ACTIVATE CRT (VDU,CVDU,PROPIO,ETC) AT STARTUP
VDAEMU		.EQU	EMUTYP_ANSI	; VDA EMULATION: EMUTYP_[TTY|ANSI]
VDAEMU_SERKBD	.EQU	$FF		; VDA EMULATION: SERIAL KBD UNIT #, OR $FF FOR HW KBD
ANSITRACE	.EQU	1		; ANSI DRIVER TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
MKYENABLE	.EQU	FALSE		; MSX 5255 PPI KEYBOARD COMPATIBLE DRIVER (REQUIRES TMS VDA DRIVER)
;
DSRTCENABLE	.EQU	FALSE		; DSRTC: ENABLE DS-1302 CLOCK DRIVER (DSRTC.ASM)
DSRTCMODE	.EQU	DSRTCMODE_STD	; DSRTC: OPERATING MODE: DSRTC_[STD|MFPIC|K80W]
DSRTCCHG	.EQU	FALSE		; DSRTC: FORCE BATTERY CHARGE ON (USE WITH CAUTION!!!)
;
DS1501RTCENABLE	.EQU	FALSE		; DS1501RTC: ENABLE DS-1501 CLOCK DRIVER (DS1501RTC.ASM)
DS1501RTC_BASE	.EQU	$50		; DS1501RTC: I/O BASE ADDRESS
;
BQRTCENABLE	.EQU	FALSE		; BQRTC: ENABLE BQ4845 CLOCK DRIVER (BQRTC.ASM)
BQRTC_BASE	.EQU	$50		; BQRTC: I/O BASE ADDRESS
;
INTRTCENABLE	.EQU	FALSE		; ENABLE PERIODIC INTERRUPT CLOCK DRIVER (INTRTC.ASM)
;
RP5RTCENABLE	.EQU	FALSE		; RP5C01 RTC BASED CLOCK (RP5RTC.ASM)
;
HTIMENABLE	.EQU	FALSE		; ENABLE SIMH TIMER SUPPORT
SIMRTCENABLE	.EQU	FALSE		; ENABLE SIMH CLOCK DRIVER (SIMRTC.ASM)
;
DS7RTCENABLE	.EQU	FALSE		; DS7RTC: ENABLE DS-1307 I2C CLOCK DRIVER (DS7RTC.ASM)
DS7RTCMODE	.EQU	DS7RTCMODE_PCF	; DS7RTC: OPERATING MODE: DS7RTC_[PCF]
;
DUARTENABLE	.EQU	FALSE		; DUART: ENABLE 2681/2692 SERIAL DRIVER (DUART.ASM)
;
UARTENABLE	.EQU	FALSE		; UART: ENABLE 8250/16550-LIKE SERIAL DRIVER (UART.ASM)
UARTOSC		.EQU	1843200		; UART: OSC FREQUENCY IN MHZ
UARTINTS	.EQU	FALSE		; UART: INCLUDE INTERRUPT SUPPORT UNDER IM1/2/3
UARTCFG		.EQU	DEFSERCFG	; UART: LINE CONFIG FOR UART PORTS
UARTCASSPD	.EQU	SER_300_8N1	; UART: ECB CASSETTE UART DEFAULT SPEED
UARTSBC		.EQU	TRUE		; UART: AUTO-DETECT SBC/ZETA/DUO ONBOARD UART
UARTAUX		.EQU	FALSE		; UART: AUTO-DETECT AUX UART
UARTSBCFORCE	.EQU	FALSE		; UART: FORCE DETECTION OF SBC UART (FOR SIMH)
UARTCAS		.EQU	FALSE		; UART: AUTO-DETECT ECB CASSETTE UART
UARTMFP		.EQU	FALSE		; UART: AUTO-DETECT MF/PIC UART
UART4		.EQU	FALSE		; UART: AUTO-DETECT 4UART UART
UARTRC		.EQU	FALSE		; UART: AUTO-DETECT RC UART
UARTDUAL	.EQU	FALSE		; UART: AUTO-DETECT DUAL UART
UARTNABU	.EQU	FALSE		; UART: AUTO-DETECT NABU UART
;
ASCIENABLE	.EQU	FALSE		; ASCI: ENABLE Z180 ASCI SERIAL DRIVER (ASCI.ASM)
;
Z2UENABLE	.EQU	FALSE		; Z2U: ENABLE Z280 UART SERIAL DRIVER (Z2U.ASM)
;
ACIAENABLE	.EQU	FALSE		; ACIA: ENABLE MOTOROLA 6850 ACIA DRIVER (ACIA.ASM)
;
SIOENABLE	.EQU	TRUE		; SIO: ENABLE ZILOG SIO SERIAL DRIVER (SIO.ASM)
SIODEBUG	.EQU	FALSE		; SIO: ENABLE DEBUG OUTPUT
SIOBOOT		.EQU	0		; SIO: REBOOT ON RCV CHAR (0=DISABLED)
SIOCNT		.EQU	1		; SIO: NUMBER OF CHIPS TO DETECT (1-2), 2 CHANNELS PER CHIP
SIO0MODE	.EQU	SIOMODE_Z80R	; SIO 0: CHIP TYPE: SIOMODE_[STD|RC|SMB|ZP|Z80R]
SIO0BASE	.EQU	$80		; SIO 0: REGISTERS BASE ADR
SIO0ACLK	.EQU	CPUOSC/2	; SIO 0A: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO0ACFG	.EQU	DEFSERCFG	; SIO 0A: SERIAL LINE CONFIG
SIO0ACTCC	.EQU	-1		; SIO 0A: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
SIO0BCLK	.EQU	CPUOSC/2	; SIO 0B: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO0BCFG	.EQU	DEFSERCFG	; SIO 0B: SERIAL LINE CONFIG
SIO0BCTCC	.EQU	-1		; SIO 0B: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
SIO1MODE	.EQU	SIOMODE_Z80R	; SIO 1: CHIP TYPE: SIOMODE_[STD|RC|SMB|ZP|Z80R]
SIO1BASE	.EQU	$84		; SIO 1: REGISTERS BASE ADR
SIO1ACLK	.EQU	CPUOSC/2	; SIO 1A: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO1ACFG	.EQU	DEFSERCFG	; SIO 1A: SERIAL LINE CONFIG
SIO1ACTCC	.EQU	-1		; SIO 1A: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
SIO1BCLK	.EQU	CPUOSC/2	; SIO 1B: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO1BCFG	.EQU	DEFSERCFG	; SIO 1B: SERIAL LINE CONFIG
SIO1BCTCC	.EQU	-1		; SIO 1B: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
;
XIOCFG		.EQU	DEFSERCFG	; XIO: SERIAL LINE CONFIG
;
VDUENABLE	.EQU	FALSE		; VDU: ENABLE VDU VIDEO/KBD DRIVER (VDU.ASM)
CVDUENABLE	.EQU	FALSE		; CVDU: ENABLE CVDU VIDEO/KBD DRIVER (CVDU.ASM)
GDCENABLE	.EQU	FALSE		; GDC: ENABLE 7220 GDC VIDEO/KBD DRIVER (GDC.ASM)
TMSENABLE	.EQU	FALSE		; TMS: ENABLE TMS9918 VIDEO/KBD DRIVER (TMS.ASM)
TMSMODE		.EQU	TMSMODE_NONE	; TMS: DRIVER MODE: TMSMODE_[SCG|N8|MBC|MSX|MSX9958|MSXKBD|COLECO|DUO|NABU40|NABU80]
TMSTIMENABLE	.EQU	FALSE		; TMS: ENABLE TIMER INTERRUPTS (REQUIRES IM1)
VGAENABLE	.EQU	FALSE		; VGA: ENABLE VGA VIDEO/KBD DRIVER (VGA.ASM)
VRCENABLE	.EQU	FALSE		; VRC: ENABLE VGARC VIDEO/KBD DRIVER (VRC.ASM)
SCONENABLE	.EQU	FALSE		; SCON: ENABLE S100 CONSOLE DRIVER (SCON.ASM)
EFENABLE	.EQU	FALSE		; EF: ENABLE EF9345 VIDEO DRIVER (EF.ASM)
;
MDENABLE	.EQU	TRUE		; MD: ENABLE MEMORY (ROM/RAM) DISK DRIVER (MD.ASM)
MDROM		.EQU	TRUE		; MD: ENABLE ROM DISK
MDRAM		.EQU	TRUE		; MD: ENABLE RAM DISK
MDTRACE		.EQU	1		; MD: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
MDFFENABLE	.EQU	FALSE		; MD: ENABLE FLASH FILE SYSTEM
;
FDENABLE	.EQU	FALSE		; FD: ENABLE FLOPPY DISK DRIVER (FD.ASM)
FDMODE		.EQU	FDMODE_ZETA2	; FD: DRIVER MODE: FDMODE_[DIO|ZETA|ZETA2|DIDE|N8|DIO3|RCSMC|RCWDC|DYNO|EPFDC|MBC]
FDCNT		.EQU	1		; FD: NUMBER OF FLOPPY DRIVES ON THE INTERFACE (1-2)
FDTRACE		.EQU	1		; FD: TRACE LEVEL (0=NO,1=FATAL,2=ERRORS,3=ALL)
FDMAUTO		.EQU	TRUE		; FD: AUTO SELECT DEFAULT/ALTERNATE MEDIA FORMATS
FD0TYPE		.EQU	FDT_3HD		; FD 0: DRIVE TYPE: FDT_[3DD|3HD|5DD|5HD|8]
FD1TYPE		.EQU	FDT_3HD		; FD 1: DRIVE TYPE: FDT_[3DD|3HD|5DD|5HD|8]
;
RFENABLE	.EQU	FALSE		; RF: ENABLE RAM FLOPPY DRIVER
;
IDEENABLE	.EQU	FALSE		; IDE: ENABLE IDE DISK DRIVER (IDE.ASM)
;
PPIDEENABLE	.EQU	FALSE		; PPIDE: ENABLE PARALLEL PORT IDE DISK DRIVER (PPIDE.ASM)
PPIDETRACE	.EQU	1		; PPIDE: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPIDECNT	.EQU	1		; PPIDE: NUMBER OF PPI CHIPS TO DETECT (1-3), 2 DRIVES PER CHIP
PPIDE0BASE	.EQU	$60		; PPIDE 0: PPI REGISTERS BASE ADR
PPIDE0A8BIT	.EQU	FALSE		; PPIDE 0A (MASTER): 8 BIT XFER
PPIDE0B8BIT	.EQU	FALSE		; PPIDE 0B (SLAVE): 8 BIT XFER
;
SDENABLE	.EQU	TRUE		; SD: ENABLE SD CARD DISK DRIVER (SD.ASM)
SDMODE		.EQU	SDMODE_Z80R	; SD: DRIVER MODE: SDMODE_[JUHA|N8|CSIO|PPI|UART|DSD|MK4|SC|MT|PIO|Z80R|USR]
SDCNT		.EQU	1		; SD: NUMBER OF SD CARD DEVICES (1-2), FOR DSD/SC/MT ONLY
SDTRACE		.EQU	1		; SD: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
SDCSIOFAST	.EQU	FALSE		; SD: ENABLE TABLE-DRIVEN BIT INVERTER IN CSIO MODE
SDMTSWAP	.EQU	FALSE		; SD: SWAP THE LOGICAL ORDER OF THE SPI PORTS OF THE MT011
;
CHENABLE	.EQU	FALSE		; CH: ENABLE CH375/376 USB SUPPORT
;
PRPENABLE	.EQU	FALSE		; PRP: ENABLE ECB PROPELLER IO BOARD DRIVER (PRP.ASM)
;
PPPENABLE	.EQU	FALSE		; PPP: ENABLE ZETA PARALLEL PORT PROPELLER BOARD DRIVER (PPP.ASM)
PPPBASE		.EQU	$60		; PPP: PPI REGISTERS BASE ADDRESS
PPPSDENABLE	.EQU	TRUE		; PPP: ENABLE PPP DRIVER SD CARD SUPPORT
PPPSDTRACE	.EQU	1		; PPP: SD CARD TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPPCONENABLE	.EQU	TRUE		; PPP: ENABLE PPP DRIVER VIDEO/KBD SUPPORT
;
ESPENABLE	.EQU	FALSE		; ESP: ENABLE ESP32 IO BOARD DRIVER (ESP.ASM)
;
HDSKENABLE	.EQU	FALSE		; HDSK: ENABLE SIMH HDSK DISK DRIVER (HDSK.ASM)
;
PIOENABLE	.EQU	FALSE		; PIO: ENABLE ZILOG PIO DRIVER (PIO.ASM)
;
LPTENABLE	.EQU	FALSE		; LPT: ENABLE CENTRONICS PRINTER DRIVER (LPT.ASM)
;
PPAENABLE	.EQU	FALSE		; PPA: ENABLE PPA DISK DRIVER (PPA.ASM)
;
IMMENABLE	.EQU	FALSE		; IMM: ENABLE IMM DISK DRIVER (IMM.ASM)
;
SYQENABLE	.EQU	FALSE		; SYQ: ENABLE IMM DISK DRIVER (SYQ.ASM)
;
PIO_4P		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR ECB 4P BOARD
PIO_ZP		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR ECB ZILOG PERIPHERALS BOARD (PIO.ASM)
PIO_SBC		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR 8255 CHIP
PIOSBASE	.EQU	$60		; PIO: PIO REGISTERS BASE ADR FOR SBC PPI
;
UFENABLE	.EQU	FALSE		; UF: ENABLE ECB USB FIFO DRIVER (UF.ASM)
;
SN76489ENABLE	.EQU	FALSE		; SN76489 SOUND DRIVER
AY38910ENABLE	.EQU	FALSE		; AY: AY-3-8910 / YM2149 SOUND DRIVER
SPKENABLE	.EQU	FALSE		; SPK: ENABLE RTC LATCH IOBIT SOUND DRIVER (SPK.ASM)
;
DMAENABLE	.EQU	FALSE		; DMA: ENABLE DMA DRIVER (DMA.ASM)
DMABASE		.EQU	$E0		; DMA: DMA BASE ADDRESS
DMAMODE		.EQU	DMAMODE_NONE	; DMA: DMA MODE (NONE|ECB|Z180|Z280|RC|MBC|DUO)
;
YM2612ENABLE	.EQU	FALSE		; YM2612: ENABLE YM2612 DRIVER
VGMBASE		.EQU	$C0		; YM2612: BASE ADDRESS FOR VGM BOARD (YM2612/SN76489s/CTC)
