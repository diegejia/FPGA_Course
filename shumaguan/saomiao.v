module saomiao (
    input clk,
    input rst_n,
    input [7:0]saomiao_in1,
    input [7:0]saomiao_in2,
    input [7:0]saomiao_in3,
    input [7:0]saomiao_in4,
    input [7:0]saomiao_in5,
    input [7:0]saomiao_in6,
    output reg [5:0]sel,
    output reg [7:0]saomiao_out
);
    reg [2:0]cnt;
    reg [31:0]cnt1;
    always @(posedge clk or negedge rst_n) begin
        if(rst_n==1'b0)begin
            cnt<=3'd0;
            cnt1<=32'd0;
        end
        else if(cnt1==32'd49_999)begin
            cnt1<=32'd0;
            if(cnt==3'd5)
                cnt<=3'd0;
            else
                cnt<=cnt+3'd1;
        end
        else
        cnt1<=cnt1+32'd1;
    end
    
    always @(*) begin
        case(cnt)
        3'd0:sel<=6'b111_110;
        3'd1:sel<=6'b111_101;
        3'd2:sel<=6'b111_011;
        3'd3:sel<=6'b110_111;
        3'd4:sel<=6'b101_111;
        3'd5:sel<=6'b011_111;
        default:sel<=6'b111_111;
        endcase
    end

    always @(*) begin
        case(cnt)
        3'd0:saomiao_out<=saomiao_in1;
        3'd1:saomiao_out<=saomiao_in2;
        3'd2:saomiao_out<=saomiao_in3;
        3'd3:saomiao_out<=saomiao_in4;
        3'd4:saomiao_out<=saomiao_in5;
        3'd5:saomiao_out<=saomiao_in6;
        default saomiao_out<=8'b11_111_111;
        endcase
    end

endmodule