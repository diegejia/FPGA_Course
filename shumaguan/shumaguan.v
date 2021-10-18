module shumaguan (
    input clk,
    input rst_n,
    output [7:0]shumaguan_out,
    output [5:0]sel
);
reg in0;
reg [31:0]cnt0;
always @(posedge clk or negedge rst_n) begin
    if(rst_n==1'b0)begin
        cnt0<=32'd0;
        in0<=1'b0;
    end
    else if(cnt0==32'd49_999_999)begin
        cnt0<=32'd0;
        in0<=1'b1;
    end
    else begin
        cnt0<=cnt0+32'd1;
        in0<=1'b0;
    end
end

wire in1;
wire [3:0]jishu_out1;
jishuqi j1(
    .clk(clk),
    .rst_n(rst_n),
    .in(in0),
    .j(in1),
    .out(jishu_out1)
);

wire in2;
wire [3:0]jishu_out2;
jishuqi j2(
    .clk(clk),
    .rst_n(rst_n),
    .in(in1),    
    .j(in2),
    .out(jishu_out2)
);

wire in3;
wire [3:0]jishu_out3;
jishuqi j3(
    .clk(clk),
    .rst_n(rst_n),
    .in(in2),                             
    .j(in3),
    .out(jishu_out3)
);

wire in4;
wire [3:0]jishu_out4;
jishuqi j4(
    .clk(clk),
    .rst_n(rst_n),
    .in(in3),                            
    .j(in4),
    .out(jishu_out4)
);

wire in5;
wire [3:0]jishu_out5;
jishuqi j5(
    .clk(clk),
    .rst_n(rst_n),
    .in(in4),                            
    .j(in5),
    .out(jishu_out5)
);

wire in6;
wire [3:0]jishu_out6;
jishuqi j6(
    .clk(clk),
    .rst_n(rst_n),
    .in(in5),
    .j(in6),                         
    .out(jishu_out6)
);

wire [7:0]yima_out1;
yimaqi y1(
    .in(jishu_out1),
    .out(yima_out1)
);

wire [7:0]yima_out2;
yimaqi y2(
    .in(jishu_out2),
    .out(yima_out2)
);

wire [7:0]yima_out3;
yimaqi y3(
    .in(jishu_out3),
    .out(yima_out3)
);

wire [7:0]yima_out4;
yimaqi y4(
    .in(jishu_out4),
    .out(yima_out4)
);

wire [7:0]yima_out5;
yimaqi y5(
    .in(jishu_out5),
    .out(yima_out5)
);

wire [7:0]yima_out6;
yimaqi y6(
    .in(jishu_out6),
    .out(yima_out6)
);             
saomiao s1(
    .clk(clk),
    .rst_n(rst_n),
    .saomiao_in1(yima_out1),
    .saomiao_in2(yima_out2),
    .saomiao_in3(yima_out3),
    .saomiao_in4(yima_out4),
    .saomiao_in5(yima_out5),
    .saomiao_in6(yima_out6),
    .saomiao_out(shumaguan_out),
    .sel(sel)
 );             
endmodule