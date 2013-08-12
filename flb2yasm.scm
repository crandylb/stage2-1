.'$'0		flb2yasm.scm -- Unpacked flb macros for simcmp, CRB, Apr 20, 2012
BEGIN ''''.
; BEGIN '10'20'30'40$
	global	progr$
	global	R0,R1,R2,R3,R4,R5,R6,R7,R8,R9$
	global	RA,RB,RC,RD,RE,RF,RG,RH,RI,RJ,RK,RL,RM$
	global	RN,RO,RP,RQ,RR,RS,RT,RU,RV,RR,RX,RY,RZ,list$
	extern	LBR,LBW,LINE,MB$
	extern	exit,iwrch,iread,iwrite,icntl,iprnt,ioop$
	section	.data$
R0:	dw	0$
	dw	0,0$
R1:	dw	1$
	dw	1,1$
R2:	dw	2$
	dw	2,2$
R3:	dw	3$
	dw	3,3$
R4:	dw	0$
	dw	4,0$
R5:	dw	10$
	dw	5,0$
R6:	dw	0$
	dw	6,0$
R7:	dw	4$
	dw	7,0$
R8:	dw	0$
	dw	8,0$
R9:	dw	listend-list$
	dw	9,0$
RA:	dw	0,0,0$
RB:	dw	0,0,0$
RC:	dw	0,0,0$
RD:	dw	0,0,0$
RE:	dw	0,0,0$
RF:	dw	0,0,0$
RG:	dw	0,0,0$
RH:	dw	0,0,0$
RI:	dw	0,0,0$
RJ:	dw	0,0,0$
RK:	dw	0,0,0$
RL:	dw	0,0,0$
RM:	dw	0,0,0$
RN:	dw	0,0,0$
RO:	dw	0,0,0$
RP:	dw	0,0,0$
RQ:	dw	0,0,0$
RR:	dw	0,0,0$
RS:	dw	0,0,0$
RT:	dw	0,0,0$
RU:	dw	0,0,0$
RV:	dw	0,0,0$
RW:	dw	0,0,0$
RX:	dw	0,0,0$
RY:	dw	0,0,0$
RZ:	dw	0,0,0$
	section	.bss$
list:	resw	15000$
listend:$
	section	.text$
progr:$
	push	EBP$
	mov	EBP,ESP$
$
STOP.
; STOP$
	xor	EAX,EAX$
	mov	[ESP],EAX$
	call	exit$
	pop	EBP$
	xor	EAX,EAX$
	ret$
$
END PROGRAM.
; END PROGRAM$
	end$
'F0$
$
FLG ' = '.
; FLG '10 = '20$
	mov	AX,[R'20+4]$
	mov	[R'10+4],AX$
$
VAL ' = PTR '.
; VAL '10 = PTR '20$
	mov	AX,[R'20]$
	mov	[R'10+2],AX$
$
PTR ' = VAL '.
; PTR '10 = VAL '20$
	mov	AX,[R'20+2]$
	mov	[R'10],AX$
$
PTR ' = ' + '.
; PTR '10 = '20 + '30$
	mov	AX,[R'20]$
	add	AX,[R'30]$
	mov	[R'10],AX$
$
PTR ' = ' - '.
; PTR '10 = '20 - '30$
	mov	AX,[R'20]$
	sub	AX,[R'30]$
	mov	[R'10],AX$
$
PTR ' = ' * '.
; PTR '10 = '20 * '30$
	mov	AX,[R'20]$
	imul	word [R'30]$
	mov	[R'10],AX$
$
PTR ' = ' / '.
; PTR '10 = '20 / '30$
	mov	AX,[R'20]$
	cwd$
	idiv	word [R'30]$
	mov	[R'10],AX$
$
VAL ' = ' + '.
; VAL '10 = '20 + '30$
	mov	AX,[R'20+2]$
	add	AX,[R'30+2]$
	mov	[R'10+2],AX$
$
VAL ' = ' - '.
; VAL '10 = '20 - '30$
	mov	AX,[R'20+2]$
	sub	AX,[R'30+2]$
	mov	[R'10+2],AX$
$
GET ' = '.
; GET '10 = '20$
	mov	AX,[R'20]$
	cwde$
	add	EAX,list$
	mov	EBX,EAX$
	mov	AX,[EBX+2]$
	mov	[R'10],AX$
	mov	AX,[EBX]$
	mov	DX,AX$
	and	DX,3$
	mov	[R'10+4],DX$
	sar	AX,2$
	mov	[R'10+2],AX$
$
STO ' = '.
; STO '10 = '20$
	mov	AX,[R'10]$
	cwde$
	add	EAX,list$
	mov	EBX,EAX$
	mov	AX,[R'20+2]$
	sal	AX,2$
	or	AX,[R'20+4]$
	mov	[EBX],AX$
	mov	AX,[R'20]$
	mov	[EBX+2],AX$
$
READ NEXT '.
; READ NEXT '10$
	mov	AX,[R'10+2]$
	cwde$
	mov	[ESP],EAX$
	call	iread$
	mov	[R'10+4],AX$
$
WRITE NEXT '.
; WRITE NEXT '10$
	mov	AX,[R'10+2]$
	cwde$
	mov	[ESP],EAX$
	call	iwrite$
	mov	[R'10+4],AX$
$
REWIND '.
; REWIND '10$
	mov	AX,[R'10+2]$
	cwde$
	mov	[ESP],EAX$
	call	icntl$
	mov	[R'10+4],AX$
$
VAL ' = CHAR.
; VAL '10 = CHAR$
	mov	EBX,[LBR]$
	mov	AL,[LINE+EBX]$
	cbw$
	mov	[R'10+2],AX$
	inc	EBX$
	mov	[LBR],EBX$
$
CHAR = VAL '.
; CHAR = VAL '10$
	mov	AX,[R'10+2]$
	cwde$
	mov	[ESP],EAX$
	call	iwrch$
	mov	[R'10+4],AX$
$
MESSAGE '''' TO '.
; MESSAGE '10'20'30'40 TO '50$
	mov	EBX,MB$
	mov	byte [EBX+10],'11$
	mov	byte [EBX+11],'21$
	mov	byte [EBX+12],'31$
	mov	byte [EBX+13],'41$
	mov	AX,[R'50+2]$
	cwde$
	mov	[ESP],EAX$
	call	iprnt$
	mov	[R'50+4],AX$
$
LOC ''.
; LOC '10'20$
L'10'20:$
$
TO ''.
; TO '10'20$
	jmp	L'10'20$
$
TO '' BY '.
; TO '10'20 BY '30$
	mov	EAX,G'00$
	sub	EAX,progr$
	mov	[R'30],AX$
	jmp	L'10'20$
G'00:$
$
RETURN BY '.
; RETURN BY '10$
	mov	AX,[R'10]$
	cwde$
	add	EAX,progr$
	mov	EBX,EAX$
	jmp	EBX$
$
TO '' IF FLG ' = '.
; TO '10'20 IF FLG '30 = '40$
	mov	AX,[R'30+4]$
	cmp	AX,[R'40+4]$
	jz	L'10'20$
$
TO '' IF FLG ' NE '.
; TO '10'20 IF FLG '30 NE '40$
	mov	AX,[R'30+4]$
	cmp	AX,[R'40+4]$
	jnz	L'10'20$
$
TO '' IF VAL ' = '.
; TO '10'20 IF VAL '30 = '40$
	mov	AX,[R'30+2]$
	cmp	AX,[R'40+2]$
	jz	L'10'20$
$
TO '' IF VAL ' NE '.
; TO '10'20 IF VAL '30 NE '40$
	mov	AX,[R'30+2]$
	cmp	AX,[R'40+2]$
	jnz	L'10'20$
$
TO '' IF PTR ' = '.
; TO '10'20 IF PTR '30 = '40$
	mov	AX,[R'30]$
	cmp	AX,[R'40]$
	jz	L'10'20$
$
TO '' IF PTR ' NE '.
; TO '10'20 IF PTR '30 NE '40$
	mov	AX,[R'30]$
	cmp	AX,[R'40]$
	jnz	L'10'20$
$
TO '' IF PTR ' GE '.
; TO '10'20 IF PTR '30 GE '40$
	mov	AX,[R'30]$
	cmp	AX,[R'40]$
	jge	L'10'20$
$
TO '' IF PTR ' LT '.
; TO '10'20 IF PTR '30 LT '40$
	mov	AX,[R'30]$
	cmp	AX,[R'40]$
	jl	L'10'20$
$$
