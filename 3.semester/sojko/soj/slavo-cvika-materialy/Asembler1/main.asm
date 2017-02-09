TITLE MASM Vstup_vystup(main.asm)
INCLUDE Irvine32.inc
.data
Retaz DB "No nazdar!",0Dh,0Ah, 0
.code
main PROC

    call ReadChar; nacita znak, ulozi do al
	mov bl,al; vlozi kod z bl do al

	mov cl,0; znuluje cl

	mov edx,offset Retaz; ulo� do ebx adresu 1. znaku re�azca
	mov edi,0; prv� znak m� index 0


Vypis:
	mov al,[edx+edi]; ulo� do al znak na offsete edx+edi 
	cmp al,0; porovnaj al s nulou
	je Koniec; ak s� rovnak�, skok na n�vestie Koniec
	call WriteChar; vyp� znak, ktor�ho ASCII k�d je v al

	cmp al,bl; porovna al a bl
	je Rovnake; ak sa = skoci do rovnake

Navrat:

	inc al; dvihne al o 1... vzrastie hodnota pismena napr. z a na b
	call WriteChar; vypise obsah al

	mov al, 0Ah ; proces odriadkovania 
	call WriteChar ; proces odriadkovania 
	mov al, 0Dh ; proces odriadkovania 
	call WriteChar ; proces odriadkovania 

	inc edi; zv�� index o 1
	jmp Vypis


Rovnake:
	inc cl
	jmp Navrat

Koniec:
	
	mov al,cl
	add al,'0'
	call WriteChar

	exit
	main ENDP
	END main
