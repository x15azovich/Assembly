INCLUDE Irvine32.inc

.data

myMessage BYTE "GCD Assignment",0dh,0ah,0
firstMessage BYTE "GIve Me number 1", 0ah
secondMessage BYTE "Give me number 2", 0
first DWORD ?
second DWORD ?
.code

main PROC

mov ecx, offset myMessage
call Clrscr
;tell user to input values
	mov edx, OFFSET firstMessage
	call WriteString
	call crlf
	call ReadDec
	mov first, eax
	push eax ;pushes the dividend onto the stack
	
	;second values
	mov edx, OFFSET secondMessage
	call WriteString
	call crlf
	call ReadDec
	mov second, eax
	push eax ;pushes the divisor onto the stack
		
call abs
call GCD			;call the GCD procedure

call WriteDec		;have the program write the number returned by GCD
call crlf
exit

main ENDP


abs proc							;Finds the absolute value of the inputs
	mov eax, first
	mov ebx, second
	cmp eax, 0
    jge nextAbs
	neg eax
	jmp nextAbs

nextAbs:
	cmp ebx, 0
	jge absdone
	neg ebx

absdone:
ret	

abs endp




GCD PROC

mov edx, 0		;clear out edx
push ebp		;pushes pointer to the top of the stack
mov ebp, esp		;puts a second pointer to the same location on the stack
mov eax,[ebp+12] 	;Gets the dividend
mov ebx,[ebp+8]  	;Gets the divisor
div ebx			 ;divides eax by ebx, which in this case is 10 by 5. the remainder is stored into edx
cmp edx, 0		 ;compares edx to see if it equals 0
jnz L1			 ;if edx isn't 0, then the program will jump to l1
mov eax,ebx		 ;if edx is 0, the jump is skipped, and ebx is moved into eax, because                    ebx will be the gcd
jmp L2			 ;jumps to l2, which is the exit to the recursive loop



L1:				;this label is the recursive loop

push ebx		;puts the second number into the stack first
push edx		;puts the remainder as the second number in the stack
call GCD		;calls the gcd procedure again with the divisor as the new dividend and the remainder as the divisor

L2:

pop ebp			;removes eax from the stack and returns it
ret 8			;clean up the stack
GCD ENDP 

END MAIN

