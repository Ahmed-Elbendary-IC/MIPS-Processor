module mips_top_tb;

reg clk , rst;
wire [31:0] alu_result , pc_out , instr ;

always #5 clk = ~clk;

initial begin 
	clk = 0;
	rst = 1;
	
	#5;
	rst = 0;
	
	#200;
	
	$finish;
end

initial begin
	$monitor ("time =%0t | pc =%h | alu_result = %h | instr=%h", $time , pc_out , alu_result , instr);
end

mips_top uut(
.clk(clk),
.rst(rst),
.alu_result(alu_result),
.pc_out(pc_out),
.instr(instr)

);
endmodule