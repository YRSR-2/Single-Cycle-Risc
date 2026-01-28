`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2026 22:12:38
// Design Name: 
// Module Name: ls_unit
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


module ls_unit(in,lsunit,out,strobe,address);
    
    input [31:0] in,address;
    input [4:0] lsunit;
    output [31:0] out;
    output [3:0] strobe;
    
     
    
    assign out=(lsunit[4:3]==2'b10)?
               ((lsunit[2:0]==3'b000)?((address[1:0]==2'b00)?{{24{in[7]}},in[7:0]}:
                                   (address[1:0]==2'b01)?{{24{in[15]}},in[15:8]}:
                                   (address[1:0]==2'b10)?{{24{in[23]}},in[23:16]}:
                                   {{24{in[31]}},in[31:24]}):
               (lsunit[2:0]==3'b001)?((address[1]==1'b0)?{{16{in[15]}},in[15:0]}:
                                    {{16{in[31]}},in[31:16]}):
               (lsunit[2:0]==3'b010)?in:
               (lsunit[2:0]==3'b100)?((address[1:0]==2'b00)?{{24{1'b0}},in[7:0]}:
                                   (address[1:0]==2'b01)?{{24{1'b0}},in[15:8]}:
                                   (address[1:0]==2'b10)?{{24{1'b0}},in[23:16]}:
                                   {{24{1'b0}},in[31:24]}):
                                   ((address[1]==1'b0)?{{16{1'b0}},in[15:0]}:{{16{1'b0}},in[31:16]})):32'd0;
            //  (lsunit[2:0]==3'b101)?({{16{1'b0}},in[15:0]}):32'd0):32'd0;
               

    assign strobe=(lsunit[4:3]==2'b11)?
                  ((lsunit[2:0]==3'b000)?4'b0001:
                  (lsunit[2:0]==3'b001)?4'b0011:4'b1111):4'b1111;
               
endmodule
