# makefile -- for stage2 directory, CRB, Sep 25, 2002
# fiddled CRB, Jul 30, 2007
# newstg2 CRB, May 2, 2012
# reverse grandios.o stage2.o, Sep 29, 2012

grandios.o:	grandios.c grandios.h
	gcc -c -g -m32 -DWITHMAIN grandios.c

stage2.scm:	flb2yasm.scm stage2.flb
	cat flb2yasm.scm stage2.flb >stage2.scm

stage2.asm:	stage2.scm
	simcmp stage2.scm stage2.asm

stage2.o:	stage2.asm
	yasm stage2.asm -w -l stage2.lst -f elf32 -g stabs -o stage2.o

stage2:		stage2.o grandios.o
	gcc -m32 grandios.o stage2.o -g -o stage2

stg2.s2m:	flb2yasm.s2m stage2.flb
	cat flb2yasm.s2m stage2.flb >stg2.s2m

stg2.asm:	stg2.s2m
	stg2 stg2.s2m - stg2.asm

stg2.o:		stg2.asm
	yasm stg2.asm -w -l stg2.lst -f elf32 -g stabs -o stg2.o

stg2:		stg2.o grandios.o
	gcc -m32 stg2.o grandios.o -g -o stg2

test.scm:	flb2yasm.scm flbtest.flb
	cat flb2yasm.scm flbtest.flb >test.scm

test.asm:	test.scm
	simcmp test.scm test.asm

test.o:	test.asm
	yasm test.asm -l test.lst -f elf -g -o test.o

test:	test.o grandios.o
	gcc test.o grandios.o -g -o test
