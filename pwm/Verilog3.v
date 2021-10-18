module pwm_tb 
#(parameter N = 16)
(
    input clk,
    input rst_n,
    input [N-1:0]duty,
    input [N-1:0]period,
    output pwm_out
);
reg clk;
reg rst_n;
reg [N-1:0]duty;
reg [N-1:0]period;
pwm p1(
    .clk(clk),
    .rst_n(rst_n),
    .duty(duty),
    .period(period),
    .pwm_out((pwm_out)
    );
    initial begin
        rst_n <= 1'b0;
        duty <= {16{1'b0}};
        period <= {16{1'b0}};
        #10 rst_n = 1'b1;
        duty <= {1'b1,15{1'b0}} 
    end
    
endmodule