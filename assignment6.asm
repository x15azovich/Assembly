;Anthony Zovich
;Assignment 6
;Dr Moore 305
;Creating Random Strings


INCLUDE Irvine32.inc


String_length=20
.data
Letters BYTE 10
Strings BYTE 20
RandomArray BYTE String_length DUP(?)



.code 
main PROC
mov esi, offset RandomArray

;if(Strings!=0)
;go to l1
l0: 
cmp Strings,0
JNE l1
jmp done

;if(letters string !=10)
;go to l2
;else
;write the string to console
l1:
cmp Letters,0
JNE l2
dec Strings
mov edx, offset RandomArray
call WriteString
call crlf
mov esi, offset RandomArray
jmp l0



; create a random Character
;place it in the array
l2:
mov eax, 26
call RandomRange
add eax, 'A'
mov [esi], al
inc esi
dec Letters
jmp l1
done:




 	exit
	main ENDP
	
	END main