`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 15:07:28
// Design Name: 
// Module Name: RISC_top
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



//module RISC_top(
//    input rst,
//    input clk,
//    output [31:0] PC_next1,PC1, //PC
//    output [31:0] A_i1,RD_i1,  //instruction memory 
//    output [31:0] A11,A21,A31,WD31,RD11,RD21,WE31,   //Register file
//    output [31:0] operand11,operand21,alu_result1,  //ALU
//    output [31:0] alu_r1,
//    output [3:0] ctrl1,flags1,
//    output ALUSrc1,//ALUControl1,
//    output WE1,   //data memory
//    output [31:0] A_d1,WD_d1,RD_d1,
  
//    output [31:0] pc_plus1,       //pc+4 wire to PC next mux
  
//    output [31:0] Imm_Ext1,    //Extension unit
//    output [1:0] ImmSrc1,
//    output LUISrc1,             //LUI Unit
//    output isLUI1,
//    output isJALR1,
//    output [31:0] pc_target_jb1,
//    output [31:0] lui_result1,
//    output PCSrc1,            //PC mux
//    output [31:0] result1,  //result mux
//    output [1:0] ResultSrc1,
//    output [31:0] in_l1,out_l1,   //load unit
//    output [2:0] ctrl_l1,
//    output [3:0] strobe1
   
//    );
    
//   //............................Program Counter...............................................................................//         
    
    
//    wire [31:0] PC_Next;
//    wire [31:0] PC;
//    assign PC_next1=PC_Next;
//    assign PC1=PC;
//    program_counter program_counter(.clk(clk),.rst(rst),.PC_Next(PC_Next),
//    .PC(PC));
    
//    //........................Instruction Memory...............................................................
    
             
//    wire [31:0] A_i,RD_i;       
//                                    //A_i: Address given to instruction memory
//                                    //RD_i: Value read from that address in instruction memory
//    assign A_i=PC;
    
//    instruction_memory instruction_memory(.rst(rst),.A(A_i),.RD(RD_i));
//    assign RD_i1=RD_i;
//    assign A_i1=A_i;
    
    
//    //................................ Register File........................................................                
    
    
   
//    wire [4:0] A1,A2,A3;                    //3 ports for address input
//    wire [31:0] WD3,RD1,RD2;            //WD3: data that has to be written 
//                                        //RD1,RD2: read ports
//    wire WE3;                   //WE3: Write enable 
    
    
    
    
//    assign A1=RD_i[19:15];
//    assign A2=RD_i[24:20];
//    assign A3=RD_i[11:7];
    
//    assign A11=A1;
//    assign A21=A2;
//    assign A31=A3;
//    assign WD31=WD3;
//    assign RD11=RD1;
//    assign RD21=RD2;
//    assign WE31=WE3;
    
    
   
//    register_file register_file(.clk(clk),
//    .rst(rst),
//    .WE3(WE3),  //write enalbe for 3rd port
//    .A1(A1),
//    .A2(A2),
//    .A3(A3),
//    .WD3(WD3),   //data to be written
//    .RD1(RD1),  //port 1 for reading data at A1
//    .RD2(RD2));  //port 2 for reading data at A2
    
    
//    //...........................................ALU.......................................................
    
    
//    wire [31:0] operand1,operand2,alu_result;
//    wire [3:0] ctrl,flags;
//    wire ALUSrc; //control singals 
    
//            //ALUSrc: Control signal to select which value should go to operand 2 of ALU
//            //ctrl: To check which ALU operation should be performed 
    
//    wire [31:0] Imm_Ext;         //Gets the extended value obtained by using immediate values
    
//    assign operand1=RD1;
//    assign operand2=(ALUSrc==1)?Imm_Ext:RD2;
   
//    assign operand11=operand1;
//    assign operand21=operand2;
//    assign alu_result1=alu_result;
//    assign ctrl1=ctrl;
//    assign flags1=flags;
//    assign ALUSrc1=ALUSrc;
  
    
//    wire [31:0] alu_r;
//    assign alu_r1=alu_r;
//    alu alu(.A(operand1),.B(operand2),
//    .ctrl(ctrl),
//    .result(alu_r),.flags(flags));
    
   
   
//    //....................................data memory..................................................
    
//    wire WE;  //write enable control signal for data mememory
//    wire [31:0]A_d,WD_d;    
//    wire [31:0]RD_d;
//    assign A_d=alu_result;   //A_d gets the address from wehre data has to be read or where data has to be written
//    assign WD_d=RD2;         //WD_d gets the data that has tobe written
    
    
//    assign WE1=WE;         
//    assign A_d1=A_d;
//    assign WD_d1=WD_d;
//    assign RD_d1=RD_d;
    
//    wire [3:0] strobe;                  //strobe control helps in case of storing partial words
//    assign strobe1=strobe;
    
//   /* assign strobe=(RD_i[6:0]==7'b0100011)?
//                  ((RD_i[14:12]==3'b000)?4'b0001:
//                  (RD_i[14:12]==3'b001)?4'b0011:4'b1111):4'b1111; */ 
//    data_memory data_memory(.clk(clk),.rst(rst),.WE(WE),.WD(WD_d),.A(A_d),.RD(RD_d),.WSTRB(strobe));
    
    
    
//    //...........................plus4 ALU...........................................
//    wire [31:0] pc_plus;
//    assign pc_plus1=pc_plus;            
//    pc_adder pc_plus4(.a(PC),.b(32'd4),.c(pc_plus));   //calculation of pc+4
    
    
    
//    //............................Extension unit.......................
    
//    wire [1:0] ImmSrc;  //control signal for type of sign extension depending upon the Instruction type
//    wire isLUI;
//    assign isLUI1=isLUI;
//    assign Imm_Ext1=Imm_Ext;
//    assign ImmSrc1=ImmSrc;
    
//    sign_extend sign_extend(.In(RD_i),.Imm_Ext(Imm_Ext),.ImmSrc(ImmSrc),.isLUI(isLUI));
    
    
    
//    //....................branch PC ALU...............................
//    wire [31:0] pc_target_jb;
    
//    assign pc_target_jb1=pc_target_jb;
    
//    pc_adder pc_target1(.a(PC),.b(Imm_Ext),.c(pc_target_jb)); //for target address caclaution after jump/branch
    
//    //....................LUI.............................................
    
//    wire LUISrc; //control signal for type of LUI
//   // wire isLUI;   //is u type or not 
//    wire [31:0] lui_result;
    
//    assign LUISrc1=LUISrc;
//    assign lui_result1=lui_result;
//    assign lui_result=(LUISrc==1)?Imm_Ext:pc_target_jb; 
    
//    assign alu_result=(isLUI==1)?lui_result:alu_r;
    
//   //.............................jal and jalr unit
   
//   wire [31:0] pc_target;
//   wire isJALR;
//   assign isJALR1=isJALR;
//   assign pc_target=(isJALR==1)?alu_r:pc_target_jb;
   
   
//   //.............................PC MUX.......................................
   
//    wire PCSrc;   //control signal
//    assign PCSrc1=PCSrc;
    
//    assign PC_Next=(PCSrc==1'b0)?pc_plus:pc_target;
               
//    //............................Result Mux.........................
    
//    wire [31:0] result;
//    wire [1:0] ResultSrc;   //control unit signal for controlling which result should be selected for output 
//    wire [31:0] RD_dd;
//    assign result=(ResultSrc==00)?alu_result:(
//                  (ResultSrc==01)?RD_dd:pc_plus);
                 
                  
                  
//     assign result1=result;
//     assign ResultSrc1=ResultSrc;
    
   
    
    
    
    
//    //................load store unit....................
    
//    wire [4:0] lsunit; //control signal from control unit helps to decide if load/store,which type of load/store
//    wire [31:0] in_l,out_l;   //input output to load unit 
//    assign in_l=RD_d;
   
//    assign RD_dd=(lsunit[4:3]==2'b10)?out_l:RD_d;
//   // load_unit load_unit(.in(in_l),.load_src(ctrl_l),.out(out_l),.address(A_d));
   
    
//    assign in_l1=in_l;
//    assign out_l1=out_l;
//  //  assign ctrl_l1=ctrl_l;
//    ls_unit ls_unit(.in(in_l),.lsunit(lsunit),.out(out_l),.strobe(strobe),.address(A_d));
    
//     assign WD3=result;
  
    
    
    
//    wire [31:0]in;  //given as input to control unit
//    assign in=RD_i;  //instruction format given to decode to control unit 
    
    
//    control_unit control_unit(
//    .in(in),
//    .flags(flags),
//   // .ctrl_l(ctrl_l),
//    .LUI_Src(LUISrc),
//    .isLUI(isLUI),
//    .isJALR(isJALR),
//    .regwrite(WE3),
//    .ImmSrc(ImmSrc),
//    .Memwrite(WE),
//    .ResultSrc(ResultSrc),
//    .ALUSrc(ALUSrc),
//    .alu_ctrl(ctrl),
//    .PCSrc(PCSrc),
//    .lsunit(lsunit));
//endmodule

module RISC_top(
    input rst,
    input clk,

    // ===================== DEBUG OUTPUTS =====================
    // Program Counter
    output [31:0] PC_next1, PC1,

    // Instruction Memory
    output [31:0] A_i1, RD_i1,

    // Register File
    output [31:0] A11, A21, A31, WD31, RD11, RD21, WE31,

    // ALU
    output [31:0] operand11, operand21, alu_result1, alu_r1,
    output [3:0]  ctrl1, flags1,
    output        ALUSrc1,

    // Data Memory
    output        WE1,
    output [31:0] A_d1, WD_d1, RD_d1,
    output [3:0]  strobe1,

    // PC logic
    output [31:0] pc_plus1,
    output        PCSrc1,

    // Immediate / LUI / Jumps
    output [31:0] Imm_Ext1,
    output [1:0]  ImmSrc1,
    output        LUISrc1,
    output        isLUI1,
    output        isJALR1,
    output [31:0] pc_target_jb1,
    output [31:0] lui_result1,

    // Writeback
    output [31:0] result1,
    output [1:0]  ResultSrc1,

    // Load-Store Unit
    output [31:0] in_l1, out_l1
);

    // =========================================================
    // PROGRAM COUNTER
    // =========================================================
    wire [31:0] PC, PC_Next;

    assign PC1      = PC;
    assign PC_next1 = PC_Next;

    program_counter program_counter (
        .clk(clk),
        .rst(rst),
        .PC_Next(PC_Next),
        .PC(PC)
    );

    // =========================================================
    // INSTRUCTION MEMORY
    // =========================================================
    wire [31:0] A_i, RD_i;

    assign A_i  = PC;
    assign A_i1 = A_i;
    assign RD_i1 = RD_i;

    instruction_memory instruction_memory (
        .rst(rst),
        .A(A_i),
        .RD(RD_i)
    );

    // =========================================================
    // REGISTER FILE
    // =========================================================
    wire [4:0]  A1, A2, A3;
    wire [31:0] RD1, RD2, WD3;
    wire        WE3;

    assign A1 = RD_i[19:15];
    assign A2 = RD_i[24:20];
    assign A3 = RD_i[11:7];

    assign A11  = A1;
    assign A21  = A2;
    assign A31  = A3;
    assign RD11 = RD1;
    assign RD21 = RD2;
    assign WD31 = WD3;
    assign WE31 = WE3;

    register_file register_file (
        .clk(clk),
        .rst(rst),
        .WE3(WE3),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD3(WD3),
        .RD1(RD1),
        .RD2(RD2)
    );

    // =========================================================
    // IMMEDIATE EXTENSION
    // =========================================================
    wire [31:0] Imm_Ext;
    wire [1:0]  ImmSrc;
    wire        isLUI;

    assign Imm_Ext1 = Imm_Ext;
    assign ImmSrc1 = ImmSrc;
    assign isLUI1  = isLUI;
    
    /*
    
    */
    
    
    sign_extend sign_extend (        
        .In(RD_i),
        .Imm_Ext(Imm_Ext),
        .ImmSrc(ImmSrc),
        .isLUI(isLUI)
    );

    // =========================================================
    // ALU
    // =========================================================
    wire [31:0] operand1, operand2, alu_r, alu_result;
    wire [3:0]  ctrl, flags;
    wire        ALUSrc;

    assign operand1 = RD1;
    assign operand2 = (ALUSrc) ? Imm_Ext : RD2;

    assign operand11    = operand1;
    assign operand21    = operand2;
    assign alu_r1       = alu_r;
    assign alu_result1  = alu_result;
    assign ctrl1        = ctrl;
    assign flags1       = flags;
    assign ALUSrc1      = ALUSrc;

    alu alu (
        .A(operand1),
        .B(operand2),
        .ctrl(ctrl),
        .result(alu_r),
        .flags(flags)
    );

    // =========================================================
    // DATA MEMORY
    // =========================================================
    wire        WE;
    wire [31:0] A_d, WD_d, RD_d;
    wire [3:0]  strobe;

    assign A_d  = alu_result;
    assign WD_d = RD2;

    assign WE1   = WE;
    assign A_d1  = A_d;
    assign WD_d1 = WD_d;
    assign RD_d1 = RD_d;
    assign strobe1 = strobe;

    data_memory data_memory (
        .clk(clk),
        .rst(rst),
        .WE(WE),
        .WD(WD_d),
        .A(A_d),
        .RD(RD_d),
        .WSTRB(strobe)
    );

    // =========================================================
    // PC + 4
    // =========================================================
    wire [31:0] pc_plus;

    assign pc_plus1 = pc_plus;

    pc_adder pc_plus4 (
        .a(PC),
        .b(32'd4),
        .c(pc_plus)
    );

    // =========================================================
    // BRANCH / JUMP TARGET
    // =========================================================
    wire [31:0] pc_target_jb, pc_target;
    wire        isJALR;

    assign pc_target_jb1 = pc_target_jb;
    assign isJALR1       = isJALR;

    pc_adder pc_target1 (
        .a(PC),
        .b(Imm_Ext),
        .c(pc_target_jb)
    );

    assign pc_target = (isJALR) ? alu_r : pc_target_jb;

    // =========================================================
    // LUI
    // =========================================================
    wire        LUISrc;
    wire [31:0] lui_result;

    assign LUISrc1     = LUISrc;
    assign lui_result1 = lui_result;

    assign lui_result = (LUISrc) ? Imm_Ext : pc_target_jb;
    assign alu_result = (isLUI) ? lui_result : alu_r;

    // =========================================================
    // PC SELECTION
    // =========================================================
    wire PCSrc;

    assign PCSrc1 = PCSrc;
    assign PC_Next = (PCSrc) ? pc_target : pc_plus;

    // =========================================================
    // LOAD-STORE UNIT
    // =========================================================
    wire [4:0]  lsunit;
    wire [31:0] in_l, out_l;
    wire [31:0] RD_dd;

    assign in_l  = RD_d;
    assign in_l1 = in_l;
    assign out_l1 = out_l;

    assign RD_dd = (lsunit[4:3] == 2'b10) ? out_l : RD_d;

    ls_unit ls_unit (
        .in(in_l),
        .lsunit(lsunit),
        .out(out_l),
        .strobe(strobe),      //strobe signal helps to decide which bytes need to be store din data memory in store operation
        .address(A_d)
    );

    // =========================================================
    // WRITEBACK
    // =========================================================
    wire [31:0] result;
    wire [1:0]  ResultSrc;

    assign result =
        (ResultSrc == 2'b00) ? alu_result :
        (ResultSrc == 2'b01) ? RD_dd :
                               pc_plus;

    assign WD3 = result;

    assign result1    = result;
    assign ResultSrc1 = ResultSrc;

    // =========================================================
    // CONTROL UNIT
    // =========================================================
    control_unit control_unit (
        .in(RD_i),
        .flags(flags),
        .LUI_Src(LUISrc),  //control signal to mux to select between lui and auipc
        .isLUI(isLUI),    //control signal to select between the lui result and alu_r result 
        .isJALR(isJALR),  //control singal to tell if the instruction is JALR or not
        .regwrite(WE3),   //enable signal to register file
        .ImmSrc(ImmSrc),   //to select which type of sign extension to do 
        .Memwrite(WE),    //write enable to data memory
        .ResultSrc(ResultSrc),   //select between the different types of final result  
                                 /* 00-ALU result
                                    01-data read from data memory
                                    10-PC+4
                                 */
        .ALUSrc(ALUSrc),      //to select which one should go to alu between the Rd2 and immediate extension
        .alu_ctrl(ctrl),      //to select which alu operation to do
        .PCSrc(PCSrc),        //to select which PC value should to PC
        .lsunit(lsunit)       //5 bit value 
                              /* bit 4-whether a valid load/store operation or not
                                 bit 3- zero if load operation and 1 if store operation
                                 bit2:0- tells the type of load/store operation
                                 */
    );

endmodule