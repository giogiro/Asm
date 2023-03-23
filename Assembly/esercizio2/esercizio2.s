.data

pari: 
	.ascii "il numero è pari.\n"

long_pari:
	.long . - pari

dispari:
	.ascii "il numero è dispari.\n"

long_dispari:
	.long . - dispari

numero:
	.long 11

.text
	.global _start

_start:

	movl numero, %eax
	
	movl $2, %ebx

	div %bl

	cmpb $0, %ah
 	
	movl $4, %eax

	movl $1, %ebx

	je casopari

casodispari:

	leal dispari, %ecx

	movl long_dispari, %edx

	int $0x80

	jmp fine

casopari: 
	
	leal pari, %ecx

	movl long_pari, %edx

	int $0x80
fine:

	xorl %eax, %eax

	xorl %ebx, %ebx	
	
	movl $1, %eax

	movl $0, %ebx

	int $0x80
	
