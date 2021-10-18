module Sync_FIFO #(
	//FIFO参数定义
	 parameter   data_width = Width,// FIFO宽度
     parameter   data_depth = Depth,// FIFO深度
     parameter   address_width = 8 // 地址宽度，对于深度为2^n的FIFO，需要的读/写指针位宽为(n+1)位，多的一位作为折返标志位
	)(
	//system signals
	input						clk,
	input						rst_n,
 
	input       				write_en,// 写使能，高有效
	input 	[data_width-1:0] 	data_in,// 写数据
	output 		 	  			full,//写满标志，高有效
	
	input 						read_en,// 读使能，高有效
	output reg [data_width-1:0] data_out,// 读数据
	output 		 	  			empty//读空标志，高有效
);
 
reg    [data_width-1:0] FIFO_RAM [data_depth-1:0];// RAM定义，用于存放FIFO数据
 
reg    [address_width:0]    wr_addr_p;//写地址指针
reg    [address_width:0]    rd_addr_p;//读地址指针
 
wire   [address_width-1:0]  wr_addr;//写RAM 地址
wire   [address_width-1:0]  rd_addr;//读RAM 地址
 
assign wr_addr = wr_addr_p[address_width-1:0];// 读写RAM地址等于读写指针的低address_width位
assign rd_addr = rd_addr_p[address_width-1:0];// 读写RAM地址等于读写指针的低address_width位
 
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		wr_addr_p <= 'h0;
		rd_addr_p <= 'h0;
		data_out <= 'h0;
	end
	else begin
		case({write_en,read_en})
			2'b00:begin// 不读不写
				wr_addr_p <= wr_addr_p;
				rd_addr_p <= rd_addr_p;
			end
			2'b10:if(~full) begin // 非满只写不读
				FIFO_RAM[wr_addr] <= data_in;
				wr_addr_p <= wr_addr_p + 1'b1;
			end
			2'b01:if(~empty) begin // 非空只读不写
				data_out <= FIFO_RAM[rd_addr];
				rd_addr_p <= rd_addr_p + 1'b1;
			end
			2'b11:if(~full && ~empty)begin // 非满非空又读又写
				FIFO_RAM[wr_addr] <= data_in;
				wr_addr_p <= wr_addr_p + 1'b1;
 
				data_out <= FIFO_RAM[rd_addr];
				rd_addr_p <= rd_addr_p + 1'b1;
			end
		endcase
	end
end
 
// 判断空满
assign full = (wr_addr_p == {~rd_addr_p[address_width],rd_addr_p[address_width-1:0]});// 最高位不同，其余各位相同
assign empty = (wr_addr_p == rd_addr_p);// 所有位都相同
endmodule
————————————————
版权声明：本文为CSDN博主「whustxsk」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_40230112/article/details/115140202