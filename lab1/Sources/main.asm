;********************************************************************
;*    Demonstration Program                                         *
;*                                                                  *
;* This program illustrates how to use the assembler.               *
;* It multiplies together two 8 bit numbers and leaves the result   *
;* in the ‘PRODUCT’ location.                                       *
;*             This is an unsigned multiply operation               *
;********************************************************************
; export symbols
            XDEF Entry, _Startup    ; export ‘Entry’ symbol
            ABSENTRY Entry          ; for absolute assembly: mark
                                    ; this as applicat. entry point
; Include derivative-specific definitions
            INCLUDE 'derivative.inc'
            
;********************************************************************
;* Code section *
;********************************************************************
             ORG $3000
MULTIPLICAND     FCB 05                 ; First Number
MULTIPLIER       FCB 05                 ; Second Number
PRODUCT          RMB 1                  ; Result of multiplication

;********************************************************************
;* The actual program starts here *
;********************************************************************
             ORG $4000
 Entry:
_Startup:
             LDAA MULTIPLICAND          ; Get the first number into A
             LDAB MULTIPLIER            ; Get the second number into B
             MUL                        ; Multiplies the numbers
             STD PRODUCT                ; and store the product
             SWI                        ; break to the monitor
             
;********************************************************************
;* Interrupt Vectors *
;********************************************************************
             ORG $FFFE
             FDB Entry ; Reset Vector