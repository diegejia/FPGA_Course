module jishuqi (
    input rst_n,
    input clk,
    input in,
    output reg [3:0]out,
    output reg j
);
    always @(posedge clk or negedge rst_n) begin
        if (rst_n==1'b0) begin
            out<=4'h0;
            j<=1'b0;
        end
        else if(in) begin
            if(out==4'hf) begin
                out<=4'h0;
                j<=1'b1;
            end
            else begin
                out<=out+4'h1;
                j<=1'b0;
            end
        end
        else
            j<=1'b0;
    end
endmodule