TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data

.code

nacitaj PROC
	call ReadChar; nacita znak, ulozi do AL
	ret
nacitaj ENDP

zvysZnak PROC
	sub al,'0'; prevod z ASCI k�du znaku na znak
	add al,2
	ret
zvysZnak ENDP


main PROC
odriadkuj MACRO
	mov al, 0Dh
	call WriteChar
	mov al, 0Ah
	call WriteChar
ENDM

	mov ax,0
	call Clrscr; vyma�e obrazovku
Pokracuj:
	call nacitaj
	call WriteChar; vypise znak z AL

	cmp al,'k'; porovn� znak s k
	je Koniec; aj znak je k, tak sa program ukonc�
	call zvysZnak
	add al,'0'
	call WriteChar; vypise znak z AL
	odriadkuj

	jmp Pokracuj


Koniec:
	exit
main ENDP

END main