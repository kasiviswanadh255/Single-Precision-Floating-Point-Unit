`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 11:23:44 AM
// Design Name: 
// Module Name: MUL745
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


module MUL745(
    input operation,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] out
    );
    
    reg [31:0] temp1,tempA,temp2,tempB;
    reg [23:0]shif_temp2m;
    reg [24:0]out_m = 0;
    reg [7:0]exp;
    reg [7:0]exp_diff;
    reg [4:0]i = 0,step = 0;
    reg step_lim = 0;
    always @(*)begin
        tempA = A;
        tempB = B;
        if(operation) begin
            tempB[31] = ~B[31];
        end
        temp1 = (B[30:0]>A[30:0])? tempB : tempA;
        temp2 = (B[30:0]>A[30:0])? tempA : tempB;
        
        if((temp1[31]!=temp2[31])&&temp1[30:0]==temp2[30:0])begin
            out = 0;
        end
        else begin
            exp = temp1[30:23];
            exp_diff = (temp1[30:23]-temp2[30:23]);
        
            shif_temp2m = ({1'b1,temp2[22:0]}>>exp_diff);
            out[31] = temp1[31];
            if(temp1[31]==temp2[31])begin
                
                out_m = {1'b1,temp1[22:0]}+shif_temp2m;
                out[22:0] = (out_m[24])? out_m[23:1]:out_m[22:0];
                out[30:23] = (out_m[24])? exp+1:exp;
            end
            else begin
                out_m = {1'b1,temp1[22:0]}-shif_temp2m;
                step=0;
                step_lim = 0;
                 for(i=0;i<25;i=i+1)begin
                if(out_m[24-i]==1 & step_lim == 0)begin
                    step_lim = 1;
                    step = i;
                    end
                end
               out[30:23]= exp-(step-1);
               out[22:0] = out_m<<(step-1);
            end
        end
    end
endmodule
