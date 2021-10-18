module saomiao (
    input clk,
    input rst_n,
    input [23:0]jishu_out,
    output reg [5:0]sel,
    output reg [3:0]yima_in
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
        3'd0:yima_in<=jishu_out[3:0];
        3'd1:yima_in<=jishu_out[7:4];
        3'd2:yima_in<=jishu_out[11:8];
        3'd3:yima_in<=jishu_out[15:12];
        3'd4:yima_in<=jishu_out[19:16];
        3'd5:yima_in<=jishu_out[23:20];
        endcase
    end

endmodule