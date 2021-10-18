`timescale 1ns/100ps
module fenpin_tb;
reg clk_in; 
reg rst;  
wire clk_out; 

fenpin f1(
.clk_in(clk_in),
.rst(rst),
.clk_out(clk_out)
);

initial
begin
    #0 begin
       clk_in = 0;
       rst = 0;
       end
     #10
       rst = 1;
     #1000 $stop; 
end
always
begin
    #10 clk_in = ~clk_in;
end
endmodule