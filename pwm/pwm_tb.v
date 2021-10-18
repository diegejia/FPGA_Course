    `timescale 1ns/1ns;
module pwm_tb 
#(parameter N = 16);
reg clk;
reg rst_n;
reg [N-1:0]duty;
reg [N-1:0]period;
wire pwm_out;

pwm p1(
    .clk(clk),
    .rst_n(rst_n),
    .duty(duty),
    .period(period),
    .pwm_out(pwm_out)
    );
    initial begin
        clk <= 1'b0;
        rst_n <= 1'b0;
        duty <= {16{1'b0}};
        period <= {16{1'b0}};
        #10 rst_n = 1'b1;
            duty <= {1'b0,1'b1,{14{1'b0}}};
            period <= {{3{1'b0}},{13{1'b1}}};

        #500  duty <= {1'b1,{15{1'b0}}};
              period <= {{3{1'b0}},{13{1'b1}}};

        #500  duty <= {{2{1'b1}},{14{1'b0}}};
              period <= {{3{1'b0}},{13{1'b1}}};

        #500  duty <= {{2{1'b1}},{14{1'b0}}};
              period <= {{2{1'b0}},{14{1'b1}}};

    end

    always #10 clk <= ~clk;
    
endmodule