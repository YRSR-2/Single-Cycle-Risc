`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 13:50:46
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu#(N=32)(
    input [N-1:0] A,
    input [N-1:0] B,
    input [3:0] ctrl,
    output reg [N-1:0] result,
    output [3:0] flags);
   // output [3:0] flags);
    //flags---->4 bit  |CARRY|no use|SIGN|ZERO|
    wire [32-1:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r12,r15;
    wire signed [32-1:0] A_signed,B_signed;
    assign A_signed = A;
    assign B_signed=B;
        /*
        0000-ADD
        0001-SUB
        0010-EQ Equal
        0011-NEQ not equal
        0100-AND
        0101-OR
        0110-NOT
        0111-XOR
        1000-SLL shift left logical
        1001-SRL shift right logical
        1010-SRA shift right arithematic
        1100-SLTU set less than  unsigned
        1111-SLT set less than
        */
    wire e1,e2,e3; //3 enable signals e1-Arithematic e2-logical e3-bitwise
    wire cout;//will store the carry
    /*
    assign e1=(ctrl[2:1]==(2'b00))?1'b1:1'b0; //Arithematic unit
    assign e2=(ctrl[2:1]==(2'b01))?1'b1:1'b0; //logical unit
    assign e3=(ctrl[2]==(1'b1))?1'b1:1'b0; //bit unit
    */
    
    /*assign {cout,r0}=A+B;
    assign r1=A-B;
    assign r2=(A==B)?1:0;
    assign r3=(A==B)?0:1;
    assign r4=A&B;
    assign r5=A|B;
    assign r6=~A;
    assign r7=A^B;*/
    
    assign {cout,r0}=A+B;                       // ADD
    assign r1=A-B;                       // SUB
    assign r2=(A==B);                    // EQ
    assign r3=(A!=B);                    // NEQ
    assign r4=A&B;                       // AND
    assign r5=A|B;                       // OR
   // assign r6=~A;                          // NOT
    assign r6=(A+B)&(~(32'd1));
    assign r7=A^B;                       // XOR
    assign r8=A<<B[4:0];                 // SLL
    assign r9=A>>B[4:0];                 // SRL
    assign r10=A_signed>>>B[4:0];         // SRA
    assign r12=(A<B);                     // SLTU
    assign r15=(A_signed<B_signed);              // SLT

    //assign r7={31'b0000000000000000000000000000000,r0[31]};//sign extension of sum
    
    assign flags[0]=(result==0)?1:0;
    assign flags[1]=result[31];
    assign flags[2]=0;  //waste bit
    assign flags[3]=cout;
    
    always @(*)
    begin
        case (ctrl)
        4'b0000: result=r0;
        4'b0001: result=r1;
        4'b0010: result=r2;
        4'b0011: result=r3;
        4'b0100: result=r4;
        4'b0101: result=r5;
        4'b0110: result=r6;
        4'b0111: result=r7;
        4'b1000: result=r8;
        4'b1001: result=r9;
        4'b1010: result=r10;
        4'b1100: result=r12;
        4'b1111: result=r15;
        default: result=r0;
    endcase               
    end                   
     
     
endmodule
