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
BEGIN STG2.		stage2.flub, CRB, Oct 5, 2002
FLG I = 0.		set up macro channel.
VAL I = 1 + 0.
PTR I = 0 + 0.
READ NEXT I.		grab the flag line.
TO 98 IF FLG I NE 0.	quit unless all is ok.
VAL A = CHAR.		source eol.
PTR A = 8 + 0.		set up a void template tree.
STO A = I.		save the macro channel spec.
FLG B = 2.		phase flag.
VAL B = CHAR.		source parameter flag.
VAL C = CHAR.		mct eol.
PTR C = 9 + 0.		initial text pointer.
VAL D = CHAR.		mct parameter flag.
VAL E = CHAR.		zero character.
PTR E = VAL E.		prepare for normalizations.
VAL F = CHAR.		space character.
PTR F = A + 7.		set up a void symbol tree.
STO F = 0.
VAL G = 0 + 0.		reset the digit count for number conversion.
PTR H = 5 * 7.		10 * descriptor length.
FLG J = 1.		flag to terminate created symbol.
PTR J = 0 + 0.
FLG L = 1.		end-of-line indicator.
VAL L = 0 - 1.		carriage return is -1.
PTR L = 0 + 0.		location counter.
VAL M = CHAR.		left parenthesis.
PTR M = 0 + 0.		reset the skip count.
FLG N = 0.		set expression sign positive.
VAL N = CHAR.		addition operator.
FLG O = 0.
VAL O = CHAR.		subtraction operator.
VAL P = CHAR.		multiplication operator.
VAL Q = CHAR.		division operator.
VAL R = CHAR.		right parenthesis.
PTR R = 0 + 0.		set no repetition in progress.
PTR 4 = 7 + 7.		length of two descriptors.
PTR 8 = F + 7.		point to the first available space.
TO 01 BY D.		start working in earnest.

LOC 01.			routine to read from the input.
GET I = A.		recall the channel spec.
READ NEXT I.		grab a line.
TO 98 IF FLG I NE 0.	get out unless all is ok.
PTR I = C + 0.
VAL Y = 0 + 0.
PTR Y = C + 0.
TO 02 IF PTR M = 0.	should this line be skipped, no.
PTR M = M - 1.		yes, drop the skip count.
TO 01.			try again.

LOC 02.			reading loop.
PTR 9 = I + 0.		advance the space pointer.
VAL I = CHAR.		read the next character.
PTR I = 9 - 7.		point to the next character space.
TO 97 IF PTR 8 GE I.	have we overrun the area, yes.
STO 9 = I.		put away the character.
TO 04 IF VAL I = L.	was this a carriage return, yes.
TO 03 IF VAL I = A.	have we completed the read, yes.
VAL Y = Y + 1.		bump the input string length.
TO 02 IF VAL I NE B.	no, is this a parameter flag, no.
PTR B = I + 0.		yes, set the parameter pointer and
STO 9 = B.		store it with the phase flag.
TO 02.

LOC 03.			read the remainder of the line.
PTR 9 = I + 0.		point to the first free space.
VAL I = CHAR.		grab another character.
PTR I = 9 - 7.		set a pointer to the next character.
STO 9 = I.
TO 97 IF PTR 8 GE I.	have we run out of space, yes.
TO 03 IF VAL I NE L.	was this a carriage return, no.

LOC 04.			scanner.
PTR U = 9 - 7.		set all parameters undefined.
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
PTR 9 = U + 0.		free space pointer.
TO 97 IF PTR 8 GE 9.
GET W = A.		set up the template tree pointer.
GET X = Y.		grab the first input character.
FLG Y = 0.		set the string undefined.
PTR Z = A + 0.		set the tree pointer to the template root.
TO 58 BY B.		call the scanner.
TO 50 IF FLG B = 2.	is this the definition phase, yes.
TO 56 IF FLG Y = 0.	was there a definition, no.
STO 9 = 1.		initially no created symbols for this macro.
PTR 9 = 9 - H.		space for the created symbols.
STO 9 = J.		previous parameter pointer.
PTR J = 9 + H.		set the current parameter pointer.
PTR 9 = 9 - 7.
STO 9 = C.		previous text pointer.
PTR 9 = 9 - 7.
STO 9 = D.		save the old return address.
PTR 9 = 9 - 7.
STO 9 = K.		save the current text pointer.
PTR K = U + 0.		set up the new text pointer.
PTR 9 = 9 - 7.
STO 9 = R.		save the old repetition pointer.
PTR R = 0 + 0.		set no repetitions in progress.
PTR C = 9 - 7.		new text pointer.
TO 97 IF PTR 8 GE C.	is the space full already,yes
TO 05 BY D.		go process the mct.

LOC 05.			substitute parameters in one line.
PTR 9 = C + 0.		discard any junk.
PTR Y = 0 + 0.		reset the loop counter.

LOC 06.
TO 07 IF PTR M = 0.	should we skip lines, no.
PTR Z = K + 7.		retain the code body position.
GET K = K.		skip a line.
GET I = K.		grab the terminator.
TO 08 IF VAL I = 1.	check for the end of the macro.
PTR M = M - 1.		decrement the skip count.
GET Z = Z.		grab the first skipped element.
TO 06 IF FLG Z NE 3.	ignore the non-function calls.
PTR Y = Y + 1.		bump the count of loops entered.
TO 06 IF VAL Z = 7.	leave the increm value if loop entered.
PTR Y = Y - 1.		else drop it back.
TO 06 IF VAL Z NE 8.	no change if not loop end.
PTR Y = Y - 1.		else decrement the count.
TO 06 IF PTR Y GE 0.	and go on if skipping an entire loop.
TO 06 IF PTR R = 0.	or if there is no current loop.
PTR U = R - 7.		else terminate the loop.
GET Y = U.
TO 49 IF FLG Y NE 1.	is it count controlled, no.
PTR C = R + 0.		yes, reset the line space pointer.
GET R = R.		restore iteration pointer.
TO 05.			if not, continue.

LOC 07.			character processing loop.
PTR K = K + 7.		advance the pointer and
GET I = K.		fetch the next character.
TO 09 IF FLG I = 2.	is this a parameter call, yes.
TO 22 IF FLG I = 3.	no, is it a compiler switch, yes.
PTR I = 9 - 7.		no, set the pointer to the next space.
STO 9 = I.		put the character in the pseudo-input.
PTR 9 = I + 0.		advance the space pointer.
TO 97 IF PTR 8 GE 9.	is the space exhausted, yes.
TO 07 IF FLG I = 0.	was that the last character, no.
PTR Y = C - 9.		set the pseudo-input length.
PTR Y = Y / 7.
PTR Y = Y - 1.
VAL Y = PTR Y.
PTR Y = C + 0.
TO 04 IF VAL I NE 1.	was that the end of the code body, no.

LOC 08.
PTR 9 = J - H.		restore from the current recursion.
GET J = 9.		parameter pointer.
PTR 9 = 9 - 7.
GET C = 9.		text space pointer.
PTR 9 = 9 - 7.
GET D = 9.		return address.
PTR 9 = 9 - 7.
GET K = 9.		code body pointer.
PTR 9 = 9 - 7.
GET R = 9.		iteration pointer.
RETURN BY D.

LOC 09.			do parameter conversion.
PTR V = J + I.		no, find the parameter pointer.
TO 21 IF VAL I = 6.	set a parameter.
GET Y = V.		and load it.
TO 45 IF VAL I = 7.	initiate repetition over an argument list.
TO 23 IF FLG Y = 3.	error if parameter is undefined.
GET X = Y.		get the first character.
TO 11 IF VAL I = 0.	copy conversion.
TO 10 IF VAL I = 1.	symbol reference.
TO 12 IF VAL I = 2.	location symbol definition.
TO 15 IF VAL I = 4.	request for expression conversion.
PTR X = Y + 0.
TO 20 IF VAL I = 3.	request the break character.
PTR N = VAL Y.
TO 18 IF VAL I = 5.	request for parameter length.
TO 23 IF VAL Y NE 1.	if not one character, signal error.
PTR N = VAL X.
TO 18 IF VAL I = 8.	request for internal representation.
MESSAGE CONV TO 4.	the conversion digit is unavailable.
TO 94 BY B.		call error traceback.
TO 07.			continue with the line.

LOC 10.			deal with a location symbol.
PTR V = 9 + 7.		stack pointer for scanner.
GET W = F.		set up the symbol tree.
PTR Z = F + 0.		set the tree pointer to the symbol root.
TO 58 BY B.		call on the scanner.
TO 07 IF FLG Y NE 1.	was the symbol defined, no.
FLG I = 0.		prepare to copy over the symbol value.
GET X = Y.		no, grab the first character.

LOC 11.			copy a parameter to pseudo-input.
TO 07 IF VAL Y = 0.	is the parameter void, yes.
GET I = X.		fetch the next character.
PTR X = 9 - 7.		set the pointer.
STO 9 = X.		and put it in the pseudo-input.
PTR 9 = X + 0.		point to the next free space.
VAL Y = Y - 1.		decrement the character count.
TO 07 IF VAL Y = 0.	are we done, yes.
GET X = I.		no, get the next character.
PTR I = 9 - 7.		set its pointer.
STO 9 = I.		put away the copy.
PTR 9 = I + 0.		point to the next free space.
TO 97 IF PTR 8 GE 9.	have we exhausted the space, yes.
VAL Y = Y - 1.		no, drop the count of characters.
TO 11.

LOC 12.			move a definition to the output.
FLG B = 2.		allow symbol definition.
GET W = F.		set up the symbol tree.
PTR Z = F + 0.		set the symbol tree pointer to the symbol root.
TO 58 BY B.		call on the scanner.
FLG B = 0.		exit the definition phase.
GET X = Y.
TO 11 IF FLG Y = 1.	is this a new symbol, no.
PTR Y = 8 + 0.		yes, set up the definition pointer.
FLG Y = 1.		mark it as having been defined.
PTR L = L + 1.		bump the location counter.
PTR X = L + 0.		and insert it as the definition.
PTR W = 9 + 7.		use store at the top as temporary.
VAL Y = 0 + 0.		count the digits.

LOC 13.			convert one digit at a time.
PTR V = X / 5.		get the quotient by integer division.
PTR Z = V * 5.		the remainder must be found by multiplying
PTR X = X - Z.		and then subtracting.
VAL X = PTR X.		move the result to the value field.
PTR X = V + 0.		the quotient is to be operated on next.
PTR W = W - 7.		advance the temporary storage pointer.
STO W = X.		and salt away the result.
VAL Y = Y + 1.		bump the digit count.
TO 97 IF PTR 8 GE W.	have we run our of room, yes.
TO 13 IF PTR X NE 0.	no, must we go on, yes.

LOC 14.			move the digits to their destination.
GET X = W.		recover a possible digit.
PTR W = W + 7.		move the digit pointer back.
VAL X = X + E.		make the digits into characters.
PTR X = 8 + 7.		set up the pointer to the next space.
STO 8 = X.		put away the character.
PTR 8 = X + 0.		bump the space pointer.
TO 14 IF PTR 9 GE W.	did we really have another digit.
STO 8 = 0.		put in the terminator.
PTR 8 = 8 + 7.		advance the space pointer.
TO 97 IF PTR 8 GE 9.
STO U = Y.		put away the pointer to the definition.
GET X = Y.		pick up the first char of the definition.
FLG I = 0.		clean out the input buffer.
TO 11.			copy out the value.

LOC 15.			process an expression parameter.
TO 74 BY P.		evaluate the expression.
TO 18 IF PTR N GE 0.	and test for non-negative.
PTR O = 9 - 7.		if negative, insert a minus sign.
TO 97 IF PTR 8 GE O.
STO 9 = O.
PTR 9 = O + 0.
PTR N = 0 - N.		make the number positive and
TO 18.			store down.

LOC 16.			conversion of parameter zero (loc. counter)
GET Y = V.		grab the next created symbol.
TO 17 IF FLG Y = 1.	is this a symbol, no.
PTR V = V - 7.		yes, advance the created symbol pointer.
TO 16 IF VAL Y NE I.	is this the right symbol, no.
PTR N = Y + 0.		yes, set up its value
TO 18.			and insert it in the line.

LOC 17.			create a new symbol.
PTR Y = V + H.		check that there is room for it.
TO 23 IF PTR Y = J.	if not, treat as a conversion error.
PTR L = L + 1.		bump the location counter.
PTR I = L + 0.		save the new value in the next space.
STO V = I.
PTR V = V - 7.		flag the next entry as no symbol.
GET Y = V.
FLG Y = 1.
STO V = Y.
PTR N = L + 0.		set up the number to be converted.

LOC 18.			convert ptr x to characters, store down.
PTR Y = N / 5.		get the quotient by integer division.
PTR Z = Y * 5.		the remainder must be found by multiplying
PTR X = N - Z.		and then subtracting.
FLG X = 0.
VAL X = PTR X.		move the result to the value field.
PTR N = Y + 0.		the quotient is to be operated on next.
VAL G = G + 1.		advance the temporary storage count.
PTR 8 = 8 + 7.
STO 8 = X.		and salt away the result.
TO 18 IF PTR N NE 0.	no, must we go on, yes.

LOC 19.			move the digits to their destination.
GET X = 8.		recover a possible digit.
PTR 8 = 8 - 7.		move the digit pointer back.
VAL G = G - 1.
VAL X = X + E.		make the digits into characters.
PTR X = 9 - 7.		set up a pointer to the next space.
STO 9 = X.		put away the character.
PTR 9 = X + 0.		drop the space pointer.
TO 19 IF VAL G NE 0.	did we really have another digit, yes.
TO 07.			no, go back to the line processor.

LOC 20.			advance to a break character.
GET X = X.		get the next character
VAL Y = Y - 1.		and drop the number remaining.
TO 20 IF VAL Y NE L.	was that the break, no.
TO 07 IF FLG X = 1.	end of line is the null break.
PTR X = 9 - 7.		set the pointer.
TO 97 IF PTR 8 GE X.
STO 9 = X.		and put away the break character.
PTR 9 = X + 0.
TO 07.

LOC 21.			set a parameter.
STO 9 = L.		terminate the current line.
PTR K = K + 7.		bypass the next character.
PTR Y = C - 9.		set up the specification of the
PTR Y = Y / 7.		current string.
FLG Y = 0.
VAL Y = PTR Y.		length in characters.
PTR Y = C + 0.		pointer to the first character.
STO V = Y.		set the parameter store.
PTR C = 9 - 7.		next empty space for the line.
TO 05.

LOC 22.			decode compiler switches.
PTR V = J + 0.		set the parameter pointer.
TO 16 IF PTR I = 0.	is this a call on parameter zero, yes.
TO 08 IF VAL I = 9.	escape from the current macro.
PTR V = V + 7.		advance the parameter pointer.
PTR K = K + 7.		bypass the character following the switch.
TO 32 IF VAL I = 1.	output the line without rescanning.
TO 32 IF VAL I = 2.	change I/O units and copy.
TO 33 IF VAL I = 3.	redefine a symbol.
TO 42 IF VAL I = 4.	skip arg 1 lines unconditionally.
TO 36 IF VAL I = 5.	compare arg 1 and arg 2 as strings.
TO 39 IF VAL I = 6.	compare arg 1 and arg 2 as expressions.
TO 43 IF VAL I = 7.	initiate a repetition under count control.
TO 47 IF VAL I = 8.	advance to the next member of the list.
TO 23 IF VAL I NE 0.	if not a request for termination, complain
STOP.			else terminate normally.

LOC 23.			error in conversion digit.
MESSAGE CONV TO 4.	put out the message.
TO 94 BY B.		produce a traceback.
TO 07.			and then continue.

LOC 32.			check for alternate output unit.
GET X = K.		this might be a channel number.
VAL W = 3 + 0.		the default output channel is 3.
TO 24 IF FLG X = 1.	if no channel number, take the default.
PTR K = K + 7.		else advance the code body pointer.
VAL W = X - E.		convert the digit to an integer.
GET X = K.		check for rewind request.
TO 24 IF FLG X = 1.	if none, continue.
REWIND W.		else rewind the output channel.
PTR K = K + 7.		and advance the code body pointer.

LOC 24.
TO 31 IF VAL I = 2.	initiate block copying.
STO 9 = L.		terminate the current line.
PTR X = C + 0.		point to the start of the line.
TO 57 IF PTR C NE 9.	punch it if it exists.
PTR K = K + 7.
GET I = K.		get the next column.
TO 25 IF FLG I NE 1.	continue if this line is valid.
PTR K = K - 7.		else backspace the code body.
TO 23.

LOC 25.
PTR Z = VAL I.
PTR Z = Z - E.		subtract the character zero.
TO 28 IF PTR Z GE 5.	check for digit.
TO 28 IF PTR 0 GE Z.
VAL X = I + 0.		if so, save for future reference.
PTR Z = Z * 7.		compute the parameter location.
PTR Y = J + Z.		and grab its specification.
GET Y = Y.
TO 27 IF FLG Y = 3.	treat and undefined paramenter as void.
GET Z = Y.		pick up the first character.

LOC 26.
TO 27 IF VAL Y = 0.	is the parameter void, yes.
CHAR = VAL Z.		no, output the character.
GET Z = Z.		pick up the next character of the paramenter
VAL Y = Y - 1.		and drop the number remaining.
PTR K = K + 7.		advance the pointer.
GET I = K.		grab the next character of the code body.
TO 26 IF VAL I = X.	is it the same digit, yes.
TO 25.

LOC 27.			fill a field with spaces.
CHAR = VAL F.
PTR K = K + 7.
GET I = K.
TO 27 IF VAL I = X.
TO 25.

LOC 28.			copy a non-parameter to the output.
TO 57 IF FLG I = 1.	quit at the end of the line.
CHAR = VAL I.
PTR K = K + 7.		else advance along the code body.
GET I = K.
TO 25.

LOC 31.			check for alternate input unit.
GET I = A.		recall the channel spec.
TO 29 IF PTR C = 9.	if no alternate input unit, continue.
GET X = C.		else grab the unit number.
VAL I = X - E.		and convert it to an integer.
STO A = I.		change the current unit in store.
TO 29 IF PTR X = 9.	if no rewind request, continue.
REWIND I.		else perform the rewind.
TO 98 IF FLG I NE 0.	and quit unless all was okay.

LOC 29.			block copy from input to output.
GET X = V.		pick up the parameter specification.
TO 05 IF VAL X = 0.	no copying if parameter is void.
TO 05 IF FLG X = 3.	or undefined.
PTR Y = X + 0.		else set up the address of the first char.
READ NEXT I.		get the next line.
TO 98 IF FLG I NE 0.	get out unless all is okay.

LOC 30.			check for the terminator.
TO 05 IF VAL X = 0.	return if the match is complete.
VAL X = X - 1.		else decrement the character count.
GET Y = Y.		pick up the next terminator character.
VAL Z = CHAR.		and input character.
TO 30 IF VAL Y = Z.	if we are still matching, go on.
WRITE NEXT W.		else write the line.
TO 29 IF FLG W = 0.	and keep looking for the terminator if okay.
STOP.			else abnormal end.

LOC 33.			redefine a symbol.
GET Y = V.		name of the symbol to be redefined.
TO 23 IF FLG Y = 3.	error if parameter is undefined.
TO 05 IF VAL Y = 0.	ignore the null symbol.
GET X = Y.		pick up the first character.
FLG B = 2.		allow a symbol entry.
GET W = F.		set up the symbol tree.
PTR Z = F + 0.		set the tree pointer to the symbol root.
TO 58 BY B.		call on the scanner.
FLG B = 0.		reset the phase flag.
FLG W = Y.		save the definition flag.
PTR W = U + 0.		point to the definition pointer.
PTR Z = Y + 0.		set the symbol pointer.
PTR V = V + 7.		get the new definition of the symbol.
GET Y = V.
TO 23 IF FLG Y = 3.	error if parameter is undefined.
PTR X = Y + 0.		point to the first character of the
FLG Z = 1.		new definition. clear out the temporary
VAL Z = Y + 0.		set the new symbol length.
TO 35 IF FLG W NE 1.	was there a definition, no.
STO W = Z.		yes, store the new symbol length.
TO 05 IF VAL Y = 0.	is the definition void, no.

LOC 34.			insert the new definition in the old space.
GET X = X.		get the next definition character.
PTR W = Z + 0.		point to the next space.
GET Z = W.		grab the old contents of the space.
VAL Z = X + 0.		move the character into the space,
STO W = Z.		retaining the old pointer value.
VAL Y = Y - 1.		decrement the character count.
TO 35 IF PTR Z = 0.	is there more space available, no.
TO 34 IF VAL Y NE 0.	yes, is there more definition, yes.
TO 05.

LOC 35.			create the space for the definition.
PTR Z = 8 + 0.		point to the next available space.
STO W = Z.		put away the character.
PTR 8 = 8 + 7.		advance the pointer.
TO 97 IF PTR 8 GE 9.	and test for space overfill.
PTR W = Z + 0.		advance the character pointer.
GET Z = X.		grab the next definition character.
PTR X = Z + 0.		advance the definition pointer.
VAL Y = Y - 1.		decrement the character count.
TO 35 IF VAL Y NE L.	check for termination of the definition.
STO W = 0.		store the terminator if there is not more.
TO 05.

LOC 36.			compare two strings.
GET I = K.		pick up the condition code.
PTR K = K + 7.		bypass the next character.
GET Y = V.
PTR V = V + 7.
GET Z = V.
TO 23 IF FLG Y = 3.	error if parameter is undefined.
TO 23 IF FLG Z = 3.
PTR V = V + 7.		otherwise pick up the third argument.
TO 41 IF VAL Y NE Z.	could they be equal, no.
TO 38 IF VAL Y = 0.	two null strings are equal.
PTR X = Z + 0.		point x to the second string.

LOC 37.			compare the strings character by character.
GET X = X.		grab the next character of each string.
GET Y = Y.
TO 41 IF VAL X NE Y.	are they equal, no.
VAL Z = Z - 1.		yes, drop the number remaining.
TO 37 IF VAL Z NE 0.	are we done, no.

LOC 38.			the strings are equal.
TO 05 IF VAL I NE E.	is the condition code EQ, no.
TO 42.

LOC 39.			compare two expressions.
GET I = K.		pick up the condition code.
PTR K = K + 7.		bypass the next character.
GET Y = V.		first argument specification.
TO 23 IF FLG Y = 3.	error if parameter is undefined.
TO 74 BY P.		evaluate the first parameter.
PTR I = N + 0.		save the value of the first expression.
PTR V = J + 4.
GET Y = V.		set up the second parameter.
TO 23 IF FLG Y = 3.	error if parameter is undefined.
TO 74 BY P.		evaluate it.
PTR V = J + 4.
PTR V = V + 7.
PTR N = N - I.		compute the difference.
TO 38 IF PTR N = 0.	were the parameters equal, yes.
TO 40 IF PTR N GE 0.	no, was the second larger, yes.
TO 05 IF VAL I = O.	no, was the condition LT, yes.
TO 41.

LOC 40.			parameter 1 LT parameter 2.
TO 05 IF VAL I = N.	was the condition GT, yes.

LOC 41.			the strings are not equal.
TO 05 IF VAL I = E.	is the condition code EQ, yes.

LOC 42.			set up the skip counter.
GET Y = V.
TO 23 IF FLG Y = 3.	error if parameter is undefined.
TO 05 IF VAL Y = 0.	is it void, yes.
TO 74 BY P.		convert a possible expression.
PTR M = N + 0.		set the count.
TO 05.

LOC 43.			iterate under count control.
PTR Y = C - 9.		set up the specification of the
PTR Y = Y / 7.		current string.
VAL Y = PTR Y.		length in characters.
TO 07 IF VAL Y = 0.	if null, ignore it.
PTR Y = C + 0.		pointer to the first character.
TO 74 BY P.		evaluate the line as an expression.
FLG Y = 1.		set up the result as an iteration count.
VAL Y = 0 + 0.
PTR Y = N + 1.
STO C = R.		save the current iteration pointer.
PTR Z = R + 0.		prepare to restore it.
PTR R = C + 0.		set a new one.
PTR C = C - 4.
STO C = K.		save the current code body pointer.

LOC 44.			re-entry for another iteration.
PTR C = R + 0.		reset the text pointer.
PTR R = Z + 0.		reset the iteration pointer.
PTR Y = Y - 1.		decrement the iteration pointer.
TO 05 IF PTR 0 GE Y.	get out if no more are needed.
PTR R = C + 0.		else reset the iteration pointer.
PTR C = C - 7.
STO C = Y.		save the current count.
PTR C = C - 7.
GET K = C.		restore the code body pointer.
PTR C = C - 7.		new space for the next text line.
TO 05.

LOC 45.			iterate under context control.
STO 9 = L.		terminate the parameter string.
PTR W = C - 9.		specify the current string.
PTR W = W / 7.		compute its length in characters.
FLG W = 0.		flag for context controlled iteration.
VAL W = PTR W.		length in characters.
PTR W = C + 0.		pointer to the first character.
PTR 9 = 9 - 7.
FLG B = 2.		construct the tree for argument scanning.
PTR B = 0 + 0.		set up the parameter.
FLG U = 0.		set up the right paren.
VAL U = R + 0.
PTR U = 7 + 0.
FLG Z = 1.		end of line.
VAL Z = 0 + 0.		initialize the break count.
PTR Z = 0 + 0.
PTR X = 9 - 7.

LOC 46.			add break characters to the tree.
VAL Z = Z + 1.		bump the break count.
STO 9 = Z.		end of line.
PTR 9 = 9 - 7.
STO 9 = U.		right paren.
PTR 9 = 9 - 7.
STO 9 = B.		parameter flag.
PTR 9 = 9 - 7.
PTR K = K + 7.
GET I = K.		grab the next break.
PTR I = X - 9.		point to the alternative.
STO 9 = I.		current break character.
PTR X = 9 + 0.		save the current position for an alternative.
PTR 9 = 9 - 7.
TO 97 IF PTR 8 GE 9.
TO 46 IF FLG I NE 1.
STO 9 = B.		another parameter flag.
FLG B = 0.		reset the phase flag.
PTR Z = 9 + 0.		set up a pointer to the root location.
PTR 9 = 9 - 7.
VAL U = M + 0.		set up a left paren.
STO 9 = U.		tree root.
PTR 9 = 9 - 7.
STO 9 = R.		previous root pointer.
PTR 9 = 9 - 7.
STO 9 = C.		previous text pointer.
PTR 9 = 9 - 7.
STO 9 = V.		pointer to parameter store.
PTR 9 = 9 - 7.
STO 9 = Y.		original parameter spec.
PTR R = 9 - 7.		new repetition pointer.
STO R = Z.		new root pointer.
PTR 9 = R - 7.
STO 9 = W.		parameter remainder.
PTR 9 = 9 - 4.
STO 9 = K.		current text pointer.
PTR Z = Z - 7.		first time root pointer.
TO 48.

LOC 47.			reenter for next repetition.
TO 05 IF PTR R = 0.	if there is no repetition, get out.
GET Z = R.		else point the scanner to the root.

LOC 48.			first time entry point.
PTR U = R - 7.		remainder of the list.
GET Y = U.
TO 44 IF FLG Y = 1.	is this iteration under count control, yes.
TO 49 IF VAL Y = 0.	terminate the iteration on a null remainder.
STO U = 0.		else set up another scan.
PTR U = U - 4.
GET K = U.		reset the code body pointer.
PTR V = U + 0.		set up the stack pointer.
PTR 9 = U - 7.
PTR C = 9 + 0.		reset the text origin.
GET X = Y.		grab the first character and
TO 99 BY B.		go check for single character breakout.
PTR Y = R + 4.		get the address of the parameter
GET W = Y.		to be fiddled.
PTR Y = R - 4.		get the new value of the specification.
TO 97 IF PTR 8 GE Y.
GET Y = Y.
STO W = Y.		and put it in the parameter space.
TO 05.			continue with the code body.

LOC 99.			check and service single character splits.
TO 60 IF VAL Z NE 1.	if break characters used, go to the scanner.
FLG X = 0.		else pick off a single character.
VAL X = Y - 1.		drop the length of the parameter.
VAL Y = 1 + 0.		set the new parameter length to 1.
PTR U = U + 7.		save the new parameter specification.
STO U = Y.
PTR U = U + 7.		also save the remainder of the string.
STO U = X.
RETURN BY B.		return as though from the scanner.

LOC 49.			terminate the iteration.
TO 44 IF FLG Y = 1.	is this iteration under count control, yes.
PTR R = R + 7.
GET Y = R.		restore the original value of the
PTR R = R + 7.		parameter specification.
GET W = R.
STO W = Y.
PTR R = R + 7.
GET C = R.		restore the text pointer.
PTR R = R + 7.
GET R = R.
TO 05.

LOC 50.			define a macro.
FLG Y = 1.		mark it as defined.
VAL Y = L + 0.		line terminator.
PTR 8 = 8 - 7.		prepare for a spurious advance.
TO 54.			go get the mct.

LOC 51.			deal with an escape character.
VAL I = CHAR.		pick up the next character.
STO 8 = I.		assume that it is a special to be saved.
TO 52 IF VAL I = C.	if it really is an mct parameter or end-
TO 52 IF VAL I = D.	of-line flag, then go on to the next char.
VAL I = I - E.		else convert a possible digit character.
FLG Z = 3.		assume that it is a function call.
VAL Z = CHAR.		get the parameter conversion or function.
VAL Z = Z - E.		convert from a character to an interger.
PTR Z = VAL I.		put away the spec.
STO 8 = Z.
TO 52 IF PTR 0 GE Z.	if it is really a function, go on.
TO 52 IF PTR Z GE 5.
FLG Z = 2.		otherwise make it a parameter conversion.
PTR Z = Z * 7.		set up the relative addr of the parameter.
STO 8 = Z.

LOC 52.			process an mct line.
PTR 8 = 8 + 7.		advance the space pointer.
TO 97 IF PTR 8 GE 9.	have we run out of room, yes.
VAL I = CHAR.		read the next character.
STO 8 = I.		store it.
TO 51 IF VAL I = D.	is this an escape character, yes.
TO 53 IF VAL I = L.	recognize a carriage control.
TO 52 IF VAL I NE C.	no, was it an mct end-of-line, no.

LOC 53.
PTR Y = 8 + 0.		point to the current line terminator.
STO U = Y.		set up the previous terminator.
PTR U = 8 + 0.		update the terminator address.

LOC 54.			read and store a new MCT line.
GET I = A.		recall the channel specifier.
READ NEXT I.		grab the next line.
TO 98 IF FLG I NE 0.	get out unless all is okay.
VAL I = CHAR.		read the first character of a line.
PTR I = 0 + 0.		clean out the input register.
PTR 8 = 8 + 7.		advance the space pointer.
STO 8 = I.		put it away.
TO 51 IF VAL I = D.	was it a parameter flag, yes.
TO 52 IF VAL I NE C.	was it an end-of-line, no.
PTR Y = 8 + 0.		fill in the previous terminator.
STO U = Y.
STO 8 = 1.
PTR 8 = 8 + 7.		advance the space pointer.
TO 97 IF PTR 8 GE 9.	have we overrun the area, yes.
VAL I = CHAR.		get the next character.
TO 55 IF VAL I NE C.	did that close the definition phase, no.
FLG B = 0.		yes, reset the phase flag.

LOC 55.			common system return point.
RETURN BY D.		register D is the return address.

LOC 56.			punch an unrecognized line.
VAL W = 3 + 0.		channel 3 used when a line is not matched.
PTR X = C + 0.		address of the first character.

LOC 57.			loop to put out the characters.
GET X = X.		get the next one.
CHAR = VAL X.		move it into the line buffer.
TO 57 IF FLG X NE 1.	have we reached the end, no.
WRITE NEXT W.		yes, put it out on the designated channel.
TO 98 IF FLG W NE 0.	treat any error as fatal.
TO 55 IF VAL X = L.	else if the line is complete, return.
CHAR = VAL X.		else reprint the last character
TO 57.			and continue.

LOC 58.			try for an alternative match.
PTR Z = W + Z.		get the pointer to the alternative.
TO 60 IF PTR W NE 0.	was there one after all, yes.
TO 71 IF FLG B = 2.	no, are we defining, yes.

LOC 59.			try extending the previous parameter.
TO 70 IF PTR V GE 9.	is there one to extend, no.
GET Z = V.		recall the macro pointer.
GET Y = Q.		yes, recall the input pointer.
GET X = Y.		and the current character.
TO 63 IF FLG Z = 2.	is this the first time for a parameter, yes.
TO 64 IF FLG Z = 3.	no, is it a parameter extension, yes.
PTR V = Q + 7.		abandon the stack entry.
PTR Q = V + 7.

LOC 60.			try an alternative.
GET W = Z.		grab the macro character.
TO 69 IF FLG W = 1.	is this the end of the macro, yes.
TO 62 IF FLG W = 2.	no, is it a parameter, yes.
TO 58 IF VAL Y = 0.	no,is this the end of the input line, yes.
TO 58 IF VAL X NE W.	no, does the character match, no.
TO 61 IF PTR W = 0.	is there an alternative, no.
TO 61 IF FLG X = 3.	do not stack alternatives following a param.
TO 61 IF FLG B = 2.	do not stack alternatives during definition.
PTR Q = V - 7.
PTR V = Q - 7.
TO 97 IF PTR 8 GE V.
STO Q = Y.		save the input pointer.
PTR W = W + Z.		get the address of the alternative.
STO V = W.

LOC 61.
VAL Y = Y - 1.
PTR Y = X + 0.
GET X = X.		advance the input pointer.
PTR Z = Z + 7.		advance the macro pointer.
TO 60.			continue matching.

LOC 62.			set up a parameter if possible.
TO 61 IF FLG X = 2.	is this a parameter definition, yes.
TO 58 IF FLG B = 2.	no, could we need a parameter, no.
PTR Q = V - 7.		create an entry for the parameter.
PTR V = Q - 7.
TO 97 IF PTR 8 GE V.
STO Q = Y.
FLG Z = 2.		set up the parameter pointer.
STO V = Z.
FLG Z = 3.		don't stack further alternatives.
TO 58.

LOC 63.			first time entry for parameters.
FLG Z = 3.		set the parameter extension.
PTR Z = Z + 7.
STO V = Z.
PTR U = U + 7.		advance the param store extension.
FLG W = 0.
VAL W = 0 + 0.		set theparameter length to zero.
PTR W = Y + 0.		point it to the current input character.
STO U = W.
TO 60.

LOC 64.			extend the current parameter.
TO 68 IF VAL Y = 0.	can it be extended, no.
TO 68 IF VAL X = R.	fail on an unmatched closing paren.
GET W = U.		increase the parameter length.
VAL W = W + 1.
VAL Y = Y - 1.
PTR Y = X + 0.
TO 67 IF VAL X NE M.	is this an open paren, no.
VAL Z = 0 + 0.		yes, zero the paren count.

LOC 65.			obtain a balanced string.
VAL Z = Z + 1.		bump the parenthesis count.

LOC 66.
TO 68 IF VAL Y = 0.	fail if this is the end.
GET X = X.		grab the next input character.
VAL Y = Y - 1.
PTR Y = X + 0.
VAL W = W + 1.		else bump the parameter length.
TO 65 IF VAL X = M.	is it another open paren, yes.
TO 66 IF VAL X NE R.	no, is it a close paren, no.
VAL Z = Z - 1.		yes, drop the paren count.
TO 66 IF VAL Z NE 0.	continue if the count is nonzero.

LOC 67.			continue the scan.
GET X = X.		get the next input character.
STO Q = Y.		increment the input pointer.
STO U = W
TO 60.

LOC 68.			abandon the current paramter.
STO U = 3.		set the parameter undefined.
PTR U = U - 7.		drop the parameter store pointer back.
PTR V = Q + 7.		abandon the stack entry.
PTR Q = V + 7.
TO 59.			see if there are others to fall back on.

LOC 69.
TO 58 IF VAL Y NE 0.	is this a final match, no.
PTR U = Z + 7.		yes, point to the definition spec.
GET Y = U.

LOC 70.
RETURN BY B.		common return point for PTR B returns.

LOC 71.			routine to add macro definitions.
PTR W = 8 - Z.		create the alternate pointer.
STO Z = W.		change the current alternate.
TO 73 IF VAL Y = 0.	terminate the branch if this is the end.

LOC 72.			read the remainder of the template line.
VAL Y = Y - 1.
PTR Y = X + 0.
PTR X = 0 + 0.		reset the pointer of the current character.
STO 8 = X.		put it away.
PTR 8 = 8 + 7.		advance the space pointer.
TO 97 IF PTR 8 GE 9.	have we overrun the area, yes.
GET X = Y.		grab the next character.
TO 72 IF VAL Y NE 0.	was that the last, no.

LOC 73.			terminate the tree branch.
FLG X = 1.		set the macro terminator.
PTR X = 0 + 0.		set for no alternative.
STO 8 = X.
PTR U = 8 + 7.		set up a definition pointer.
FLG Y = 0.
PTR Y = U + 0.
STO U = Y.
PTR 8 = U + 7.		point to the first empty space.
TO 97 IF PTR 8 GE 9.
RETURN BY B.

LOC 74.			expression pointer.
PTR O = 9 + 0.		save the current top of free space.
VAL S = Y + 0.		set up the string specifier.
PTR S = Y + 0.
PTR T = 0 + 0.		initiale value of the expression is zero.
TO 75 IF VAL Y NE 0.	is the expression void, no.
PTR N = 0 + 0.		yes, itsvalue is zero.
RETURN BY P.

LOC 75.
VAL T = M + 0.		stack a left paren.

LOC 76.
TO 93 IF VAL S = 0.
GET X = S.		else grab the next.
PTR Y = S + 0.		point to a possible section start.
VAL Y = 0 + 0.		the string is initially empty.
TO 77 IF VAL X NE M.	is the character a left paren, no.
STO 9 = T.		yes, push the stack.
PTR 9 = 9 - 7.
TO 97 IF PTR 8 GE 9.
VAL S = S - 1.		drop the string length remaining.
PTR S = X + 0.		bump the pointer.
TO 75.

LOC 77.			specify a section.
TO 78 IF VAL X = N.	is this a plus, yes.
TO 78 IF VAL X = O.	minus.
TO 78 IF VAL X = P.	times.
TO 78 IF VAL X = Q.	divide.
TO 78 IF VAL X = R.	right paren.
VAL Y = Y + 1.		not an orerator, bump section length.
GET X = X.		grab the next character.
TO 77 IF VAL S NE Y.	is the string exhausted, no.
VAL X = R + 0.		yes, set up a right paren.
VAL S = S + 1.		pretend that it was in the input string.

LOC 78.
VAL J = X + 0.		set up the section operator.
PTR N = 0 + 0.		zero the accumulator.
VAL S = S - Y.		update the string pointer.
VAL S = S - 1.
PTR S = X + 0.
TO 83 IF VAL Y = 0.	a null string has the value zero.
GET X = Y.		grab first character of non-null string.
PTR U = VAL X.		check for a digit.
PTR U = U - E.
TO 79 IF PTR U GE 5.
TO 81 IF PTR U GE 0.

LOC 79.			if the first character is not a digit, look up.
PTR V = 9 + 7.		stack pointer for scanner.
GET W = F.		set up the symbol tree.
FLG Y = 0.		set the resulting symbol undefined.
PTR Z = F + 0.		set the tree pointer to the symbol root.
TO 58 BY B.		look up the symbol value.
TO 83 IF FLG Y NE 1.	an undefined symbol has the value zero.
TO 83 IF VAL Y = 0.	a null string has the value zero.
GET X = Y.		grab the first character of a non-null string.
FLG N = 1.		assume it is a minus sign
TO 82 IF VAL X = O.	and if it is go on to the next digit.
FLG N = 0.		else reset the sign to plus.
PTR X = Y + 0.		prepare for a spurious fetch.

LOC 80.			check the next character for digit.
GET X = X.		no, grab the next character.
PTR U = VAL X.		check for a digit.
PTR U = U - E.
TO 81 IF PTR U = 0.
TO 93 IF PTR U GE 5.
TO 93 IF PTR 0 GE U.

LOC 81.			uncorporate a digit into section value.
PTR N = N * 5.		multiply accumulator by 10.
PTR N = N + U.		add current digit.

LOC 82.
VAL Y = Y - 1.		drop the remaining length.
TO 80 IF VAL Y NE 0.	are we done, no.
TO 83 IF FLG N = 0.	is the accumulator negative, no.
FLG N = 0.		yes, reset the sign bit.
PTR N = 0 - N.		negate the contents.

LOC 83.			evaluate the current section.
TO 92 IF VAL J = R.	is the section operator a right paren, yes.
TO 90 IF VAL T = M.	no, is the stack operator a left paren, yes.
TO 89 IF VAL J = P.	no, is the section operator a times, yes.
TO 89 IF VAL J = Q.	no, is it a divide, yes.

LOC 84.			perform a pending operation.
TO 87 IF VAL T = Q.	is the operator a divide, yes.
TO 86 IF VAL T = P.	no, is it a times, yes.
TO 85 IF VAL T = O.	no, is it a minus, yes.
PTR T = T + N.		plus.
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
VAL T = J + 0.		reset the stack operator.
TO 76 IF VAL J NE R.	was the section operator a right paren, no.
PTR N = T + 0.		yes, keep evaluating.
PTR 9 = 9 + 7.		pop the stack.
GET T = 9.
TO 92.

LOC 89.			check precedence of stack operator.
TO 86 IF VAL T = P.	evaluate if the stack operator is times
TO 87 IF VAL T = Q.	or divide.

LOC 90.			stack a section.
STO 9 = T.		push the stack.
PTR 9 = 9 - 7.
TO 97 IF PTR 8 GE 9.
VAL T = J + 0.		set the operator
PTR T = N + 0.		and operand onto the stack.
TO 76.

LOC 91.			stack is empty.
TO 93 IF VAL S NE 0.	is the expression empty, no.
RETURN BY P.		yes, correct retrun.

LOC 92.
TO 84 IF VAL T NE M.	is the stack operator a left paren, no.
TO 91 IF PTR 9 = O.	yes, is the stack empty, yes.
PTR 9 = 9 + 7.		no, pop it up.
GET T = 9.
TO 92 IF VAL S = 0.	is there more in the expression, no.
GET X = S.		yes, grab the next character.
VAL S = S - 1.
PTR S = X + 0.
VAL J = X + 0.
TO 92 IF VAL J = R.	is the section operator a right paren, yes.
TO 83 IF VAL J = N.	no, is it a plus, yes.
TO 83 IF VAL J = O.	no, minus, yes.
TO 83 IF VAL J = P.	no, times, yes.
TO 83 IF VAL J = Q.	no, divide, yes.

LOC 93.			error in arithmetic expression.
MESSAGE EXPR TO 4.	issue an error message.
PTR N = 0 + 0.		zero out a possible skip count.
PTR 9 = O + 0.		reset the free space pointer.
TO 94 BY B.		call error traceback.
RETURN BY P.		continue with the line.

LOC 94.			provide traceback from error.
PTR X = C + 0.		first character of the string being built.
PTR Y = J + 0.		current parameter pointer.
TO 96 IF PTR 9 GE C.	is there a line being constructed, no.
STO 9 = L.		yes, terminate it.

LOC 95.			printing loop.
GET X = X.		grab the next character.
CHAR = VAL X.		move it to the line buffer.
TO 95 IF FLG X = 0.	are we done with the line, no.
WRITE NEXT 4.		yes, write it out.
TO 98 IF FLG 4 NE 0.	treat an error as fatal.
TO 96 IF VAL X = L.	if the line ended, fine.
CHAR = VAL X.		otherwise re-issue the ast character.
TO 95.			and keep outputting.

LOC 96.
TO 70 IF PTR Y = 0.	are there more, no.
PTR Y = Y - H.		yes, move back up the chain.
PTR X = Y - 7.
GET Y = Y.		previous parameter pointer.
GET X = X.		current text pointer.
TO 95.

LOC 97.			the working area has been overfilled.
MESSAGE FULL TO 4.	issue an error message.
TO 94 BY B.		call the error traceback.
STOP.

LOC 98.			an I/O error has occurred
MESSAGE IOCH TO 4.	issue the channel error message
TO 94 BY B.		and provide a traceback.
STOP.

END PROGRAM.
