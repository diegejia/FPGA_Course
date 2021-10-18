module pwm 
#(parameter N = 32)
(
    input [N-1:0] period,
    input [N-1:0] duty,
    input clk,
    input rst_n,
    output reg pwm_out
);
    reg [N-1:0] period_sum;

    always @(posedge clk or negedge rst_n) begin
        period_sum <=  period_sum + period;
        if(rst_n == 1'b0)begin
          period_sum <= 32'b0;
          pwm_out <= 1'b0;
        end
        else if(period_sum >= duty)
          pwm_out <= 1'b1;
        else
          pwm_out <= 1'b0;
        
    end
    
endmodule