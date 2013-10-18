README.txt -- stage2-1 contains 1st version made via simcmp, CRB, Jul 29, 2013

The purpose of this directory is to illustrate creation of a first version of
stage2 implemented via simcmp. Since simcmp is a simple macro processor with
limited features this first version of stage2 has no optimizations. The only
purpose of stage2-1 is to provide the full features of stage2 to create the
second optimized version: stage2-2.

Contents of this directory:
README.txt --	 this file
makefile --	 used to build files with GNU make
flb2yasm.scm --	 marcos for simcmp to translate flb to yasm
stage2.flb --	 source code for stage2 in flb (empty file, see below)
stage2.scm --	 flb2yasm.scm concatenated to stage2.flb for simcmp (empty)
stage2.asm --	 stage2 translated to x86 assembly language by simcmp
stage2.o --	 assembled object code for stage2 from yasm assembler
stage2.lst --	 yasm listing file for stage2.asm, useful for debugging
stage2 --  	 stage2 executable linked with grandios via gcc

README.txt
Describes the contents of this directory and how its contents can be used.

makefile
A default makefile for this directory to illustrate how its components can be
processed and combined to build a working first (unoptimized) version of the
Stage 2 macro processor.

stage2.flb
To create your own implementation of Stage 2 you obviously need your own copy
of the source code. Unfortunately that is not included here at the present
time. There are several ways you can get it, although none of them are
immediately convenient (see more below). Stage 2 was created by Professor
William M. Waite in the late sixties at the University of Colorado. He is now
retired (emeritus) but still has an office at CU Boulder (see
ecce.colorado.edu/~waite). I have written to him requesting permission, and an
appropriate license, to reproduce the stage2 source code and other components
of the Mobile Programming System here. In the meantime we will have to make do
with work-arounds.

flb2yasm.scm
This file is the set of simcmp macros to translate flb, also called first
language under bootstrap, to x86 assembly language for the yasm assembler. I
chose yasm (yet another assembler) because it is multi-pass and automatically
optimizes conditional jumps to short or long form depending on the distance to
the jump target location. The nasm (network assembler) formerly used was
two-pass and did not support this feature. The optimized jumps greatly improve
the speed and reduced size of the generated code. Because simcmp is a simple
text substitution processor there are no other optimizations performed.

stage2.scm
This file is the concatenation of flb2yasm.scm and stage2.flb ready for input
to simcmp. It is created by:
   make stage2.scm
or simply by using cat on the command line:
   cat flb2yasm.scm stage2.flb >stage2.scm
This file is currently empty because we do not (as yet) have permission to
provide stage2.flb.

stage2.asm
This file is the output of simcmp when it translates the stage2 source to x86
assembly language by:
   make stage2.asm
or, as you can see examining makefile, by running simcmp from the command line:
   simcmp stage2.scm stage2.asm
This file, stage2.asm, happens to contain the flb source code for stage2 as
embedded comments. Each comment begins with a semicolon character ";" in the
first column. So it is possible in principle to extract and reconstruct the 
source code for stage2 from this file, although it will not be very
informative because none of the explanatory comments from the original stage2
source will be included.

stage2.o
This file is the object code output of the yasm assembler. It is created by:
   make stage2.o
or by running yasm directly from the command line with:
   yasm stage2.asm -w -l stage2.lst -f elf32 -g stabs -o stage2.o
Note the yasm option switches used here:
   -w -- inhibits warning messages, omit this if warnings will be useful to you
   -l stage2.lst -- produces the listing file described below
   -f elf32 -- produces object format for 32-bit x86 compatible with gcc -m32
   -g stabs -- produces symbol table for debugging compatible with gdb and ddd
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
   gcc -m32 grandios.o stage2.o -g -o stage2
Note the option switches used here:
   -m32 -- produces a 32-bit executable file which works in either 32 or
   	   64-bit Linux systems using Intel or AMD x86 processors
   -g --   produces a debug executable compatible with gdb or ddd
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
There are several ways you can obtain the source code for Stage 2:
 1. Extract the comments from stage2.asm. Remove the leading semicolor ";" and
append a period "." at the end of end each line. Verify that the result is 985
lines beginning with "BEGIN STAGE2." to "END PROGRAM."
 2. See Waite's book Implementing Software for Non-Numeric Applications. A
complete guide to Stage 2 is in Appendix A.
 3. An archive of an implementation of Stage 2 is contained in Volume 51 of the
CP/M User Group. Google for cpmug051.ark to find a download mirror such as:
http://www.classiccmp.org/cpmarchives/cpm/mirrors/oak.oakland.edu/pub/cpmug/
This implementation is for Intel 8080 microprocessors running the CP/M
operating system. The .ark archive file can be unpacked with pkunpak.exe which
can be run under the MSDOS emulator dosemu in Linux. The Stage 2 source file
is stg2.flb. The pkunpak utility can be found at:
http://www.filewatcher.com/_/?q=pkunpak
 4. Write to Professor Waite or the University of Colorado ECEE Department and
ask for Stage 2 or the Mobile Programming System. That's how I got a copy on
7-track magnetic tape in 1970.

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