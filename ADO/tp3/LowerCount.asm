			; ==============================
			; Initialisation des vecteurs
			; ==============================
			
			org 	$4
			
vector_001	dc.l	Main

			; ==============================
			; Programme principal
			; ==============================
			
			org		$500
			
Main		movea.l	#String1,a0
			jsr		LowerCount
			
			movea.l	#String2,a0
			jsr		LowerCount
			
			illegal
			
			; ==============================
			; Sous-programmes
			; ==============================
			
LowerCount	movem.l	d1/a0,-(a7)

			clr.l	d0
			
\loop		move.b	(a0)+,d1

			tst.l	d1
			beq		\quit
			
			cmp.l	#'a',d1
			blo		\loop
			
			cmp.l	#'z',d1
			bhi		\loop
			
			addq	#1,d0
			bra		\loop
			
\quit		movem.l	(a7)+,d1/a0
			rts
			
			; ==============================
			; Données
			; ==============================
			
String1		dc.b	"Cette chaine comporte 28 minuscules.",0
String2     dc.b	"Celle-ci en comporte 16.",0
