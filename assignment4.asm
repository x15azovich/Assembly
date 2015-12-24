;Anthony Zovich
;Assignment 4
;Dr Moore 305
;using direct and indirect operands; 

INCLUDE Irvine32.inc

.data
UArray WORD 1000h, 2000h, 3000h, 4000h
SArray SWORD -1, -2, -3, -4


.code 
main PROC
;Move values with direct-offset
	;UArray
movzx EAX, [UArray]
movzx EBX, [UArray+2]
movzx ECX, [UArray+4]
movzx EDX, [UArray+6]
call DumpRegs;
	;SArray
movsx EAX, [SArray]
movsx EBX, [SArray+2]
movsx ECX, [SArray+4]
movsx EDX, [SArray+6]
call DumpRegs;
;Move values with indirect-offset
	;UArray
mov ESI, OFFSET UArray
movzx EAX, WORD PTR [ESI]
add ESI,2
movzx EBX, WORD PTR [ESI]
add ESI,2
movzx ECX, WORD PTR [ESI]
add ESI,2
movzx EDX, WORD PTR [ESI]
call DumpRegs;

	;SArray
mov ESI, OFFSET SArray
movsx EAX, SWORD PTR [ESI]
add ESI,2
movsx EBX, SWORD PTR [ESI]
add ESI,2
movsx ECX, SWORD PTR [ESI]
add ESI,2
movsx EDX, SWORD PTR [ESI]
call DumpRegs;

;Move values with indexed operands
	;UArray
mov esi, 0
movzx EAX, UArray[ESI]
movzx EBX, UArray[ESI+2]
movzx ECX, UArray[ESI+4]
movzx EDX, UArray[ESI+6]
call DumpRegs
	;SArray
mov esi, 0
movsx EAX, SArray[ESI]
movsx EBX, SArray [ESI+2]
movsx ECX, SArray[ESI+4]
movsx EDX, SArray[ESI+6]
call DumpRegs



 	exit
	main ENDP
	
	END main