module shumaguan3(
    input clk,
    input rst_n,
    output [7:0]shumaguan_out,
    output [5:0]sel
);

wire [3:0]jishu_out1;
wire [3:0]jishu_out2;
wire [3:0]jishu_out3;
wire [3:0]jishu_out4;
wire [3:0]jishu_out5;
wire [3:0]jishu_out6;

jishuqi j1(
    .clk(clk),
    .rst_n(rst_n),
    .count1(jishu_out1),
    .count2(jishu_out2),
    .count3(jishu_out3),
    .count4(jishu_out4),
    .count5(jishu_out5),
    .count6(jishu_out6)
);



wire [6:0]yima_out1;
yimaqi y1(
    .in(jishu_out1),
    .out(yima_out1)
);

wire [6:0]yima_out2;
yimaqi y2(
    .in(jishu_out2),
    .out(yima_out2)
);

wire [6:0]yima_out3;
yimaqi y3(
    .in(jishu_out3),
    .out(yima_out3)
);

wire [6:0]yima_out4;
yimaqi y4(
    .in(jishu_out4),
    .out(yima_out4)
);

wire [6:0]yima_out5;
yimaqi y5(
    .in(jishu_out5),
    .out(yima_out5)
);

wire [6:0]yima_out6;
yimaqi y6(
    .in(jishu_out6),
    .out(yima_out6)
);             
saomiao s1(
    .clk(clk),
    .rst_n(rst_n),
    .saomiao_in1({1'b0,yima_out1}),
    .saomiao_in2({1'b1,yima_out2}),
    .saomiao_in3({1'b0,yima_out3}),
    .saomiao_in4({1'b1,yima_out4}),
    .saomiao_in5({1'b0,yima_out5}),
    .saomiao_in6({1'b1,yima_out6}),
    .saomiao_out(shumaguan_out),
    .sel(sel)
 );             
endmodule