module ledtest(
  input rst,
  input clk,
  output reg led 
 );
 reg [31:0]count;
  always@(posedge clk or negedge rst)begin
  if(rst==1'b0)
    count<=32'd0;
  else if(count==32'd49999999)
    count<=32'd0;
  else
	 count<=count+1'd1;
  end
  always@(posedge clk or negedge rst)begin
  if(rst==1'b0)
    led<=1'b0;
  else if(count==32'd49999999)
    led<=~led;
  else
    led<=led;
  end
  endmodule
  