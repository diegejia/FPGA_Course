module yimaqi (
    input [3:0]in,
    output reg [7:0]out
);
    always @(*) begin
        case(in)
        4'h0:out<=8'b11000000;
        4'h1:out<=8'b11111001;
        4'h2:out<=8'b10100100;
        4'h3:out<=8'b10110000;
        4'h4:out<=8'b10011001;
        4'h5:out<=8'b10010010;
        4'h6:out<=8'b10000010;
        4'h7:out<=8'b11111000;
        4'h8:out<=8'b10000000;
        4'h9:out<=8'b10010000;
        4'ha:out<=8'b10001000;
        4'hb:out<=8'b10000011;
        4'hc:out<=8'b11000110;
        4'hd:out<=8'b10100001;
        4'he:out<=8'b10000110;
        4'hf:out<=8'b10001110;
        default:out<=8'b11111111;
        endcase
    end
endmodule