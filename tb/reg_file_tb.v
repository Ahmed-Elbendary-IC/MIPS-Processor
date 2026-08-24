module reg_file_tb;
	
	reg [4:0] a1 , a2 , a3;
	reg [31:0] wd3;
	reg we3 , clk;
	wire [31:0] rd1 , rd2;
	
reg_file reg_file_uut(
.clk(clk),
.a1(a1),
.a2(a2),
.a3(a3),
.wd3(wd3),
.we3(we3),
.rd1(rd1),
.rd2(rd2)
);

always #5 clk = ~clk;

initial begin 
			clk = 0; we3 = 0; a1 = 5'd0 ; a2 = 5'd0 ; a3 = 5'd0;  wd3 = 32'd0;
			#10; we3 = 1; a3 = 5'd1 ; wd3 = 32'd5;
			#10; we3 = 0; a1 = 5'd1;
			#10; we3 = 1; a3 = 5'd2; wd3 = 32'd3;
			#10; we3 = 0; a1 = 5'd1; a2 = 5'd2;
			#10;
			$finish;
	end
	
initial begin $monitor("time =%0t, a1=%d, a2 =%d, rd1=%d, rd2=%d ",
						$time ,    a1   ,  a2   ,  rd1  , rd2 ); end
endmodule