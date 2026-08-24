module insr_mem_tb;

	reg [32:0]a;
	wire [32:0]rd;
	
initial begin 
			a = 32'd0; #10;
			a = 32'd4; #10;
			a = 32'd8; #10;
			a = 32'd12; #10;
			$finish;
	end
	
initial begin 
		$monitor ("time =%0t | addr = %h | instr = %h" ,$time , a  , rd);
end
	
instr_mem instr_mem_uut(
.a(a),
.rd(rd)
);
endmodule