library verilog;
use verilog.vl_types.all;
entity pwm is
    generic(
        N               : integer := 16
    );
    port(
        period          : in     vl_logic_vector;
        duty            : in     vl_logic_vector;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        pwm_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end pwm;
