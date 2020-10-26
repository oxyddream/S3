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
			jsr		StrLen
			jsr		CharError
			jsr 	EmptyString
			jsr 	Convert
			
			illegal

			; ==============================
			; Sous-programmes
			; ==============================
			
			
			
StrLen		movem.l	a0/d0/d1,-(a7)			; Sauvegarde le registre A0 dans la pile.

			clr.l	d0
			
\loop		tst.b	(a0)+
			beq		\quit
			
			addq.l	#1,d0
			bra		\loop
			
\quit		cmp.l	#5,d0

			bhi		true
			blo		false
			beq		MaxError
			

MaxError	clr.l	d1

			move.b	(a0),d1
			
			cmp.l	#'3',d1
			bhi		true
			
			move.b	(a0)+,d1
			
			cmp.l	#'2',d1
			bhi		true
			
			move.b	(a0)+,d1
			
			cmp.l	#'7',d1
			bhi		true
			
			move.b	(a0)+,d1
			
			cmp.l	#'6',d1
			bhi		true
			
			move.b	(a0)+,d1
			
			cmp.l	#'7',d1
			bhi		true
			
false		andi.b	#%11111011,ccr
			movem.l	(a7)+,d0/d1/a0			; Restaure la valeur du registre
			rts
			
true		ori.b	#%00000100,ccr
			movem.l	(a7)+,d0/d1/a0			; Same
			rts
			
			





			
Convert		movem.l d1/a0,-(a7)
			clr.l	d0
			clr.l	d1
			
\loop		move.b	(a0)+,d1
			beq		\quit
			
			subi.b	#'0',d1
			
			
			mulu.w	#10,d0
			add.l	d1,d0
			
			bra		\loop
			
\quit		movem.l	(a7)+,d1/a0			; Restaure la valeur du registre
			rts
			
			
			
			
			
			
			
			
CharError	movem.l	d1/a0,-(a7)

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
			
			
			
			
			
			
			
			
			
			
			
EmptyString	movem.l	d1/a0,-(a7)

			move.b	(a0)+,d1
			
			tst.l	d1
			beq 	\true
			
			movem.l	(a7)+,d1/a0
			rts
			


\true 		ori.b	#%00000100,ccr
			movem.l	(a7)+,d1/a0
			rts
			
			
String1		dc.b	"122",0
