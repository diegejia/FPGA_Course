`timescale 1ns/1ns
module DFF_32_tb;
reg clk;
reg rst;
reg d;
wire q;
always
#10 clk=~clk;

DFF_32 D1(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

initial
rst=1;
clk=1;
#20 d=1;
#20 d=0;
#20 rst=0;
       d=0;
#20 d=1;
#100 $stop;
endmodule