module data_mem_tb;
	reg  clk , we ; 
	reg [31:0] alu_result , rd2 ;
	wire [31:0] rd ;
	
data_mem data_mem_uut(
.clk(clk),
.wr_en(we),
.addr(alu_result),
.wd(rd2),
.rd(rd)
);

always #5 clk = ~clk;

initial begin
			clk = 0;  we = 0; rd2 =0 ; alu_result = 0;
			
			#10; we = 1; rd2 = 5; alu_result = 0; //write 5 in address 0
			#10; we = 0; alu_result = 0; // read from address 0
			
			#10; we = 1; rd2 = 32'd4 ; alu_result = 32'd3; //write 4 in address 3 
			#10; we = 0; alu_result = 32'd3; // read from address 3
			
			#10; we = 1; rd2 = 32'd9 ; alu_result = 32'd7; //write 9 in address 7 
			#10; we = 0; alu_result = 32'd7; // read from address 7
			
			#10; $finish;
 end
 
initial begin 
			$monitor("time=%0t | we =%d | rd2=%d | alu_result=%d | rd= %d" , $time , we , rd2 , alu_result , rd);
end 
 
 endmodule