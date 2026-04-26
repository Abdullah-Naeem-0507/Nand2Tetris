// This file is part of www.nand2tetris.org \
// and the book "The Elements of Computing Systems" 
// by Nisan and Schocken, MIT Press. 
// File name: projects/4/Fill.asm 

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen, 
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP)
    @24576              //Checking for Key Press at RAM[24576]
    D=M
    @BLACKSCREEN        //If RAM[24576]=!0 GOTO BLACKSCREEN
    D;JNE
    @WHITESCREEN        //If RAM[24576]==0 GOTO WHITESCREEN
    D;JEQ

(BLACKSCREEN)
    @16384              //Start address of SCREEN
    D=A
    @R0                 //Storing it in R0(s)
    M=D
    (BLACKLOOP)
        @R0             //Setting RAM[s]=-1
        A=M
        M=-1
        @R0             //Incrementing s
        M=M+1
        D=M
        @24576          //Is Screen complete? 24576-s
        D=D-A
        @BLACKLOOP      //If 24576-s=!0 GOTO BLACKLOOP
        D;JNE
        @LOOP           //If 24576-s==0 GOTO LOOP
        0;JMP

(WHITESCREEN)
    @16384              //Start address of SCREEN
    D=A
    @R0                 //Storing it in R0(s)
    M=D
    (WHITELOOP)
        @R0             //Setting RAM[s]=0
        A=M
        M=0
        @R0             //Incrementing s
        M=M+1
        D=M
        @24576          //Is Screen complete? 24576-s
        D=D-A
        @WHITELOOP      //If 24576-s=!0 GOTO WHITELOOP
        D;JNE
        @LOOP           //If 24576-s==0 GOTO LOOP
        0;JMP
