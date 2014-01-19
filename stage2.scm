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
BEGIN STG2. 
FLG I = 0. 
VAL I = 1 + 0. 
PTR I = 0 + 0. 
READ NEXT I. 
TO 98 IF FLG I NE 0. 
VAL A = CHAR. 
PTR A = 8 + 0. 
STO A = I. 
FLG B = 2. 
VAL B = CHAR. 
VAL C = CHAR. 
PTR C = 9 + 0. 
VAL D = CHAR. 
VAL E = CHAR. 
PTR E = VAL E. 
VAL F = CHAR. 
PTR F = A + 7. 
STO F = 0. 
VAL G = 0 + 0. 
PTR H = 5 * 7. 
FLG J = 1. 
PTR J = 0 + 0. 
FLG L = 1. 
VAL L = 0 - 1. 
PTR L = 0 + 0. 
VAL M = CHAR. 
PTR M = 0 + 0. 
FLG N = 0. 
VAL N = CHAR. 
FLG O = 0. 
VAL O = CHAR. 
VAL P = CHAR. 
VAL Q = CHAR. 
VAL R = CHAR. 
PTR R = 0 + 0. 
PTR 4 = 7 + 7. 
PTR 8 = F + 7. 
TO 01 BY D. 
LOC 01. 
GET I = A. 
READ NEXT I. 
TO 98 IF FLG I NE 0. 
PTR I = C + 0. 
VAL Y = 0 + 0. 
PTR Y = C + 0. 
TO 02 IF PTR M = 0. 
PTR M = M - 1. 
TO 01. 
LOC 02. 
PTR 9 = I + 0. 
VAL I = CHAR. 
PTR I = 9 - 7. 
TO 97 IF PTR 8 GE I. 
STO 9 = I. 
TO 04 IF VAL I = L. 
TO 03 IF VAL I = A. 
VAL Y = Y + 1. 
TO 02 IF VAL I NE B. 
PTR B = I + 0. 
STO 9 = B. 
TO 02. 
LOC 03. 
PTR 9 = I + 0. 
VAL I = CHAR. 
PTR I = 9 - 7. 
STO 9 = I. 
TO 97 IF PTR 8 GE I. 
TO 03 IF VAL I NE L. 
LOC 04. 
PTR U = 9 - 7. 
STO U = 3. 
PTR U = U - 7. 
STO U = 3. 
PTR U = U - 7. 
STO U = 3. 
PTR U = U - 7. 
STO U = 3. 
PTR U = U - 7. 
STO U = 3. 
PTR U = U - 7. 
STO U = 3. 
PTR U = U - 7. 
STO U = 3. 
PTR U = U - 7. 
STO U = 3. 
PTR V = U - 7. 
STO V = 3. 
PTR U = V - 7. 
PTR 9 = U + 0. 
TO 97 IF PTR 8 GE 9. 
GET W = A. 
GET X = Y. 
FLG Y = 0. 
PTR Z = A + 0. 
TO 58 BY B. 
TO 50 IF FLG B = 2. 
TO 56 IF FLG Y = 0. 
STO 9 = 1. 
PTR 9 = 9 - H. 
STO 9 = J. 
PTR J = 9 + H. 
PTR 9 = 9 - 7. 
STO 9 = C. 
PTR 9 = 9 - 7. 
STO 9 = D. 
PTR 9 = 9 - 7. 
STO 9 = K. 
PTR K = U + 0. 
PTR 9 = 9 - 7. 
STO 9 = R. 
PTR R = 0 + 0. 
PTR C = 9 - 7. 
TO 97 IF PTR 8 GE C. 
TO 05 BY D. 
LOC 05. 
PTR 9 = C + 0. 
PTR Y = 0 + 0. 
LOC 06. 
TO 07 IF PTR M = 0. 
PTR Z = K + 7. 
GET K = K. 
GET I = K. 
TO 08 IF VAL I = 1. 
PTR M = M - 1. 
GET Z = Z. 
TO 06 IF FLG Z NE 3. 
PTR Y = Y + 1. 
TO 06 IF VAL Z = 7. 
PTR Y = Y - 1. 
TO 06 IF VAL Z NE 8. 
PTR Y = Y - 1. 
TO 06 IF PTR Y GE 0. 
TO 06 IF PTR R = 0. 
PTR U = R - 7. 
GET Y = U. 
TO 49 IF FLG Y NE 1. 
PTR C = R + 0. 
GET R = R. 
TO 05. 
LOC 07. 
PTR K = K + 7. 
GET I = K. 
TO 09 IF FLG I = 2. 
TO 22 IF FLG I = 3. 
PTR I = 9 - 7. 
STO 9 = I. 
PTR 9 = I + 0. 
TO 97 IF PTR 8 GE 9. 
TO 07 IF FLG I = 0. 
PTR Y = C - 9. 
PTR Y = Y / 7. 
PTR Y = Y - 1. 
VAL Y = PTR Y. 
PTR Y = C + 0. 
TO 04 IF VAL I NE 1. 
LOC 08. 
PTR 9 = J - H. 
GET J = 9. 
PTR 9 = 9 - 7. 
GET C = 9. 
PTR 9 = 9 - 7. 
GET D = 9. 
PTR 9 = 9 - 7. 
GET K = 9. 
PTR 9 = 9 - 7. 
GET R = 9. 
RETURN BY D. 
LOC 09. 
PTR V = J + I. 
TO 21 IF VAL I = 6. 
GET Y = V. 
TO 45 IF VAL I = 7. 
TO 23 IF FLG Y = 3. 
GET X = Y. 
TO 11 IF VAL I = 0. 
TO 10 IF VAL I = 1. 
TO 12 IF VAL I = 2. 
TO 15 IF VAL I = 4. 
PTR X = Y + 0. 
TO 20 IF VAL I = 3. 
PTR N = VAL Y. 
TO 18 IF VAL I = 5. 
TO 23 IF VAL Y NE 1. 
PTR N = VAL X. 
TO 18 IF VAL I = 8. 
MESSAGE CONV TO 4. 
TO 94 BY B. 
TO 07. 
LOC 10. 
PTR V = 9 + 7. 
GET W = F. 
PTR Z = F + 0. 
TO 58 BY B. 
TO 07 IF FLG Y NE 1. 
FLG I = 0. 
GET X = Y. 
LOC 11. 
TO 07 IF VAL Y = 0. 
GET I = X. 
PTR X = 9 - 7. 
STO 9 = X. 
PTR 9 = X + 0. 
VAL Y = Y - 1. 
TO 07 IF VAL Y = 0. 
GET X = I. 
PTR I = 9 - 7. 
STO 9 = I. 
PTR 9 = I + 0. 
TO 97 IF PTR 8 GE 9. 
VAL Y = Y - 1. 
TO 11. 
LOC 12. 
FLG B = 2. 
GET W = F. 
PTR Z = F + 0. 
TO 58 BY B. 
FLG B = 0. 
GET X = Y. 
TO 11 IF FLG Y = 1. 
PTR Y = 8 + 0. 
FLG Y = 1. 
PTR L = L + 1. 
PTR X = L + 0. 
PTR W = 9 + 7. 
VAL Y = 0 + 0. 
LOC 13. 
PTR V = X / 5. 
PTR Z = V * 5. 
PTR X = X - Z. 
VAL X = PTR X. 
PTR X = V + 0. 
PTR W = W - 7. 
STO W = X. 
VAL Y = Y + 1. 
TO 97 IF PTR 8 GE W. 
TO 13 IF PTR X NE 0. 
LOC 14. 
GET X = W. 
PTR W = W + 7. 
VAL X = X + E. 
PTR X = 8 + 7. 
STO 8 = X. 
PTR 8 = X + 0. 
TO 14 IF PTR 9 GE W. 
STO 8 = 0. 
PTR 8 = 8 + 7. 
TO 97 IF PTR 8 GE 9. 
STO U = Y. 
GET X = Y. 
FLG I = 0. 
TO 11. 
LOC 15. 
TO 74 BY P. 
TO 18 IF PTR N GE 0. 
PTR O = 9 - 7. 
TO 97 IF PTR 8 GE O. 
STO 9 = O. 
PTR 9 = O + 0. 
PTR N = 0 - N. 
TO 18. 
LOC 16. 
GET Y = V. 
TO 17 IF FLG Y = 1. 
PTR V = V - 7. 
TO 16 IF VAL Y NE I. 
PTR N = Y + 0. 
TO 18. 
LOC 17. 
PTR Y = V + H. 
TO 23 IF PTR Y = J. 
PTR L = L + 1. 
PTR I = L + 0. 
STO V = I. 
PTR V = V - 7. 
GET Y = V. 
FLG Y = 1. 
STO V = Y. 
PTR N = L + 0. 
LOC 18. 
PTR Y = N / 5. 
PTR Z = Y * 5. 
PTR X = N - Z. 
FLG X = 0. 
VAL X = PTR X. 
PTR N = Y + 0. 
VAL G = G + 1. 
PTR 8 = 8 + 7. 
STO 8 = X. 
TO 18 IF PTR N NE 0. 
LOC 19. 
GET X = 8. 
PTR 8 = 8 - 7. 
VAL G = G - 1. 
VAL X = X + E. 
PTR X = 9 - 7. 
STO 9 = X. 
PTR 9 = X + 0. 
TO 19 IF VAL G NE 0. 
TO 07. 
LOC 20. 
GET X = X. 
VAL Y = Y - 1. 
TO 20 IF VAL Y NE L. 
TO 07 IF FLG X = 1. 
PTR X = 9 - 7. 
TO 97 IF PTR 8 GE X. 
STO 9 = X. 
PTR 9 = X + 0. 
TO 07. 
LOC 21. 
STO 9 = L. 
PTR K = K + 7. 
PTR Y = C - 9. 
PTR Y = Y / 7. 
FLG Y = 0. 
VAL Y = PTR Y. 
PTR Y = C + 0. 
STO V = Y. 
PTR C = 9 - 7. 
TO 05. 
LOC 22. 
PTR V = J + 0. 
TO 16 IF PTR I = 0. 
TO 08 IF VAL I = 9. 
PTR V = V + 7. 
PTR K = K + 7. 
TO 32 IF VAL I = 1. 
TO 32 IF VAL I = 2. 
TO 33 IF VAL I = 3. 
TO 42 IF VAL I = 4. 
TO 36 IF VAL I = 5. 
TO 39 IF VAL I = 6. 
TO 43 IF VAL I = 7. 
TO 47 IF VAL I = 8. 
TO 23 IF VAL I NE 0. 
STOP. 
LOC 23. 
MESSAGE CONV TO 4. 
TO 94 BY B. 
TO 07. 
LOC 32. 
GET X = K. 
VAL W = 3 + 0. 
TO 24 IF FLG X = 1. 
PTR K = K + 7. 
VAL W = X - E. 
GET X = K. 
TO 24 IF FLG X = 1. 
REWIND W. 
PTR K = K + 7. 
LOC 24. 
TO 31 IF VAL I = 2. 
STO 9 = L. 
PTR X = C + 0. 
TO 57 IF PTR C NE 9. 
PTR K = K + 7. 
GET I = K. 
TO 25 IF FLG I NE 1. 
PTR K = K - 7. 
TO 23. 
LOC 25. 
PTR Z = VAL I. 
PTR Z = Z - E. 
TO 28 IF PTR Z GE 5. 
TO 28 IF PTR 0 GE Z. 
VAL X = I + 0. 
PTR Z = Z * 7. 
PTR Y = J + Z. 
GET Y = Y. 
TO 27 IF FLG Y = 3. 
GET Z = Y. 
LOC 26. 
TO 27 IF VAL Y = 0. 
CHAR = VAL Z. 
GET Z = Z. 
VAL Y = Y - 1. 
PTR K = K + 7. 
GET I = K. 
TO 26 IF VAL I = X. 
TO 25. 
LOC 27. 
CHAR = VAL F. 
PTR K = K + 7. 
GET I = K. 
TO 27 IF VAL I = X. 
TO 25. 
LOC 28. 
TO 57 IF FLG I = 1. 
CHAR = VAL I. 
PTR K = K + 7. 
GET I = K. 
TO 25. 
LOC 31. 
GET I = A. 
TO 29 IF PTR C = 9. 
GET X = C. 
VAL I = X - E. 
STO A = I. 
TO 29 IF PTR X = 9. 
REWIND I. 
TO 98 IF FLG I NE 0. 
LOC 29. 
GET X = V. 
TO 05 IF VAL X = 0. 
TO 05 IF FLG X = 3. 
PTR Y = X + 0. 
READ NEXT I. 
TO 98 IF FLG I NE 0. 
LOC 30. 
TO 05 IF VAL X = 0. 
VAL X = X - 1. 
GET Y = Y. 
VAL Z = CHAR. 
TO 30 IF VAL Y = Z. 
WRITE NEXT W. 
TO 29 IF FLG W = 0. 
STOP. 
LOC 33. 
GET Y = V. 
TO 23 IF FLG Y = 3. 
TO 05 IF VAL Y = 0. 
GET X = Y. 
FLG B = 2. 
GET W = F. 
PTR Z = F + 0. 
TO 58 BY B. 
FLG B = 0. 
FLG W = Y. 
PTR W = U + 0. 
PTR Z = Y + 0. 
PTR V = V + 7. 
GET Y = V. 
TO 23 IF FLG Y = 3. 
PTR X = Y + 0. 
FLG Z = 1. 
VAL Z = Y + 0. 
TO 35 IF FLG W NE 1. 
STO W = Z. 
TO 05 IF VAL Y = 0. 
LOC 34. 
GET X = X. 
PTR W = Z + 0. 
GET Z = W. 
VAL Z = X + 0. 
STO W = Z. 
VAL Y = Y - 1. 
TO 35 IF PTR Z = 0. 
TO 34 IF VAL Y NE 0. 
TO 05. 
LOC 35. 
PTR Z = 8 + 0. 
STO W = Z. 
PTR 8 = 8 + 7. 
TO 97 IF PTR 8 GE 9. 
PTR W = Z + 0. 
GET Z = X. 
PTR X = Z + 0. 
VAL Y = Y - 1. 
TO 35 IF VAL Y NE L. 
STO W = 0. 
TO 05. 
LOC 36. 
GET I = K. 
PTR K = K + 7. 
GET Y = V. 
PTR V = V + 7. 
GET Z = V. 
TO 23 IF FLG Y = 3. 
TO 23 IF FLG Z = 3. 
PTR V = V + 7. 
TO 41 IF VAL Y NE Z. 
TO 38 IF VAL Y = 0. 
PTR X = Z + 0. 
LOC 37. 
GET X = X. 
GET Y = Y. 
TO 41 IF VAL X NE Y. 
VAL Z = Z - 1. 
TO 37 IF VAL Z NE 0. 
LOC 38. 
TO 05 IF VAL I NE E. 
TO 42. 
LOC 39. 
GET I = K. 
PTR K = K + 7. 
GET Y = V. 
TO 23 IF FLG Y = 3. 
TO 74 BY P. 
PTR I = N + 0. 
PTR V = J + 4. 
GET Y = V. 
TO 23 IF FLG Y = 3. 
TO 74 BY P. 
PTR V = J + 4. 
PTR V = V + 7. 
PTR N = N - I. 
TO 38 IF PTR N = 0. 
TO 40 IF PTR N GE 0. 
TO 05 IF VAL I = O. 
TO 41. 
LOC 40. 
TO 05 IF VAL I = N. 
LOC 41. 
TO 05 IF VAL I = E. 
LOC 42. 
GET Y = V. 
TO 23 IF FLG Y = 3. 
TO 05 IF VAL Y = 0. 
TO 74 BY P. 
PTR M = N + 0. 
TO 05. 
LOC 43. 
PTR Y = C - 9. 
PTR Y = Y / 7. 
VAL Y = PTR Y. 
TO 07 IF VAL Y = 0. 
PTR Y = C + 0. 
TO 74 BY P. 
FLG Y = 1. 
VAL Y = 0 + 0. 
PTR Y = N + 1. 
STO C = R. 
PTR Z = R + 0. 
PTR R = C + 0. 
PTR C = C - 4. 
STO C = K. 
LOC 44. 
PTR C = R + 0. 
PTR R = Z + 0. 
PTR Y = Y - 1. 
TO 05 IF PTR 0 GE Y. 
PTR R = C + 0. 
PTR C = C - 7. 
STO C = Y. 
PTR C = C - 7. 
GET K = C. 
PTR C = C - 7. 
TO 05. 
LOC 45. 
STO 9 = L. 
PTR W = C - 9. 
PTR W = W / 7. 
FLG W = 0. 
VAL W = PTR W. 
PTR W = C + 0. 
PTR 9 = 9 - 7. 
FLG B = 2. 
PTR B = 0 + 0. 
FLG U = 0. 
VAL U = R + 0. 
PTR U = 7 + 0. 
FLG Z = 1. 
VAL Z = 0 + 0. 
PTR Z = 0 + 0. 
PTR X = 9 - 7. 
LOC 46. 
VAL Z = Z + 1. 
STO 9 = Z. 
PTR 9 = 9 - 7. 
STO 9 = U. 
PTR 9 = 9 - 7. 
STO 9 = B. 
PTR 9 = 9 - 7. 
PTR K = K + 7. 
GET I = K. 
PTR I = X - 9. 
STO 9 = I. 
PTR X = 9 + 0. 
PTR 9 = 9 - 7. 
TO 97 IF PTR 8 GE 9. 
TO 46 IF FLG I NE 1. 
STO 9 = B. 
FLG B = 0. 
PTR Z = 9 + 0. 
PTR 9 = 9 - 7. 
VAL U = M + 0. 
STO 9 = U. 
PTR 9 = 9 - 7. 
STO 9 = R. 
PTR 9 = 9 - 7. 
STO 9 = C. 
PTR 9 = 9 - 7. 
STO 9 = V. 
PTR 9 = 9 - 7. 
STO 9 = Y. 
PTR R = 9 - 7. 
STO R = Z. 
PTR 9 = R - 7. 
STO 9 = W. 
PTR 9 = 9 - 4. 
STO 9 = K. 
PTR Z = Z - 7. 
TO 48. 
LOC 47. 
TO 05 IF PTR R = 0. 
GET Z = R. 
LOC 48. 
PTR U = R - 7. 
GET Y = U. 
TO 44 IF FLG Y = 1. 
TO 49 IF VAL Y = 0. 
STO U = 0. 
PTR U = U - 4. 
GET K = U. 
PTR V = U + 0. 
PTR 9 = U - 7. 
PTR C = 9 + 0. 
GET X = Y. 
TO 99 BY B. 
PTR Y = R + 4. 
GET W = Y. 
PTR Y = R - 4. 
TO 97 IF PTR 8 GE Y. 
GET Y = Y. 
STO W = Y. 
TO 05. 
LOC 99. 
TO 60 IF VAL Z NE 1. 
FLG X = 0. 
VAL X = Y - 1. 
VAL Y = 1 + 0. 
PTR U = U + 7. 
STO U = Y. 
PTR U = U + 7. 
STO U = X. 
RETURN BY B. 
LOC 49. 
TO 44 IF FLG Y = 1. 
PTR R = R + 7. 
GET Y = R. 
PTR R = R + 7. 
GET W = R. 
STO W = Y. 
PTR R = R + 7. 
GET C = R. 
PTR R = R + 7. 
GET R = R. 
TO 05. 
LOC 50. 
FLG Y = 1. 
VAL Y = L + 0. 
PTR 8 = 8 - 7. 
TO 54. 
LOC 51. 
VAL I = CHAR. 
STO 8 = I. 
TO 52 IF VAL I = C. 
TO 52 IF VAL I = D. 
VAL I = I - E. 
FLG Z = 3. 
VAL Z = CHAR. 
VAL Z = Z - E. 
PTR Z = VAL I. 
STO 8 = Z. 
TO 52 IF PTR 0 GE Z. 
TO 52 IF PTR Z GE 5. 
FLG Z = 2. 
PTR Z = Z * 7. 
STO 8 = Z. 
LOC 52. 
PTR 8 = 8 + 7. 
TO 97 IF PTR 8 GE 9. 
VAL I = CHAR. 
STO 8 = I. 
TO 51 IF VAL I = D. 
TO 53 IF VAL I = L. 
TO 52 IF VAL I NE C. 
LOC 53. 
PTR Y = 8 + 0. 
STO U = Y. 
PTR U = 8 + 0. 
LOC 54. 
GET I = A. 
READ NEXT I. 
TO 98 IF FLG I NE 0. 
VAL I = CHAR. 
PTR I = 0 + 0. 
PTR 8 = 8 + 7. 
STO 8 = I. 
TO 51 IF VAL I = D. 
TO 52 IF VAL I NE C. 
PTR Y = 8 + 0. 
STO U = Y. 
STO 8 = 1. 
PTR 8 = 8 + 7. 
TO 97 IF PTR 8 GE 9. 
VAL I = CHAR. 
TO 55 IF VAL I NE C. 
FLG B = 0. 
LOC 55. 
RETURN BY D. 
LOC 56. 
VAL W = 3 + 0. 
PTR X = C + 0. 
LOC 57. 
GET X = X. 
CHAR = VAL X. 
TO 57 IF FLG X NE 1. 
WRITE NEXT W. 
TO 98 IF FLG W NE 0. 
TO 55 IF VAL X = L. 
CHAR = VAL X. 
TO 57. 
LOC 58. 
PTR Z = W + Z. 
TO 60 IF PTR W NE 0. 
TO 71 IF FLG B = 2. 
LOC 59. 
TO 70 IF PTR V GE 9. 
GET Z = V. 
GET Y = Q. 
GET X = Y. 
TO 63 IF FLG Z = 2. 
TO 64 IF FLG Z = 3. 
PTR V = Q + 7. 
PTR Q = V + 7. 
LOC 60. 
GET W = Z. 
TO 69 IF FLG W = 1. 
TO 62 IF FLG W = 2. 
TO 58 IF VAL Y = 0. 
TO 58 IF VAL X NE W. 
TO 61 IF PTR W = 0. 
TO 61 IF FLG X = 3. 
TO 61 IF FLG B = 2. 
PTR Q = V - 7. 
PTR V = Q - 7. 
TO 97 IF PTR 8 GE V. 
STO Q = Y. 
PTR W = W + Z. 
STO V = W. 
LOC 61. 
VAL Y = Y - 1. 
PTR Y = X + 0. 
GET X = X. 
PTR Z = Z + 7. 
TO 60. 
LOC 62. 
TO 61 IF FLG X = 2. 
TO 58 IF FLG B = 2. 
PTR Q = V - 7. 
PTR V = Q - 7. 
TO 97 IF PTR 8 GE V. 
STO Q = Y. 
FLG Z = 2. 
STO V = Z. 
FLG Z = 3. 
TO 58. 
LOC 63. 
FLG Z = 3. 
PTR Z = Z + 7. 
STO V = Z. 
PTR U = U + 7. 
FLG W = 0. 
VAL W = 0 + 0. 
PTR W = Y + 0. 
STO U = W. 
TO 60. 
LOC 64. 
TO 68 IF VAL Y = 0. 
TO 68 IF VAL X = R. 
GET W = U. 
VAL W = W + 1. 
VAL Y = Y - 1. 
PTR Y = X + 0. 
TO 67 IF VAL X NE M. 
VAL Z = 0 + 0. 
LOC 65. 
VAL Z = Z + 1. 
LOC 66. 
TO 68 IF VAL Y = 0. 
GET X = X. 
VAL Y = Y - 1. 
PTR Y = X + 0. 
VAL W = W + 1. 
TO 65 IF VAL X = M. 
TO 66 IF VAL X NE R. 
VAL Z = Z - 1. 
TO 66 IF VAL Z NE 0. 
LOC 67. 
GET X = X. 
STO Q = Y. 
STO U = W. 
TO 60. 
LOC 68. 
STO U = 3. 
PTR U = U - 7. 
PTR V = Q + 7. 
PTR Q = V + 7. 
TO 59. 
LOC 69. 
TO 58 IF VAL Y NE 0. 
PTR U = Z + 7. 
GET Y = U. 
LOC 70. 
RETURN BY B. 
LOC 71. 
PTR W = 8 - Z. 
STO Z = W. 
TO 73 IF VAL Y = 0. 
LOC 72. 
VAL Y = Y - 1. 
PTR Y = X + 0. 
PTR X = 0 + 0. 
STO 8 = X. 
PTR 8 = 8 + 7. 
TO 97 IF PTR 8 GE 9. 
GET X = Y. 
TO 72 IF VAL Y NE 0. 
LOC 73. 
FLG X = 1. 
PTR X = 0 + 0. 
STO 8 = X. 
PTR U = 8 + 7. 
FLG Y = 0. 
PTR Y = U + 0. 
STO U = Y. 
PTR 8 = U + 7. 
TO 97 IF PTR 8 GE 9. 
RETURN BY B. 
LOC 74. 
PTR O = 9 + 0. 
VAL S = Y + 0. 
PTR S = Y + 0. 
PTR T = 0 + 0. 
TO 75 IF VAL Y NE 0. 
PTR N = 0 + 0. 
RETURN BY P. 
LOC 75. 
VAL T = M + 0. 
LOC 76. 
TO 93 IF VAL S = 0. 
GET X = S. 
PTR Y = S + 0. 
VAL Y = 0 + 0. 
TO 77 IF VAL X NE M. 
STO 9 = T. 
PTR 9 = 9 - 7. 
TO 97 IF PTR 8 GE 9. 
VAL S = S - 1. 
PTR S = X + 0. 
TO 75. 
LOC 77. 
TO 78 IF VAL X = N. 
TO 78 IF VAL X = O. 
TO 78 IF VAL X = P. 
TO 78 IF VAL X = Q. 
TO 78 IF VAL X = R. 
VAL Y = Y + 1. 
GET X = X. 
TO 77 IF VAL S NE Y. 
VAL X = R + 0. 
VAL S = S + 1. 
LOC 78. 
VAL J = X + 0. 
PTR N = 0 + 0. 
VAL S = S - Y. 
VAL S = S - 1. 
PTR S = X + 0. 
TO 83 IF VAL Y = 0. 
GET X = Y. 
PTR U = VAL X. 
PTR U = U - E. 
TO 79 IF PTR U GE 5. 
TO 81 IF PTR U GE 0. 
LOC 79. 
PTR V = 9 + 7. 
GET W = F. 
FLG Y = 0. 
PTR Z = F + 0. 
TO 58 BY B. 
TO 83 IF FLG Y NE 1. 
TO 83 IF VAL Y = 0. 
GET X = Y. 
FLG N = 1. 
TO 82 IF VAL X = O. 
FLG N = 0. 
PTR X = Y + 0. 
LOC 80. 
GET X = X. 
PTR U = VAL X. 
PTR U = U - E. 
TO 81 IF PTR U = 0. 
TO 93 IF PTR U GE 5. 
TO 93 IF PTR 0 GE U. 
LOC 81. 
PTR N = N * 5. 
PTR N = N + U. 
LOC 82. 
VAL Y = Y - 1. 
TO 80 IF VAL Y NE 0. 
TO 83 IF FLG N = 0. 
FLG N = 0. 
PTR N = 0 - N. 
LOC 83. 
TO 92 IF VAL J = R. 
TO 90 IF VAL T = M. 
TO 89 IF VAL J = P. 
TO 89 IF VAL J = Q. 
LOC 84. 
TO 87 IF VAL T = Q. 
TO 86 IF VAL T = P. 
TO 85 IF VAL T = O. 
PTR T = T + N. 
TO 88. 
LOC 85. 
PTR T = T - N. 
TO 88. 
LOC 86. 
PTR T = T * N. 
TO 88. 
LOC 87. 
PTR T = T / N. 
LOC 88. 
VAL T = J + 0. 
TO 76 IF VAL J NE R. 
PTR N = T + 0. 
PTR 9 = 9 + 7. 
GET T = 9. 
TO 92. 
LOC 89. 
TO 86 IF VAL T = P. 
TO 87 IF VAL T = Q. 
LOC 90. 
STO 9 = T. 
PTR 9 = 9 - 7. 
TO 97 IF PTR 8 GE 9. 
VAL T = J + 0. 
PTR T = N + 0. 
TO 76. 
LOC 91. 
TO 93 IF VAL S NE 0. 
RETURN BY P. 
LOC 92. 
TO 84 IF VAL T NE M. 
TO 91 IF PTR 9 = O. 
PTR 9 = 9 + 7. 
GET T = 9. 
TO 92 IF VAL S = 0. 
GET X = S. 
VAL S = S - 1. 
PTR S = X + 0. 
VAL J = X + 0. 
TO 92 IF VAL J = R. 
TO 83 IF VAL J = N. 
TO 83 IF VAL J = O. 
TO 83 IF VAL J = P. 
TO 83 IF VAL J = Q. 
LOC 93. 
MESSAGE EXPR TO 4. 
PTR N = 0 + 0. 
PTR 9 = O + 0. 
TO 94 BY B. 
RETURN BY P. 
LOC 94. 
PTR X = C + 0. 
PTR Y = J + 0. 
TO 96 IF PTR 9 GE C. 
STO 9 = L. 
LOC 95. 
GET X = X. 
CHAR = VAL X. 
TO 95 IF FLG X = 0. 
WRITE NEXT 4. 
TO 98 IF FLG 4 NE 0. 
TO 96 IF VAL X = L. 
CHAR = VAL X. 
TO 95. 
LOC 96. 
TO 70 IF PTR Y = 0. 
PTR Y = Y - H. 
PTR X = Y - 7. 
GET Y = Y. 
GET X = X. 
TO 95. 
LOC 97. 
MESSAGE FULL TO 4. 
TO 94 BY B. 
STOP. 
LOC 98. 
MESSAGE IOCH TO 4. 
TO 94 BY B. 
STOP. 
END PROGRAM. 
