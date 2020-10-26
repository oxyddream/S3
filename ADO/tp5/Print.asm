			; ==============================
			; Initialisation des vecteurs
			; ==============================
			
			
			org		$0
			
vector_000	dc.l	$ffb500
vector_001	dc.l    Main
			
			; ==============================
			; Programme principal
			; ==============================
			
			org		$500
			
Main		lea		sTest,a0
			move.b	#24,d1
			move.b	#20,d2
			jsr     Print

			illegal
			
			
			; ==============================
			; Sous-programmes
			; ==============================
			
Print		movem.l	d0/d1/a0,-(a7)


\loop		move.b	(a0)+,d0
			beq		\quit
			
			jsr		PrintChar
			
			addq.b	#1,d1
			bra		\loop
			
\quit		movem.l	(a7)+,d0/d1/a0
			rts

PrintChar	incbin	"PrintChar.bin"

			; ==============================
			; Données
			; ==============================
			
			
sTest		dc.b	"Ich been ein kartofel salad",0
