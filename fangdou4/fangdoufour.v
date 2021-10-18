module fangdoufour (
    input clk,
    input [3:0]key,
    output [3:0]led
);
   
   wire out0,out1,out2,out3,rst;
   assign rst=1'b1;

key_test k0(.button_in(key[0]),
            .button_out(out0),
            .button_posedge(),
            .button_negedge(),
            .clk(clk),
            .rst_n(rst)
            );

key_test k1(.button_in(key[1]),
            .button_out(out1),
            .button_posedge(),
            .button_negedge(),
            .clk(clk),
            .rst_n(rst)
            );

key_test k2(.button_in(key[2]),
            .button_out(out2),
            .button_posedge(),
            .button_negedge(),
            .clk(clk),
            .rst_n(rst)
            );

key_test k3(.button_in(key[3]),
            .button_out(out3),
            .button_posedge(),
            .button_negedge(),
            .clk(clk),
            .rst_n(rst)
            );

kongzhi z1(.key({out3,out2,out1,out0}),
           .led(led),
           .clk(clk)
            );
endmodule