# makefile -- for stage2 directory, CRB, Sep 25, 2002
# fiddled CRB, Jul 30, 2007
# newstg2 CRB, May 2, 2012
# reverse grandios.o stage2.o, Sep 29, 2012
# bring up to date for stage2-1 directory, Sep 14, 2013

grandios.o:
	echo "Copy grandios.o from the grandios directory"
	echo "for example:"
	echo "	  cp ../grandios/grandiosd.o ."

stage2.scm:	flb2yasm.scm stage2.flb
	cat flb2yasm.scm stage2.flb >stage2.scm

stage2.asm:	stage2.scm
	simcmp stage2.scm stage2.asm

stage2.o:	stage2.asm
	yasm stage2.asm -w -l stage2.lst -f elf32 -o stage2.o

stage2:		stage2.o grandios.o
	gcc -m32 grandios.o stage2.o -o stage2

stg2.s2m:	flb2yasm.s2m stage2.flb
	cat flb2yasm.s2m stage2.flb >stg2.s2m

test.scm:	flb2yasm.scm flbtest.flb
	cat flb2yasm.scm flbtest.flb >test.scm

test.asm:	test.scm
	simcmp test.scm test.asm

test.o:	test.asm
	yasm test.asm -l test.lst -f elf -g -o test.o

test:	test.o grandios.o
	gcc test.o grandios.o -g -o test

testst2t:	stage2 st2t.s2
	./stage2 st2t.s2 - st2t.3 st2t.4
