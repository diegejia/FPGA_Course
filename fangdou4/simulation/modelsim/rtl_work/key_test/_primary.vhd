library verilog;
use verilog.vl_types.all;
entity key_test is
    generic(
        N               : integer := 32;
        FREQ            : integer := 50;
        MAX_TIME        : integer := 20
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        button_in       : in     vl_logic;
        button_posedge  : out    vl_logic;
        button_negedge  : out    vl_logic;
        button_out      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
    attribute mti_svvh_generic_type of FREQ : constant is 1;
    attribute mti_svvh_generic_type of MAX_TIME : constant is 1;
end key_test;
