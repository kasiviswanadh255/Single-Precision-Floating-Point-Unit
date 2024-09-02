`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 10:19:02 AM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb(

    );
    reg clk;
    reg[2:0] operation;
    reg [31:0]A,B;
    
    wire [31:0] Out;
    wire equal,greater, lesser;
    
    ALU745 mut(clk,operation,A,B,Out,equal,greater, lesser);
    initial clk = 1;
    always #20 clk = !clk;
    initial 
    begin
    #200
        operation = 0;
        A = 32'b0_10000011_11111000000000000000000;
        B = 32'b0_01111110_10010000000000000000000;
    #80
        operation = 1;
        B = 32'b0_10000010_10010000000000000000000;
        A = 32'b0_10000000_01000000000000000000000;
    
     #80
     operation = 2;
    A = 32'b1_10000000_01000000000000000000000;
    B = 32'b0_10000010_01110110011001100110011;
    #80
    operation = 3;
    A = 32'b1_10000000_01000000000000000001110;
    B = 32'b0_10000010_01110110011001100110011;
    #80
    operation = 4;
    A = 32'b0_10000010_11000000000000000000000;
    B = 32'b0_10000001_11000000000000000000000;
    #80
    A = 32'b1_10000010_10000000000000000000000;
    B = 32'b1_10000000_00000000000000000000000;
    #80 $finish;
    end

endmodule
