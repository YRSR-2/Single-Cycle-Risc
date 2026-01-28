`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 13:31:10
// Design Name: 
// Module Name: RISC_top_tb
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


module RISC_top_tb();

 reg clk,rst;
 wire [31:0] PC_next1,PC1; //PC
 wire [31:0] A_i1,RD_i1;  //instruction memory 
 wire [31:0] A11,A21,A31,WD31,RD11,RD21,WE31;   //Register file
 wire [31:0] operand11,operand21,alu_result1;  //ALU
 wire [31:0] alu_r1;
 wire [3:0] ctrl1,flags1;
 wire ALUSrc1;//,ALUControl1;
 wire WE1;   //data memory
 wire [31:0] A_d1,WD_d1,RD_d1;
 //wire [31:0] pc_target_jalr1;     //JALR wire to PC next mux
 wire [31:0] pc_plus1;       //pc+4 wire to PC next mux
 //wire [31:0] pc_target11;     //pc target/branch wire to PC next mux
 wire  [31:0] Imm_Ext1;   //Extension unit
 wire  [1:0] ImmSrc1;
 wire  LUISrc1;   
 wire isLUI1;          //LUI Unit
 wire isJALR1;
 wire [31:0] pc_target_jb1;
 wire  [31:0] lui_result1;
 wire   PCSrc1;            //PC mux
 wire  [31:0] result1;  //result mux
 wire  [1:0] ResultSrc1;
 wire  [31:0] in_l1,out_l1;   //load unit
// wire  [2:0] ctrl_l1;
 wire [3:0] strobe1;
RISC_top dut(
    .rst(rst),
    .clk(clk),
    .PC_next1(PC_next1),.PC1(PC1), //PC
    .A_i1(A_i1),.RD_i1(RD_i1),  //instruction memory 
    .A11(A11),.A21(A21),.A31(A31),.WD31(WD31),.RD11(RD11),.RD21(RD21),.WE31(WE31),   //Register file
    .operand11(operand11),.operand21(operand21),.alu_result1(alu_result1),  //ALU
    .alu_r1(alu_r1),
    .ctrl1(ctrl1),.flags1(flags1),
    .ALUSrc1(ALUSrc1),//.ALUControl1(ALUControl1),
    .WE1(WE1),   //data memory
    .A_d1(A_d1),.WD_d1(WD_d1),.RD_d1(RD_d1),
   // .pc_target_jalr1(pc_target_jalr1),     //JALR wire to PC next mux
    .pc_plus1(pc_plus1),       //pc+4 wire to PC next mux
   // .pc_target11(pc_target11),     //pc target/branch wire to PC next mux
    .Imm_Ext1(Imm_Ext1),    //Extension unit
    .ImmSrc1(ImmSrc1),
    .LUISrc1(LUISrc1),             //LUI Unit
    .isLUI1(isLUI1),
    .isJALR1(isJALR1),
    .pc_target_jb1(pc_target_jb1),
    .lui_result1(lui_result1),
    .PCSrc1(PCSrc1),            //PC mux
    .result1(result1),  //result mux
    .ResultSrc1(ResultSrc1),
    .in_l1(in_l1),.out_l1(out_l1),   //load unit
  //  .ctrl_l1(ctrl_l1),
    .strobe1(strobe1));
    
    
    initial 
    begin
    clk=1'b1;
    rst=1'b1;
    end
    
    always
    begin
    #5 clk=~clk;
    end
    
    initial
    begin
        #0 rst=1'b0;
        #32 rst=1'b1;
        #260 $finish;
    end
endmodule
