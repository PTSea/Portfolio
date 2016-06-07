TITLE Programming Assignment 6A   (ProgAssig6A.asm)

; Author: Philip Tan
; Course / Project ID: CS271 Assignment 6A                 
; Date: 11/16/14
; Description: This program is finds the sum and average of 10 numbers entered by a user. It uses macros
; and extensively uses the stack!
; CITATIONS: Kristen Dhuse helped me get started with the macros and the WriteVal procedure
; For the ReadVal procedure I followed the pseudo code from the lectures
; QUICK NOTE: So glad to be done with this program!

; Implementation notes:
; This program is implemented using procedures and macro and is modularized.
; Parameters are passed reference, macros are used.

INCLUDE Irvine32.inc

;Kristen Dhuse helped me on the macros!
DisplayString MACRO stringAddress   ;macro to display the string
    push    edx
    mov     edx, stringAddress
    call    WriteString
    pop     edx
ENDM

GetString MACRO promptAddress, userStringAddress, userStringSize    ;macro to get the user string
    DisplayString   promptAddress
    push    ecx
    push    edx
    mov     edx, userStringAddress
    mov     ecx, userStringSize
    call    ReadString
    pop     edx
    pop     ecx
ENDM

; Constant Definitions
USER_STRING_SIZE = 12	
maxVals = 10

.data
userName	BYTE	33 DUP(0)	;string to be entered by user
intro_1		BYTE	"Hi, my name is Philip. Welcome to Programming Assignment 6A!  ",0
instruct1	BYTE	"Today we're going to find the sum and average of ten numbers. Please enter",0
instruct2	BYTE	"ten values when prompted. The values must be positive. ",0
valPrompt	BYTE	"Enter a value: ",0
warning1	BYTE	"Invalid input.",0
sumMsg      BYTE    "This is the sum: ",0
avgMsg      BYTE    "This is the average: ",0
userString	BYTE    USER_STRING_SIZE DUP(?)				;This is a variable to store the user string
userStrSize DWORD   (USER_STRING_SIZE - 1)              ;the size of userString to be passed to getString macro
goodNumber  DWORD   ?
valArray	DWORD	maxVals DUP(?)

goodBye		BYTE	"Thanks for using this program! Have a good day! ",0
comma		BYTE	", ",0

.code
;----------------------------------------------------------------------------------
main PROC
; Main procedure section where all other procedures are called
;----------------------------------------------------------------------------------
;Here we display the introductory messages
	DisplayString OFFSET intro_1
	call	CrLf
	DisplayString OFFSET instruct1
	call	CrLf
	DisplayString OFFSET instruct2
    call    CrLf
	call	CrLf

;Here we call the readval procedure
    ;push    OFFSET goodNumber                          ;pass number variable by reference 20
	;push	OFFSET valPrompt							;pass string entering prompt by reference 16 
	;push	OFFSET userString							;pass userString by reference 12		
	;push	userStrSize									;passed in by reference 8
	;call	ReadVal

;Here we call the arrayFill procedure
    push    OFFSET warning1	                            ;"Invalid input.",0     28
	push	OFFSET valArray								;pass the array by reference 24
    push    OFFSET goodNumber                           ;pass number variable by reference 20
	push	OFFSET valPrompt							;pass string entering prompt by reference 16 
	push	OFFSET userString							;pass userString by reference 12		
	push	userStrSize									;passed in by reference 8
	call	arrayFill
	call	CrLf

;Here we call the ShowArray procedure
    push    OFFSET comma                                ;pass comma string in by reference 16
    push    OFFSET valArray                             ;pass array in by reference 12
    push    OFFSET userString                           ;pass userString by reference 8
    call    ShowArray
    call    CrLf

;Here we call the summing and averaging procedure
	call	CrLf
    push    OFFSET sumMsg                               ;"This is the sum: ",0 20
    push    OFFSET avgMsg                               ;"This is the average: ",0 16
    push    OFFSET valArray                             ;pass array in by reference 12
    push    OFFSET userString                           ;pass userString by reference 8
    call    SumAv

;Here we say goodbye
    call    CrLf
	DisplayString OFFSET goodBye                        ;Goodbye!
	call	CrLf
    
    exit    ; exit to operating system

main ENDP

;----------------------------------------------------------------------------------
ReadVal PROC
; Read in user string and convert to numerical value
; Receives: getstring macro, 
; Returns: numerical values
; Preconditions: values entered in by user are numbers
; Registers changed: ebp, ebx, esi, ecx,
;----------------------------------------------------------------------------------
;Here we ask the user to begin entering values:
	;Set up stack
	push	ebp
	mov		ebp, esp
	
	;Save registers
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi

getStringHere:
	GetString [ebp+16], [ebp+12], [ebp+8] ;GetString promptAddress, userStringAddress, userStringSize   ;call the GetString macro
	
    mov     ebx, 0                  ;initialize to zero
    INVOKE Str_length, [ebp+12]		;get the length of the user entered string (built in method from irvine)
    mov     ecx, eax				;move the length value to the ecx loop counter           
    mov     esi, [ebp+12]           ;move the userString into esi
    cld                             ;clear Direction flag in the forward direction
    cmp     ecx, 0                  ;check to make sure something was entered
    je      outofrange

;checkString conversion to numerical value follows pseudo code formula from lecture 26
checkString:
    mov     eax, 0                  ;clear EAX and ECX for use
    push    ecx
    mov     ecx, 0
    lodsb                           ;goes to next character in the string, moves character into AL
    cmp     al, 48                  ;compare to 48, the lowest ascii value for a number    
    jb      outofrange              ;jump if below to error message and redo input
    cmp     al, 57                  ;compare to 57, the highest ascii value for a number
    ja      outofrange              ;jump if above to error message and redo input
    sub     al, 48                  ;convert to digit if in valid numerical range
    mov     cl, al                  ;move value in AL into CL so EAX can be used in arithmetic below
    mov     eax, 10                 ;
    mul     ebx
    jc      outofrange              ;check that carry flag is set (is bigger than 32bit register), go to invalid if set
    add     eax, ecx
    jc      outofrange      
    mov     ebx, eax                ;update value of ebx
    pop     ecx
    loop    checkString             ;loop until ecx is 0
    jmp     endRead                 ;if all is well skip the out of range messages
    
outofrange:
    pop     ecx
    DisplayString    [ebp+24]       ;display error message
    jmp     getStringHere
    
endRead:
    mov     eax, [ebp+20]
    mov     [eax], ebx              ;store into goodNumber variable
    pop	    esi                     ;pop everything else off the stack
    pop	    edx
    pop	    ecx
    pop	    ebx
    pop	    eax
	pop		ebp
	ret		20

ReadVal ENDP

;----------------------------------------------------------------------------------
arrayFill PROC
; Fills an array with the values converted by ReadVal
; Receives: empty array, userString, userStrSize, ReadVal procedure
; Returns: filled array
; Preconditions: readval gets valid numbers
; Registers changed: ecx, edi, ebp, eax, 
;----------------------------------------------------------------------------------	
	push	ebp
	mov		ebp, esp

	;Save registers
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi
	push 	edi

    mov     ecx, 10
	mov		edi, [ebp+24]			;move array to EDI

fillerLp:
    push    [ebp+28]                ;for readVal this is ebp+24, invalid entry
    push    [ebp+20]                ;push goodNumber onto stack for ReadVal      
	push	[ebp+16]				;push valPrompt onto stack for ReadVal		
	push	[ebp+12]				;push userString onto stack for ReadVal			
	push	[ebp+8]					;push userStrSize onto stack for ReadVal			
	call	ReadVal					;call the ReadVal procedure so we can get values
	mov		eax, [ebp+20]			;move goodNumber into a register so it can be stored
    mov     eax, [eax]              ;dereference goodNumber
	mov		[edi], eax				;store valid integer into the array
	add		edi, 4                  ;move to next segment of array
	loop	fillerLp
	
	pop		edi						;pop everything else off the stack
	pop	    esi                     
    pop	    edx
    pop	    ecx
    pop	    ebx
    pop	    eax
	pop		ebp
	ret		24

arrayFill ENDP

;----------------------------------------------------------------------------------
WriteVal PROC
; Convert the numeric value to string of digits and display it
; Receives: valArray
; Returns: Each value in the valid array
; Preconditions: array is good
; Registers changed: ecx, eax, edi, ebx, edx
;----------------------------------------------------------------------------------
;Here we ask the user to begin entering values:
	;Set up stack
	push	ebp
	mov		ebp, esp
	
	;Save registers
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi
    push    edi

	mov		ecx, 0				;clear ecx to use it as a counter
	mov		eax, [ebp+12]		;move the goodNumber value to eax
    cld
	mov		edi, [ebp+8]		;mov userString to edi so stosb can use it

;Kristen Dhuse helped me on this section of the code as well,
;I followed her conversion pseudo code and she taught me how to reverse the string and store it
converter:
	inc		ecx					;increment counter
	mov		ebx, 10             ;mov 10 into ebx for division
    mov     edx, 0				;clear edx	
	div		ebx					;divide by 10, use remainder
    add     edx, 48             ;convert
    mov     ebx, eax            ;store value in ebx temporarily
    mov     eax, edx            ;mov remainder
	stosb                       ;store remainder value in
    mov     eax, ebx			;restore eax value
	cmp		eax, 0				;if total is 0
	je		itsequal			;go to itsequal label
	jmp	    converter			;otherwise continue loop
	
itsequal:
	stosb       				;store 0 in string (null at end of the string)
	
	push 	ecx                 ;save ecx for later use
    cld					        ;set direction flag in forward direction
	mov		esi, [ebp+8]        ;move userstring into esi so lodsb can use it
	
reverser:
	mov		eax, 0              ;clear eax for lodsb
	lodsb                       
	push	eax                 ;push eax onto stack
	loop	reverser            ;loop to repeat reversing of string
	
	mov		ecx, [ebp-28]       ;reset ecx to the length of the string
	mov		edi, [ebp+8]        ;set edi back to beginning of the string
	
forwardString:
	pop		eax                 ;grab values from stack
	stosb                       ;store them back in the string
	loop	forwardString       ;loop through to finish the store
	pop ecx
    
	DisplayString [ebp+8]		;DisplayString stringAddress
	
endRead:
    pop     edi                 ;pop everything else off the stack
    pop	    esi                     
    pop	    edx
    pop	    ecx
    pop	    ebx
    pop	    eax
	pop		ebp
	ret		8

WriteVal ENDP

;----------------------------------------------------------------------------------
ShowArray PROC
;Display the values in the array
; Receives: valArray, userString
; Returns: the array of values
; Preconditions: 
; Registers changed: ebp, edi, 
;----------------------------------------------------------------------------------
;Here we ask the user to begin entering values:
	;Set up stack
	push	ebp
	mov		ebp, esp

    ;Save registers
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi
    push    edi
   
    mov		ecx, 10                 ;set ecx to 10
	mov		edi, [ebp+12]			;move array to EDI

displayLp:	
    push    [edi]                   ;use value in the array	
    push    [ebp+8]                 ;use the userString in WriteVal		
	call	WriteVal				;call the ReadVal procedure so we can get values
    DisplayString [ebp+16]          ;display a comma after each number
	add		edi, 4                  ;move to next segment of array
	loop	displayLp               ;loop through the rest of the array

endRead:
    pop     edi                     ;pop everything else off the stack
    pop	    esi                     
    pop	    edx
    pop	    ecx
    pop	    ebx
    pop	    eax
	pop		ebp
	ret		12

ShowArray ENDP

;----------------------------------------------------------------------------------
SumAv PROC
;Display the sums and averages of the values in the array
; Receives: valArray, 
; Returns: shows the sum and the average of the values in the array
; Preconditions: array of valid numbers is complete
; Registers changed: ecx, edi, ebx, eax, ebp, 
;----------------------------------------------------------------------------------
;Here we ask the user to begin entering values:
	;Set up stack
	push	ebp
	mov		ebp, esp

    ;Save registers
	push	eax
	push	ebx
	push	ecx
	push	edx
	push	esi
    push    edi
   
    mov		ecx, 10                 ;set ecx to 10
	mov		edi, [ebp+12]			;move array to EDI
    mov     eax, 0                  ;clear eax register to save the running sum
    	
sumLp:
    mov     ebx, [edi]	            ;move value in edi to eax
    add     eax, ebx	            ;add the value to the running sum
	add		edi, 4                  ;move to next segment of array
	loop	sumLp                   ;loop until all values have been added

    DisplayString [ebp+20]          ;"This is the sum: ",0 20
    call    WriteDec                ;display the sum
    call    CrLf
    DisplayString[ebp+16]           ;"This is the average: ",0 16
    mov     edx, 0                  ;set edx too zero before dividing
    mov     ebx, 10                 ;calculate the average
    div     ebx                     ;divide
    call    WriteDec                ;display the average
    call    CrLf

endRead:
    pop     edi                     ;pop everything else off the stack
    pop	    esi                     
    pop	    edx
    pop	    ecx
    pop	    ebx
    pop	    eax
	pop		ebp
	ret		16

SumAv ENDP

;----------------------------------------------------------------------------------

; (insert additional procedures here)

END main
