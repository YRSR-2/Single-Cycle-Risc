`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 16:01:41
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
    input [31:0] in,
    //output [2:0] ctrl_l,
    output  LUI_Src,
    output isLUI,
    output isJALR,
    output regwrite,
    output [1:0] ImmSrc,
    output Memwrite,
    output [1:0] ResultSrc,
    output ALUSrc,
    output [1:0] ALUop,
    output Branch,
    output [4:0] lsunit);
    
    //assign ctrl_l=in[14:12];
    /*
        0110111: LUI
        0010111: AUIPC
        1101111: JAL
        1100111: JALR
        0000011: Load
        0100011: Store
        1100011: Branch
        0010011: I type
        0110011: R type
    */
    assign lsunit[4]=(in[6:0]==7'b0000011 || in[6:0]==7'b0100011)?1:0;  //sets bit 4 to 1 if it is a valid load/store operation
    assign lsunit[3]=in[5];  // tells if aload  operation or a store operation. if 1 then store else load
    assign lsunit[2:0]=in[14:12];   //tells the type of load/store operation
    assign LUI_Src=in[5];  // tells which type of U instruction if 1 then LUI else AUIPC
    assign isJALR=(in[6:0]==7'b1100111)?1:0;   //if JALR instruction or not
    assign isLUI=(in[6:0]==7'b0110111 || in[6:0]==7'b0010111)?1'b1:1'b0;   //if U type or not
    assign regwrite=(in[6:0]==7'b1100011 || in[6:0]==7'b0100011)?0:1;
   /*assign ImmSrc=(in[6:0]==7'b0010011 || in[6:0]==7'b0000011 || in[6:0]==7'b1100111)?3'b000:
                  (in[6:0]==7'b0100011)?3'b001:
                  (in[6:0]==7'b1100011)?3'b010:
                  (in[6:0]==7'b1101111)?3'b011:
                  (in[6:0]==7'b0110111 || in[6:0]==7'b0010111)?3'b100: 3'b000;*/
    assign ImmSrc=(in[6:0]==7'b0100011)?2'b01:
                  (in[6:0]==7'b1100011)?2'b10:
                  (in[6:0]==7'b1101111)?2'b11:
                                   2'b00;
                  
    assign Memwrite=(in[6:0]==7'b0100011)?1:0;
    
    assign ResultSrc=(in[6:0]==7'b0000011)?2'b01:
                     (in[6:0]==7'b1101111 || in[6:0]==7'b1100111)?2'b10:2'b00;
                     //(in[6:0]==7'b0110111 || in[6:0]==7'b0010111)?2'b11:2'b00;
    assign ALUSrc=(in[6:0]==7'b0110111 || in[6:0]==7'b0010111 || 
                   in[6:0]==7'b1101111 || in[6:0]==7'b1100111 || in[6:0]==7'b0100011 || 
                   in[6:0]==7'b0000011 || (in[6:0]==7'b0010011 ))?1:0;
               
    assign Branch=(in[6:0]==7'b1100011)?1:0;
    
    assign ALUop=(in[6:0]==7'b1101111 || in[6:0]==7'b0000011 || in[6:0]==7'b0100011)?2'b00: //ADD
                 (in[6:0]==7'b1100011)?2'b01: //branch
                 (in[6:0]==7'b0010011 || in[6:0]==7'b0110011)?2'b10:
                 (in[6:0]==7'b1100111)?2'b11:2'b00;    //11 is for JALR
    
    
endmodule
