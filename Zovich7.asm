INCLUDE Irvine32.inc

String_length=20

.data
firstNum BYTE "Enter the first number (An Integer)",0
secondNum BYTE "Enter the second number (An Integer)",0
Answer BYTE "The GCD between your two numbers is ",0
first DWORD ?
second DWORD ?
Temp DWORD ?
.code
main PROC
	;tell user to input values
	mov edx, OFFSET firstNum
	call WriteString
	call crlf
	call ReadInt
	mov first, eax
	
	;second values
	mov edx, OFFSET secondNum
	call WriteString
	call crlf
	call ReadInt
	mov second,eax
	
	


	;pass values for GCD procedure
	mov eax, first
	mov ebx, second
	;Call the GCD Procedure
	call GCD



	exit
	main ENDP

;GCD Procedure

 GCD PROC
	;absolute value
	cmp eax,0
	jge abs2
	neg eax
	jmp abs2
	;absoulte value
	abs2:
	cmp ebx,0
	jge Next
	neg ebx
	jmp Next
	
	Next:
	mov edx,0
	jmp L1
	;code out of book translated to assembly
	L1:
	cmp ebx, 0
	jbe Done
	mov edx, 0
	div ebx
	mov temp, edx
	mov eax, ebx
	mov ebx, temp
	jmp L1
	
	; print it out
	Done: 
	mov edx, OFFSET Answer
	call WriteString
	call WriteInt
	call crlf
	ret
	
	GCD ENDP
	
END main
