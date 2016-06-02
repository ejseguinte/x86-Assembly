# Left.s
# Erwin Seguinte
#
# 1.Assemble : as -o left.o left.s
# 2.Link     : ld -o a.out left.s
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

	mov $4, %eax
	mov $1, %ebx
	mov $what, %ecx
	mov lwhat, %edx
	int $0x80

	mov $3, %eax
	mov $0, %ebx
	mov $excuse, %ecx
	mov $100, %edx
	int $0x80
	sub $1, %eax
	mov %eax, lexcuse

	mov $4, %eax
	mov $1, %ebx
	mov $and, %ecx
	mov land, %edx
	int $0x80

	mov $3, %eax
	mov $0, %ebx
	mov $sol, %ecx
	mov $100, %edx
	int $0x80
	#sub $1, %eax
	mov %eax, lsol
	
	mov $4, %eax
        mov $1, %ebx
        mov $message1, %ecx
        mov length1, %edx
        int $0x80  

	mov $4, %eax
        mov $1, %ebx
        mov $excuse, %ecx
        mov lexcuse, %edx
        int $0x80

	mov $4, %eax
        mov $1, %ebx
        mov $message2, %ecx
        mov length2, %edx
        int $0x80

	mov $4, %eax
        mov $1, %ebx
        mov $sol, %ecx
        mov lsol, %edx
        int $0x80
	

	mov $1,%eax
	int $0x80
