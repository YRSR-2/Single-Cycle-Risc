`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 11:53:01
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [31:0] in,
    input [3:0] flags,
    output LUI_Src,
    output isJALR,
    output isLUI,
    output regwrite,
    output [2:0] ImmSrc,
    output Memwrite,
    output [1:0] ResultSrc,
    output ALUSrc,
    output [3:0] alu_ctrl,
    output  PCSrc,
    output [4:0]lsunit);
    
    wire [1:0] ALUop;
    wire Branch;  //Branch variable tells 
                  //branch instruction or not 
    reg [3:0] a_ctrl;
    assign alu_ctrl=a_ctrl;
    
    main_decoder main_decoder(
    .in(in),
    .LUI_Src(LUI_Src),
    .isLUI(isLUI),
    .isJALR(isJALR),
    .regwrite(regwrite),
    .ImmSrc(ImmSrc),
    .Memwrite(Memwrite),
    .ResultSrc(ResultSrc),
    .ALUSrc(ALUSrc),
    .ALUop(ALUop),
    .Branch(Branch),
    .lsunit(lsunit));
    
   
     
         
    always @(*)
    begin
        if(ALUop==2'b00)
        a_ctrl=4'b0000;
        else if(ALUop==2'b01)
        begin
            if(in[14:12]==3'b000 || in[14:12]==3'b001)
            a_ctrl=4'd1;
            else if(in[14:12]==3'b100 || in[14:12]==3'b101)
            a_ctrl=4'd15;
            else if(in[14:12]==3'b110 || in[14:12]==3'b111)
            a_ctrl=4'd12;
            else
            a_ctrl=4'd0;
        end
        else if(ALUop==2'b10)
        begin
            if(in[14:12]==3'b000)    //ADD and SUB
            begin
                if({in[5],in[30]}==2'b11)
                a_ctrl=4'd1;
                else
                a_ctrl=4'd0;
            end
            else if(in[14:12]==3'b001) //SLL
            a_ctrl=4'd8;
            else if(in[14:12]==3'b010)  //SLT
            a_ctrl=4'd15;
            else if(in[14:12]==3'b011) //SLTU
            a_ctrl=4'd12;
            else if(in[14:12]==3'b100) //XOR
            a_ctrl=4'd7;
            else if(in[14:12]==3'b101) //SRL and SRA
            begin
                if(in[30]==1'b1)
                a_ctrl=4'd10;
                else
                a_ctrl=4'd9;
            end
            else if(in[14:12]==3'b110) //OR
            a_ctrl=4'd5;
            else if(in[14:12]==3'b111) //AND
            a_ctrl=4'd4;
        end
        else
        a_ctrl=4'd6;
    end
    
   wire sbranch;   //tells if successful branch or not 
   assign sbranch=(Branch==1'b0)?1'b0:
                  ((in[14:12]==3'b000 && flags[0]==1'b1) || 
                  (in[14:12]==3'b001 && flags[0]==1'b0) ||
                  (in[14:12]==3'b100 && flags[0]==1'b0) ||
                  (in[14:12]==3'b101 && flags[0]==1'b1) || 
                  (in[14:12]==3'b110 && flags[0]==1'b0) ||
                  (in[14:12]==3'b111 && flags[0]==1'b1))?1'b1:0;
                 
     assign PCSrc=(in[6:0]==7'b1101111 || (sbranch==1'b1) || in[6:0]==7'b1100111)?1'b1:1'b0;
                 //(in[6:0]==7'b1100111)?2'b10:2'b00;
    
    
endmodule
