`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 11:19:11 AM
// Design Name: 
// Module Name: div
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


module div( input clk,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] Quotient
    );

    reg [23:0]man_a,man_b;
    

    reg [26:0]quot_half;
    reg [26:0]onez = 27'd67108864;
    reg [27:0]rep_sub[8:1];
    reg [2:0]multiplicant;
    always @(posedge clk)begin
        Quotient[31]=A[31]^B[31];
        man_a = {1'b1,A[22:0]};
        man_b = {1'b1,B[22:0]};
        
                
        rep_sub[1][27:0]=onez-1*man_b;
        rep_sub[2][27:0]=onez-2*man_b;
        rep_sub[3][27:0]=onez-3*man_b;
        rep_sub[4][27:0]=onez-4*man_b;
        rep_sub[5][27:0]=onez-5*man_b;
        rep_sub[6][27:0]=onez-6*man_b;
        rep_sub[7][27:0]=onez-7*man_b;
        rep_sub[8][27:0]=onez-8*man_b;
        if(rep_sub[1][27]==1) multiplicant = 0;
        else if(rep_sub[2][27]==1) 
            multiplicant = 1;
        else if(rep_sub[3][27]==1) 
            multiplicant = 2;
        else if(rep_sub[4][27]==1) 
            multiplicant = 3;
        else if(rep_sub[5][27]==1) 
            multiplicant = 4;
        else if(rep_sub[6][27]==1) 
            multiplicant = 5;
        else if(rep_sub[7][27]==1) 
            multiplicant = 6;
        else if(rep_sub[8][27]==1) 
            multiplicant = 7;
       
        quot_half=multiplicant*man_a;
        if(quot_half[26]) begin 
            Quotient[22:0]=quot_half[25:3]; 
            Quotient[30:23] = A[30:23]-B[30:23]+127;
        end
        else if(quot_half[25]) begin 
            Quotient[22:0]=quot_half[25:3]; 
            Quotient[30:23] = A[30:23]-B[30:23]+127-1;
        end
        else if(quot_half[24]) begin 
            Quotient[22:0]=quot_half[25:3]; 
            Quotient[30:23] = A[30:23]-B[30:23]+127-2;
        end
        else begin 
            Quotient[22:0]=quot_half[25:3]; 
            Quotient[30:23] = A[30:23]-B[30:23]+127-3;
        end
    end    
endmodule