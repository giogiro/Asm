# Scrivere un programma Assembly che sommi i numeri 100, 33 e 68 e metta il risultato in
# una variabile chiamata “somma”. Stampare a monitor il risultato.

.data

somma: 
	.ascii "000\0"

len_somma:
	.long . - somma 

#acapo sarà il mio carattere a capo, lo stampo dopo aver stampato la somma
acapo:
	.ascii "\n\0"

len_acapo:
	.long . - acapo

.text
	.global _start

_start:	
	movl $100, %eax
	
	addl $100, %eax

	addl $55, %eax

	xorb %ah, %ah	

	leal somma, %esi	

#ora la mia somma è in %eax

_modifica1carattere:

	movl $10, %ebx

	divb %bl

	addb $48, %ah

	movb %ah, 2(%esi)

_modifica2carattere:

	xorb %ah, %ah

	divb %bl

	addb $48, %ah

	movb %ah, 1(%esi)

_modifica3caratere:

	xorb %ah, %ah

	divb %bl

	addb $48, %ah

	movb %ah, (%esi)

_stampa:

	movl $4, %eax	

	movl $1, %ebx

	movl %esi, %ecx
	
	movl len_somma, %edx

	int $0x80

_stampaacapo:

	leal acapo, %ecx

	movl $1, %edx

	int $0x80

_fine:

	movl $1, %eax      #Carica il codice della system call EXIT.

	xorl %ebx, %ebx    #Azzera EBX. Contiene il codice di ritorno della system call.

	int $0x80          #Esegue la system call in EAX tramite l’interrupt 0x80.
