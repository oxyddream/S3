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
			jsr		NextOp
			
			
			illegal

			; ==============================
			; Sous-programmes
			; ==============================
			
NextOp		movem.l	d0/a0,-(a0)

\loop		tst	(a0)
			beq		\quit

			cmpi.b	#'+',(a0)
			beq		\quit
			
			cmpi	#'-',(a0)
			beq		\quit
			
			cmpi.b	#'*',(a0)
			beq		\quit
			
			cmpi	#'/',(a0)
			beq		\quit
			
			addq.l	#1,a0
			bra		NextOp
			
\quit		rts
