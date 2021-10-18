module pwm_test 
#(parameter N = 32)
(
    input clk,
    input rst_n,
    input key_in,
    output buzzer
);
    parameter IDLE = 1'b0;
    parameter BUZZER = 1'b1;
    reg [N-1:0] duty1;
    reg [N-1:0] period1;
    reg [31:0] cnt;
    reg state;
    wire key_out;
    wire pwm_out;
    assign buzzer = ~(pwm_out & (state == BUZZER));
    always @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)begin
           cnt <= 32'd0;
           duty1 <= 32'd429_496_729;
           period1 <= 32'b0;
           state <= IDLE;
        end
        else begin
            case(state)
            IDLE:begin
                if(key_in == 1'b0)begin
                    state <= BUZZER;
                    duty1 <= duty1 + 32'd429_496_729; 
                end
            end
            BUZZER:begin
                if(cnt == 32'd12_499_999)begin
                   cnt <= 32'd0;
                   state <= IDLE;
                   period1 <= period1 + 32'd42_949;
                end
                else begin
                    cnt <= cnt + 32'd1;
                end     
            end
            default:
                state <= IDLE;
            endcase
        end 
    end

    key_test k1(
        .clk(clk),
        .rst_n(rst_n),
        .key_in(key_in),
        .key_out(key_out)
    );
    pwm p1(
        .period(period1),
        .duty(duty1),
        .clk(clk),
        .rst_n(rst_n),
        .pwm_out(pwm_out)
    );


endmodule