module kongzhi (
    input clk,
    input [3:0]key,
    output reg [3:0]led

);
    always @(posedge clk) begin
        led<=~key;
    end
endmodule