`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 06:03:07 PM
// Design Name: 
// Module Name: multiplexer
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


module multiplexer(input clk,
    input [2:0] operation,
    input [31:0]out_d0,
    input [31:0]out_d1,
    input [31:0]out_d2,
    input [31:0]out_d3,
    input equal,greater,lesser,
    output reg [31:0] Out=0,
    output reg equal_out,greater_out, lesser_out

    );
    
    always @(out_d0,out_d1,out_d2,out_d3,equal,greater,lesser)begin
        if(operation==4)begin
            Out = 0;
            equal_out = equal;
            greater_out = greater;
            lesser_out = lesser;
        end
        else begin
            equal_out = 0;
            greater_out = 0;
            lesser_out = 0;
            if(operation==0)begin
                Out = out_d0;
            end
            else if(operation==1)
                Out = out_d1;
            else if(operation==2)
                Out = out_d2;
            else if(operation==3)
                Out = out_d3;
        end
    end
    
endmodule
