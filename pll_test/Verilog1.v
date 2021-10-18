module pll_test (
    input clk,
    input rst_n,
    output clk1,
    output clk2,
    output clk3,
    output clk4
);
    wire locked;
    pll p1(
        .inclk0(clk),
        .c0(clk1),
        .c1(clk2),
        .c2(clk3),
        .c3(clk4),
        .areset(~rst_n),
        .locked(locked)
        );


    
endmodule