library verilog;
use verilog.vl_types.all;
entity pll_test is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk1            : out    vl_logic;
        clk2            : out    vl_logic;
        clk3            : out    vl_logic;
        clk4            : out    vl_logic;
        locked          : out    vl_logic
    );
end pll_test;
