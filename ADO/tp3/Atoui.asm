			; ==============================
			; Initialisation des vecteurs
			; ==============================
			
;			org 	$4
			
;vector_001	dc.l	Main

			; ==============================
			; Programme principal
			; ==============================
			
;			org		$500
			
;Main		movea.l	#String1,a0
;			jsr		Atoui
			
;			movea.l	#String2,a0
;			jsr		Atoui
			
;			illegal
			
			; ==============================
			; Sous-programmes
			; ==============================
			
Atoui		movem.l		d1/a0,-(a7)

			
