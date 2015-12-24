;Anthony Zovich
;Assignment 5
;Dr Moore 305
;Fibonacci Numbers
INCLUDE Irvine32.inc

;create buffer to write to the file
; output file should be 188 bytes
BUFFER_SIZE=188


;create file
; int prev1=0, prev2=1;
                ;for(int i=0; i<47; i++) {
                 ;   int savePrev1 = prev1;
                  ;  prev1 = prev2;
                   ; prev2 = savePrev1 + prev2;
				   ;write prev1 to file/store the array
               ; }
               ; return prev1;

.data
;array
FibArray DWORD 47 DUP(?)
;Create file
filename BYTE "DisplayFileInHex.java", 0
;write file
fileHandle DWORD ?
buffer BYTE BUFFER_SIZE DUP(?)

;initialize temp variables
fib1 DWORD ?
fib2 DWORD ?
fib3 DWORD ?



.code 
main PROC
;initialize prev1, prev2 and the loop value


;create the file
mov edx, OFFSET filename
call CreateOutputFile
mov filehandle, eax

;array[0]=1
mov esi,0
mov FibArray[esi],1

;setup the initial array
;first two index's set

;fib1=array[i]
mov eax,FibArray[esi]
mov fib1,eax
;array[i+1]
add esi,4
;clear eax register
mov eax,0
;fib2=array[1]
mov FibArray[esi],1
mov eax,FibArray[esi]
mov fib2,eax

;move esi to array[2]
add esi,4
;call DumpRegs
mov ecx, 47



;calculate fib numbers and put in array
L1:
call DumpRegs
mov eax,fib1
mov ebx,fib2
add eax,ebx
mov fib3,eax
mov FibArray[esi],eax
mov fib1,ebx
mov fib2,eax
add esi,4
loop L1

;write fibarray to file
mov eax, fileHandle
mov edx,OFFSET FibArray
mov ecx,BUFFER_SIZE
call WriteToFile
;close the file
mov eax,filehandle
call CloseFile


 	exit
	main ENDP
	
	END main