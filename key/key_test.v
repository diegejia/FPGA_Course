module  key_test
(  
   input clk,
 input rst_n,
 input key_in,
 output reg key_out
);
reg key;
integer count;
 
always @(posedge clk or negedge rst_n)
begin
if(rst_n==1'b0)
 key_out<=0;
 else if (count==49_999_999)
 key_out<=key_in;
end
 
 
 always @(posedge clk or negedge rst_n)
 begin
 if(rst_n==1'b0)
  count<=32'd0;
  else if (key==1)
  count=count+32'd1;
  else
  count<=32'd0;
 end


always @(posedge clk or negedge rst_n)
begin
if(rst_n==0)
key<=0;
else if(key == 0 && key_out != key_in)
key<=1;
else if(count==49_999_999)
key<=0;  
else key<=key;
end
endmodule

