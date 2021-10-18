module mianshi (
    output out
);

  reg [31:0] a;
  reg [31:0] b;
  reg [31:0] c;

  integer i;

always @(*) begin
    a <= 32'd0;b <= 32'd1;
    for(i = 0;i <= 17;i = i + 1)begin
        c = a + b;
        b = a;
        c = b;
    end
    out <= c;
end
endmodule