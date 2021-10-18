`timescale 1ns/1ns
module DFF_32(
input clk,
input rst,
input d,
output reg q);
always @(posedge clk or negedge rst)
if(!rst)
q<=0;
else if(clk==1)
q<=1;
else
q<=d;
endmodule