`timescale 1ns/1ns
module fanmaiji_tb();
reg [1:0]drink;
reg rst,clk;
reg coin1;
reg coin2;
reg coin5;
wire [2:0] change;
wire out;
wire [2:0] currentstate,nextstate;
wire [2:0] money;
always #10 clk=~clk;
initial
begin
coin1 = 1'b0;
coin2 = 1'b0;
coin5 = 1'b0;
rst=1'b0;
clk=1'b0;
#10 rst = 1'b1;
 drink = 2'b00;
#20 drink = 2'b010;
#10 coin5 = 1'b1;
#5 coin5 = 1'b0;
end
fanmaiji f1(drink,clk,rst,coin1,coin2,coin5,change,out,currentstate,nextstate,money);
endmodule