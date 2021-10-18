library verilog;
use verilog.vl_types.all;
entity fanmaiji is
    generic(
        s0              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        s1              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        s2              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        s3              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        s4              : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0)
    );
    port(
        drink           : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        coin1           : in     vl_logic;
        coin2           : in     vl_logic;
        coin5           : in     vl_logic;
        change          : out    vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic;
        currentstate    : out    vl_logic_vector(2 downto 0);
        nextstate       : out    vl_logic_vector(2 downto 0);
        money           : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of s0 : constant is 1;
    attribute mti_svvh_generic_type of s1 : constant is 1;
    attribute mti_svvh_generic_type of s2 : constant is 1;
    attribute mti_svvh_generic_type of s3 : constant is 1;
    attribute mti_svvh_generic_type of s4 : constant is 1;
end fanmaiji;
