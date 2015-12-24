INCLUDE Irvine32.inc

String_length=20

.data
RandomArray BYTE String_length DUP(?),0
Letters DWORD 10
Strings DWORD 20
.code
main PROC
	mov ecx,Strings	;counter is at 20	

	;loop through the 20 random strings
L1:	
mov  esi, OFFSET RandomArray		
push ecx ; ensure L1's counter is not destroyed
;set counter for L2
mov  ecx, Letters

	;create the 10 random characters and 
	;store them in the random array
L2:	
mov eax, 26		
call RandomRange
add  eax, 'A'		
mov  [esi], al		
inc  esi		
	loop L2
;Write the string to the console
	mov edx,OFFSET RandomArray		
	call WriteString
	call Crlf

	pop  ecx	;restore L1's counter
	loop L1		

	exit
main ENDP
END main
