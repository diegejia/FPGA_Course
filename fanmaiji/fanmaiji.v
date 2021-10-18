module fanmaiji (drink,clk,rst,coin1,coin2,coin5,change,out,currentstate,nextstate,money);
input [1:0]drink;
input rst,clk;
input coin1;
input coin2;
input coin5;
output  reg [2:0] change;
output reg out;
output reg [2:0] currentstate,nextstate;
output reg [2:0] money;
parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;

always @(posedge clk) begin
    money <= 3'd0;
    if(coin1)begin
        if(coin2)begin
            if(coin5)
            money <= money + 3'd8;
            else
            money <= money + 3'd3;
        end
        else begin
            if(coin5)
            money <= money + 3'd6;
            else
            money <= money + 3'd1;
        end
    end
    else begin
        if(coin2)begin
            if(coin5)
            money <= money + 3'd7;
            else
            money <= money + 3'd2;
        end
        else begin
            if(coin5)
            money <= money + 3'd5;
            else
            money <= money + 3'd0;
        end
     end

end


always @ (posedge clk or negedge rst)begin
if(rst==1'b0)
currentstate <= s0;
else
currentstate <= nextstate;
end

always @  (currentstate or coin1 or coin2 or coin5 or drink )
case (currentstate)
s0:begin
change <= 3'd0;
out <= 1'b0;
case(drink)
2'b00:nextstate <= s0;
2'b01:nextstate <= s1;
2'b10:nextstate <= s2;
2'b11:nextstate <= s3;
endcase
end
s1:begin 
   if(money >= 3'd2)
   nextstate <= s4;
   else 
   nextstate <= s1;

end
s2:begin
   if(money >= 3'd3)
   nextstate <= s4;
   else
   nextstate <= s2;
end

s3:begin
   if(money >= 3'd5)
   nextstate <= s4;
   else
   nextstate <= s3;
   end

s4:begin
    out <= 1'b1;
    case(drink)
    2'b01:begin
        change <= money - 3'd2;
        nextstate <= s0;
    end
    2'b01:begin
        change <= money - 3'd3;
        nextstate <= s0;
    end
    2'b01:begin
        change <= money - 3'd5;
        nextstate <= s0;
    end
    default:nextstate <= s0;
    endcase
end
endcase
endmodule
