`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 05:48:02 PM
// Design Name: 
// Module Name: control
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


module control(input clk,
    input [2:0] operation,
    output [4:0] clk_d
    );
    
    assign clk_d[0] = (operation==0)?clk:0;
    assign clk_d[1] = (operation==1)?clk:0;
    assign clk_d[2] = (operation==2)?clk:0;
    assign clk_d[3] = (operation==3)?clk:0;
    assign clk_d[4] = (operation==4)?clk:0;
endmodule
