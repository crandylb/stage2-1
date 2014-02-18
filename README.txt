README.txt -- stage2-1 contains 1st version made via simcmp, CRB, Oct 19, 2013
01/18/2014 CRB Add LICENSE
01/27/2014 CRB Update stage2guide
02/17/2014 CRB Update stage2.flb re Waite's reply

The purpose of this directory is to illustrate creation of a first version of
stage2 implemented via simcmp. Since simcmp is a simple macro processor with
limited features this first version of stage2 has no optimizations. The only
purpose of stage2-1 is to provide the full features of stage2 to create the
second optimized version: stage2-2.

Contents of this directory:
README.txt --	 this file
makefile --	 used to build files with GNU make
debug -- 	 version of makefile to build debug version for gdb
flb2yasm.scm --	 marcos for simcmp to translate flb to yasm
stage2.flb --	 source code for stage2 in flb (see below)
getstg2.s2m --	 a set of stage2 macros to extract stage2 source from stage2.asm
stage2.scm --	 flb2yasm.scm concatenated to stage2.flb for simcmp (empty)
stage2.asm --	 stage2 translated to x86 assembly language by simcmp
stage2.o --	 assembled object code for stage2 from yasm assembler
stage2.lst --	 yasm listing file for stage2.asm, useful for debugging
stage2 --  	 stage2 executable linked with grandios via gcc
stage2guide.odt -- summary reference for stage2 and flb
stage2guide.pgf -- summary reference for stage2 and flb
LICENSE		 GPLv2

README.txt
Describes the contents of this directory and how its contents can be used.

makefile
A default makefile for this directory to illustrate how its components can be
processed and combined to build a working first (unoptimized) version of the
Stage 2 macro processor.

debug:
This is the version of makefile used to build a debug version of stage2 for
use with gdb (the Gnu debugging tool) or DDD (the graphical interface to gdb).
Use:
	make -f debug stage2.dbug.o
To build a debug version of stage2 object file. Note the -g stabs option in
the debug makefile that causes yasm to output the symbolic debugging
information used by gdb.
Use:
	make -f debug stage2.dbug
To build the debug executable of stage2. Note the -g option in the gcc command
that causes the gcc linker to load the symbolic debugging info, and be sure to
copy the grandios.dbug.o debug version of grandios from the grandios
directory.
Then use:
	gdb stage2.dbug
or
	ddd stage2.dbug
To run the debugging version. See the gdb or ddd documentation to setup the
command line arguments for the input and output files for stage2.

stage2.flb
To create your own implementation of Stage 2 you obviously need your own copy
of the source code. Stage 2 was created by Professor William M. Waite in the
late sixties at the University of Colorado. He is now retired (emeritus) but
still has an office at CU Boulder (see ecce.colorado.edu/~waite). I have
written to him requesting permission to reproduce the stage2 source code and
other components of the Mobile Programming System here. He has graciously
agreed, See his reply in full on my blog at crandylb.wordpress.com.

getstg2.s2m
This set of stage2 macros provides one way to obtain the source code for
stage2 from the stage2.asm file. The flb source statements are embedded in
stage2.asm as comments with a semicolon ";" in column one. The macros remove
the semicolon and append a period "." on each comment line restoring the
original stage2 algorithm. These macro can be run using the executable stage2
with this command line: stage2 getstg2.s2m <stage2.asm - stg2raw.flb Use wc to
verify that the output file stg2raw.flb has 985 lines beginning with "BEGIN
STG2." and ending with "END PROGRAM." Rename stg2raw.flb to stage2.flb to
build your own executable stage2 using make. This work-around provides a fully
complete implementation of stage2 but the lack of explanatory comments will
not make it easy to understand how it works.

flb2yasm.scm
This file is the set of simcmp macros to translate flb to x86 assembly
language for the yasm assembler. I chose yasm (yet another assembler) because
it is multi-pass and automatically optimizes conditional jumps to short or
long form depending on the distance to the jump target location. The nasm
(network assembler) formerly used was two-pass and did not support this
feature. The optimized jumps greatly improve the speed and reduced size of the
generated code. Because simcmp is a simple text substitution processor there
are no other optimizations performed.

stage2.scm
This file is the concatenation of flb2yasm.scm and stage2.flb ready for input
to simcmp. It is created by:
   make stage2.scm
or simply by using cat on the command line:
   cat flb2yasm.scm stage2.flb >stage2.scm

stage2.asm
This file is the output of simcmp when it translates the stage2 source to x86
assembly language by:
   make stage2.asm
or, as you can see examining makefile, by running simcmp from the command line:
   simcmp stage2.scm stage2.asm

stage2.o
This file is the object code output of the yasm assembler. It is created by:
   make stage2.o
or by running yasm directly from the command line with:
   yasm stage2.asm -w -l stage2.lst -f elf32 -o stage2.o
Note the yasm option switches used here:
   -w -- inhibits warning messages, omit this if warnings will be useful to you
   -l stage2.lst -- produces the listing file described below
   -f elf32 -- produces object format for 32-bit x86 compatible with gcc -m32
   -o stage2.o -- defines the name of the output file

stage2.lst
This is a listing file produced by yasm and is useful for debugging and to
show exactly what form of instructions were produced. For example you can
readily see which conditional jumps were optimized in short form, and how many
bytes were used in the instruction stream for operand data.

stage2
This is the executable file for the Stage 2 macro processor, with debugging
data included. It is produced using:
   make stage2
or by invoking gcc directly from the command line:
   gcc -m32 grandios.o stage2.o -o stage2
Note the option switches used here:
   -m32 -- produces a 32-bit executable file which works in either 32 or
   	   64-bit Linux systems using Intel or AMD x86 processors
   -o stage2 -- defines the name of the output file
Note that grandios.o, the I/O module, is linked before stage2.o and this order
is necessary because of the way code and data segments are negotiated between
the assembler and gcc linker. The stage2.o module declares a block of free
memory space (section .bss) and must be last in the load order.

What You Need
The following are not included here but may be obtained as described below:
stage2.flb -- the Stage 2 source code file
simcmp --     executable implementation of the Simple Compiler
grandios.o -- compiled object code of the I/O system and wrapper for stage2

stage2.flb
This is my version of the source code for the Stage 2 macro processor retyped
from Waite's text [1]. It is used here by permission from Prof. Waite and by
his declaration that Stage 2 and the Mobile Programming System are released to
the Public Domain. See my blog [2] for the full particulars.

simcmp
See the simcomp directory for an executable of the Simple Compiler. Or compile
your own version from the source code: simcmp.c. Professor Waite wrote the
original version of simcmp in Fortran and the version in the simcomp directory
is a direct translation of that program written in C. It should work with any
standard C compiler.

grandios.o
See the grandios directory for an implementation of the I/O system stage2
needs to interface to an operating system such as Linux or Unix. Grandios is
intended to be a full featured implementation of the I/O system model
Professor Waite included in Fortran for the Mobile Programming System.
Grandios has a very simple API to keep the interface to stage2 as simple as
possible. You can use the compiled object module grandios.o to link with
stage2.o, or compile your own from the source code files: grandios.c and
grandios.h.

stage2guide.odt and .pdf
This is a summry reference guide for Stage 2. It contains a breakdown of the
special characters on the flag line, which is the first line of input to Stage
2; a summary of the 32 statement forms of flb, the first language under
bootstrap; a summary of parameter conversions and processor functions used in
Stage 2 macros; and a brief summary of the Stage 2 template matching
algoritm. The .pdf version may work better for printing in landscape mode.

LICENSE
The GNU general public license applies to all files written by me except
the source code for Stage 2 called stage2.flb here.

References
[1] William M. Waite, Implementing Software for Non-Numeric Applications,
    1973. 
[2] Companion Blog at crandylb.wordpress.com.
