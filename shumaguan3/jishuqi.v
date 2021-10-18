module jishuqi
(input clk,
input rst_n,
output  reg [3:0] count1,
output  reg [3:0] count2,
output  reg [3:0] count3,
output  reg [3:0] count4,
output  reg [3:0] count5,
output  reg [3:0] count6
);
reg [31:0] count;
reg en1,en2,en3,en4,en5,en6,en7;
always @(posedge clk or negedge rst_n) begin
    if(rst_n==1'b0)begin
        count<=32'd0;
        en1<=1'b0;
    end
    else if(count==32'd49_999_99)begin
        count<=32'd0;
        en1<=1'b1;
    end
    else begin
        count<=count+32'd1;
        en1<=1'b0;
    end
end

always @(posedge clk or negedge rst_n)
 begin
 if (rst_n==1'b0)
  count1<=4'd0;
 else if (en1==1'b1)begin
    if(count1==4'd9)begin
      count1<=4'd0;
      en2<=1'b1;
    end
    else begin
      count1<=count1+4'd1;
      en2<=1'b0; 
    end
 end
 else
  en2<=0;
 end
 
 
 always @(posedge clk or negedge rst_n)
 begin
 if (rst_n==1'b0)
  count2<=4'd0;
 else if (en2==1'b1)begin
    if(count2==4'd5)begin
      count2<=4'd0;
      en3<=1'b1;
    end
    else begin
      count2<=count2+4'd1;
      en3<=1'b0; 
    end
    end
 else
  en3<=0;
 end

 
 always @(posedge clk or negedge rst_n)
 begin
 if (rst_n==1'b0)
  count3<=4'd0;
 else if (en3==1'b1)begin
    if(count3==4'd9)begin
      count3<=4'd0;
      en4<=1'b1;
    end
    else begin
      count3<=count3+4'd1;
      en4<=1'b0; 
    end
 end
 else
  en4<=0;
 end

 always @(posedge clk or negedge rst_n)
 begin
 if (rst_n==1'b0)
  count4<=4'd0;
 else if (en4==1'b1)begin
    if(count4==4'd5)begin
      count4<=4'd0;
      en5<=1'b1;
    end
    else begin
      count4<=count4+4'd1;
      en5<=1'b0; 
    end
 end
 else
  en5<=0;
 end
 
 always @(posedge clk or negedge rst_n)
 begin
 if (rst_n==1'b0)
  count5<=4'd0;
 else if (en5==1'b1)begin
    if(count5==4'd9)begin
      count5<=4'd0;
      en6<=1'b1;
    end
    else begin
      count5<=count5+4'd1;
      en6<=1'b0; 
    end
 end
 else
  en6<=0;
 end


  always @(posedge clk or negedge rst_n)
 begin
 if (rst_n==1'b0)
  count6<=4'd0;
 else if (en6==1'b1)begin
    if(count6==4'd5)begin
      count6<=4'd0;
      en7<=1'b1;
    end
    else begin
      count6<=count6+4'd1;
      en7<=1'b0; 
    end
 end
 else
  en7<=0;
 end
 
 endmodule
