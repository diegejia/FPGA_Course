`timescale 1ns/1ns;
module pll_test_31_tb;
    reg clk;
    reg rst_n;
    wire clk1;
    wire clk2;
    wire locked;

    pll_test_31 p1(
        .clk(clk),
        .rst_n(rst_n),
        .clk1(clk1),
        .clk2(clk2),
        .locked(locked)
    );
    
    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        #300 rst_n = 1'b1;
        #1000 $stop;
    end

    always #10 clk = ~clk;

endmodule

    