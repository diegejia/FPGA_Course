module music (
    input clk;
    input key_in;
    input rst_n;
    output buzzer 
);
    parameter music_l = 32'd42;
    
    reg [1:0] state;
    reg [1:0] nextstate;
    reg [31:0] play_cnt;
    reg [31:0] music_cnt;
    reg [31:0] music_time;
    reg [19:0] hz_cnt;
    wire [19:0] cycle;
    wire [7:0] rom_yindiao;
    wire [7:0] rom_jiepai;


    
    
    parameter IDLE = 2'b00;
    parameter PLAY = 2'b01;
    parameter PLAY_WAIT = 2'b10;
    parameter PLAY_END = 2'b11;
    
    always @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)
        state <= IDLE;
        else
        state <= nextstate;
    end
     
   always @(posedge clk or negedge rst_n) begin
   case(state)
   IDLE:begin
       if(key_in == 1'b0)
       nextstate <= PLAY;
       else
       nextstate <= IDLE;  
   end

   PLAY:begin
       if(play_cnt == music_time)
       nextstate <= PLAY_WAIT;
       else
       nextstate <= PLAY;  
   end

   PLAY_WAIT:begin
       if(music_cnt == music_l - 1)
       nextstate <= PLAY_END;
       else
       nextstate <= PLAY;
   end

   PLAY_END:begin
       nextstate <= IDLE;
   end
   default:nextstate <= IDLE;
   endcase   
   end

   always @(posedge clk or negedge rst_n) begin
       if(rst_n == 1'b0)
       play_cnt <= 32'b0;
       else if(state == PLAY)
       play_cnt <= play_cnt + 32'b1;
       else
       play_cnt <= 32'b0;
   end

   always @(posedge clk or negedge rst_n) begin
       if(rst_n == 1'b0)
       music_cnt <= 32'b0;
       else if(state == PLAY_WAIT)
       music_cnt <= music_cnt + 32'b1;
       else if(state == IDLE || state == PLAY_END)
       music_cnt <= 32'b0;
   end

   always @(posedge clk or negedge rst_n) begin
       if(rst_n == 1'b0)
       music_time <= 32'b0;
       else
       music_time <= rom_yindiao * (50000000/8);
   end

   always @(posedge clk or negedge rst_n) begin
       if(rst_n == 1'b0)
       hz_cnt <= 20'b0;
       else if(state == PLAY || state == PLAY_WAIT)begin
           if(hz_cnt == cycle - 1)
           hz_cnt <= 20'b0;
           else
           hz_cnt <= hz_cnt + 20'b1;
       end
       else
       hz_cnt <= 20'b0;
   end

   always @(posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0)
        buzzer <= 1'b1 ;  
        else if (state == PLAY || state == PLAY_WAIT)begin
        if (hz_cnt < cycle/2)             
        buzzer <= 1'b0	;
	    else
	    buzzer <= 1'b1	;
        end
        else if (state == IDLE || state == PLAY_END)
        buzzer <= 1'b1 ;
   end

yindiao y1
(
 .hz_sel(rom_yindiao),
 .cycle(cycle) 
) ;
music1_rom m1
(
	.address(music_cnt[8:0]),
	.clock(clk),
	.q(rom_jiepai)
	);

music2_rom m2
(
	.address(music_cnt[8:0]),
	.clock(clk),
	.q(rom_yindiao)
	);

endmodule