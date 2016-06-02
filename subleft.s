# Left.s
# Erwin Seguinte
# Now contains Sub-Routines for PrintString and ReadString 
# Uses Strings
# 1.Assemble : as -o subleft.o subleft.s
# 2.Link     : ld -o a.out subleft.s
# 3.Execute  : a.out

.data
message1:
	.ascii "Left Shark blames \0"
message2:
	.ascii " and will now \0"
what:
	.ascii "What is your excuse?\n\0"
and:
	.ascii "...and next time?\n\0"
newLine:
	.ascii "\n\0"
excuse:
	.space 100
sol:
	.space 100

.text
.global _start

_start:

	mov $what, %ecx
	call Print

	mov $excuse, %ecx
	mov $100, %edx
	call Read

	mov $and, %ecx
	call Print

	mov $sol, %ecx
	mov $100, %edx
	call Read

        mov $message1, %ecx
        call Print  

        mov $excuse, %ecx
        call Print

        mov $message2, %ecx
        call Print

        mov $sol, %ecx
        call Print

	mov $newLine,%ecx
	call Print	
End:
	mov $1,%eax
	int $0x80

Print:
	push %eax
	push %ebx
	push %edx
	mov $0,%edx
Count:
	cmpb $0,(%ecx,%edx)
	je PrintString
	add $1,%edx
	jmp Count
PrintString:
	mov $4, %eax
	mov $1, %ebx
	int $0x80
	pop %edx
	pop %ebx
	pop %eax
	ret

Read:
	push %ebx
	push %eax
	mov $3, %eax
	mov $1,%ebx
	int $0x80
	sub $1,%eax
	movb $0,(%ecx,%eax)
	pop %eax
	pop %ebx
	ret
