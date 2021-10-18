library verilog;
use verilog.vl_types.all;
entity kongzhi is
    port(
        clk             : in     vl_logic;
        key             : in     vl_logic_vector(3 downto 0);
        led             : out    vl_logic_vector(3 downto 0)
    );
end kongzhi;
