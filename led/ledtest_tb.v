`timescale 1ns/1ns
module ledtest_tb;
  reg rst;
  reg clk;
  wire led;
 ledtest l1(.rst(rst),
            .clk(clk),
				.led[1](led)
);
always
#10 clk=~clk;
initial
begin
clk=0;
rst=0;
#30 rst=1;
end
endmodule
