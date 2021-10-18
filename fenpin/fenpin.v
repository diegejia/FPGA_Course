module fenpin(
output reg clk_out,
input clk_in,
input rst
);
reg [3:0]cnt;
parameter n=6;


always @(posedge clk_in or negedge rst)
begin
if(!rst)
clk_out<=0;
else if(cnt==n/2-1)
clk_out<=!clk_out;
end


always @(posedge clk_in or negedge rst)
begin
if(!rst)
cnt<=0;
else if(cnt==n/2-1)
cnt<=0;
else
cnt<=cnt+1'b1;
end
endmodule
