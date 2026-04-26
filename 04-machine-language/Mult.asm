// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

@2              //Sets R2=0 which is used for Sum
M=0
@0              //Gets value of R0 for indexing(i)
D=M
@3              //Sets value of R3=i
M=D

(LOOP)
    @3              //Sets D=i
    D=M
    @END            //Checks is i==0
    D;JEQ
    @1              //Loads value of R1 in d
    D=M
    @2              //Sum=Sum+R1
    M=D+M
    @3              //i=i-1
    M=M-1
    @LOOP           //Jump to LOOP
    0;JMP
(END)













