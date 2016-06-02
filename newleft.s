# Left.s
# Erwin Seguinte
# Now contains Sub-Routines for Print and Read 
#
# 1.Assemble : as -o newleft.o newleft.s
# 2.Link     : ld -o a.out newleft.s
# 3.Execute  : a.out

.data
message1:
	.ascii "Left Shark blames "
length1:
	.long 18
message2:
	.ascii " and will now "
length2:
	.long 14
what:
	.ascii "What is your excuse?\n"
lwhat:
	.long 21
and:
	.ascii "...and next time?\n"
land:
	.long 18
excuse:
	.space 100
lexcuse:
	.long 0
sol:
	.space 100
lsol:
	.long 0

.text
.global _start

_start:

	mov $what, %ecx
	mov lwhat, %edx
	call Print

	mov $excuse, %ecx
	mov $100, %edx
	call Read
	sub $1, %eax
	mov %eax, lexcuse

	mov $and, %ecx
	mov land, %edx
	call Print

	mov $sol, %ecx
	mov $100, %edx
	call Read
	mov %eax, lsol

        mov $message1, %ecx
        mov length1, %edx
        call Print  

        mov $excuse, %ecx
        mov lexcuse, %edx
        call Print

        mov $message2, %ecx
        mov length2, %edx
        call Print

        mov $sol, %ecx
        mov lsol, %edx
        call Print
	

	mov $1,%eax
	int $0x80
Print:
	push %eax
	push %ebx
	mov $4, %eax
	mov $1, %ebx
	int $0x80
	pop %eax
	pop %ebx
	ret
Read:
	push %ebx
	mov $3, %eax
	mov $1,%ebx
	int $0x80
	pop %ebx
	ret
