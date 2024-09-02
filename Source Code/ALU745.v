`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 05:41:32 PM
// Design Name: 
// Module Name: ALU745
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


module ALU745(input clk,
    input [2:0] operation,
    input [31:0] A,
    input [31:0] B,
    output[31:0] Out,
    output equal_out,
    output greater_out,
    output lesser_out
    );
    
    wire [4:0] clk_d;
    wire [31:0] out_d [0:3];
    wire equal,greater, lesser;
    control cu(clk,operation,clk_d);
    MUL745 add(clk_d[0],0,A,B,out_d[0]);
    MUL745 sub(clk_d[1],1,A,B,out_d[1]);
    multiplier mult(clk_d[2],A,B,out_d[2]);
    div d(clk_d[3],A,B,out_d[3]);
    comparator com(clk_d[4],A,B,equal,greater, lesser);
    
    multiplexer mux(clk,operation,out_d[0],out_d[1],out_d[2],out_d[3],equal,greater, 
                        lesser,Out,equal_out,greater_out, lesser_out);
endmodule
