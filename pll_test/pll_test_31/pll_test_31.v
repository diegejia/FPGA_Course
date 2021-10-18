module pll_test_31(
    input clk,
    input rst_n,
    output clk1,
    output clk2,
    output locked
);

pll p1(
    .inclk0(clk),
    .c0(clk1),
    .c1(clk2),
    .locked(locked),
    .areset(rst_n)
);
    
endmodule