# HelloWorld.s
# Erwin Seguinte
# Hello World Program
# 1.Assemble : as -o HelloWorld.o HelloWorld.s
# 2.Link     : ld -o a.out HelloWorld.s
# 3.Execute  : a.out

.data
message:
	.ascii "Hello World!\n"
length:
	.long 13
my:
	.ascii "My name is\n "
lmy:
	.long 11
name:
	.ascii "Erwin Seguinte\n"
lname:
	.long 15
quote:
	.ascii "There is no try, only do\n"
lquote:
	.long 25

.text
.global _start

_start:

	mov $4, %eax
	mov $1, %ebx
	mov $message, %ecx
	mov length, %edx
	int $0x80

	mov $4, %eax
	mov $1, %ebx
	mov $my, %ecx
	mov lmy, %edx
	int $0x80

	mov $4, %eax
	mov $1, %ebx
	mov $name, %ecx
	mov lname, %edx
	int $0x80

	mov $4, %eax
	mov $1, %ebx
	mov $quote, %ecx
	mov lquote, %edx
	int $0x80

	mov $1,%eax
	int $0x80
