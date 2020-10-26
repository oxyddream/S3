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
			jsr		Error
			
			illegal

			; ==============================
			; Sous-programmes
			; ==============================

Error		movem.l	d1/a0,-(a7)

\loop		move.b	(a0)+,d1

			tst.l	d1
			beq		\false
			
			cmp.l	#'0',d1
			blo		\true
			
			cmp.l	#'9',d1
			bhi		\true
			
			bra		\loop
			
\true		ori.b	#%00000100,ccr
			movem.l	(a7)+,d1/a0
			rts
			
\false		andi.b	#%11111011,ccr
			movem.l	(a7)+,d1/a0
			rts


String1		dc.b	"65386745",0
