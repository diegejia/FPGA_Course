library verilog;
use verilog.vl_types.all;
entity fenpin is
    generic(
        n               : integer := 6
    );
    port(
        clk_out         : out    vl_logic;
        clk_in          : in     vl_logic;
        rst             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end fenpin;
