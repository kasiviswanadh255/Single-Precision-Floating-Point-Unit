`timescale 1ns / 1ps

module comparator(
    input clk,
    input [31:0] A,
    input[31:0] B,
    output reg equal,
    output reg greater,
    output reg lesser
    );
    reg [31:0]sub;
    always @(posedge clk) begin
        if(A[31]^B[31]) begin
            equal = 0;
            greater = ~A[31];
            lesser = A[31];
         end
       else begin
         sub = A[30:0]-B[30:0];
         if(~(|sub))
            equal = 1;
          else if(sub[31])begin
            equal = 0;
            greater = (A[31]);
            lesser = ~A[31];
           end
          else if(~sub[31]) begin
            equal = 0;
            greater = ~(A[31]);
            lesser = A[31];
          end
          end
       end
endmodule