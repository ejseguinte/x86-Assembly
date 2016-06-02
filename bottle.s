# bottle.s
# Erwin Seguinte
# Counting program
# 1.Assemble : as -o bottle.o bottle.s
# 2.Link     : ld -o a.out bottle.s
# 3.Execute  : a.out

.data
Bottle:
	.ascii " Bottle of beer on the wall.\n"
LB:
	.long 29
Bottles:
	.ascii " Bottles of beers on the wall.\n"
LBs:
	.long 31
BTake:
	.ascii " Bottle of beer on the wall; Take one down; "
LBT:
	.long 44
BsTake:
	.ascii " Bottles of beers on the wall; Take one down; "
LBsT:
	.long 46
Number:
	.long 0

.text
.include "ascii-int.asm"
.global _start

_start:
	mov $99,%eax
Top:
	cmp $1, %eax
	jl End

        cmp $1,%eax
	je First

	call PrintInt
	sub $1, %eax
	mov %eax,Number

	mov $4, %eax
	mov $1, %ebx
	mov $BsTake, %ecx
	mov LBsT, %edx
	int $0x80
	mov Number,%eax
	jmp Bottom
First:
	call PrintInt
	sub $1, %eax
	mov %eax,Number
	
	mov $4, %eax
        mov $1, %ebx
        mov $BTake, %ecx
        mov LBT, %edx
        int $0x80
	mov Number,%eax  
Bottom:
	cmp $1,%eax
	je Second
	
	call PrintInt        
	
	mov $4, %eax
        mov $1, %ebx
        mov $Bottles, %ecx
        mov LBs, %edx
        int $0x80
	mov Number,%eax
	jmp Top
Second:
	Call PrintInt

	mov $4, %eax
        mov $1, %ebx
        mov $Bottle, %ecx
        mov LB, %edx
        int $0x80
	mov Number,%eax
	jmp Top
	
End:
	mov $1,%eax
	int $0x80
