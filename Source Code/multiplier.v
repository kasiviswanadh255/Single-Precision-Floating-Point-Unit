`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2024 05:51:41 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(
    input clk,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] prod
    );
    reg [47:0] mant_comp;

    always @(posedge clk)begin
        if(A==0|B==0)
            prod=0;
        else begin
            prod[31] = A[31]^B[31];
            mant_comp = {1'b1,A[22:0]}*{1'b1,B[22:0]};
            if(mant_comp[47]==1)begin
                prod[22:0] =  mant_comp[46:24];
                prod[30:23] = A[30:23]+B[30:23]-8'd127+1'b1;
            end
            else begin
                prod[22:0] =  mant_comp[45:23];
                prod[30:23] = A[30:23]+B[30:23]-8'd127;
            end
        end
    end
endmodule
