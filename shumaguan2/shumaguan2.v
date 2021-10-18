module shumaguan2 (
    input clk,
    input rst_n,
    output [7:0]dig,
    output [5:0]sel
);
    reg in1;
    wire in2,in3,in4,in5,in6,in7;
    wire [3:0]out1,out2,out3,out4,out5,out6,yima_in;    
    reg [31:0]cnt0;
    always @(posedge clk or negedge rst_n) begin
        if(rst_n==1'b0)begin
            cnt0<=32'd0;
            in1<=1'b0;
        end
        else if(cnt0==32'd49_999_999)begin
            cnt0<=32'd0;
            in1<=1'b1;
        end
        else begin
            cnt0<=cnt0+32'd1;
            in1<=1'b0;
        end
    end
    jishuqi j1(.clk(clk),
               .rst_n(rst_n),
               .in(in1),
               .j(in2),
               .out(out1)
              );
    jishuqi j2(.clk(clk),
               .rst_n(rst_n),
               .in(in2),    
               .j(in3),
               .out(out2)
              );
    jishuqi j3(.clk(clk),
               .rst_n(rst_n),
               .in(in3),                             
               .j(in4),
               .out(out3)
              );
    jishuqi j4(.clk(clk),
               .rst_n(rst_n),
               .in(in4),                            
               .j(in5),
               .out(out4)
              );
    jishuqi j5(.clk(clk),
               .rst_n(rst_n),
               .in(in5),                            
               .j(in6),
               .out(out5)
              );
    jishuqi j6(.clk(clk),
               .rst_n(rst_n),
               .in(in6),
               .j(in7),                          
               .out(out6)
              );
    yimaqi y1(.in(yima_in),
              .out(dig)
              );
    saomiao s1(.clk(clk),
               .rst_n(rst_n),
               .jishu_out({out6,out5,out4,out3,out2,out1}),
               .yima_in(yima_in),
               .sel(sel)
              );             
endmodule