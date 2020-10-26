			; ==============================
			; Initialisation des vecteurs
			; ==============================
			
			org		$4
			
vector_001	dc.l	Main

			; ==============================
			; Programme principal
			; ==============================
			
			org		$500
			
Main		movea.l	#String1,a0
			jsr		RmSpace
			
			illegal
			
			; ==============================
			; Sous-programmes
			; ==============================


RmSpace		movem.l	a0/d0/a1,-(a7)			; Sauvegarde le registre A0 dans la pile.
			movea.l	a0,a1

			clr.l	d0
			
\loop		move.b	(a0)+,d0			

			
			cmpi.b	#' ',d0
			beq		\loop					; Si on a un espace, on incremente A0 sans rien faire dans A1
			
			move.b	d0,(a1)+				; On copie l'element de A0 dans A1
			bne		\loop
			
\quit		movem.l	(a7)+,a0/d0/a1			; Restaure la valeur du registre A0.
			rts
			
			
String1		dc.b	" 5 +  12 ",0
