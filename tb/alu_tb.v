module alu_tb;

	reg [31:0] srca , srcb;
	reg [2:0] select_alu;
	wire [31:0] alu_result;
	wire zero;
	
alu alu_uut	(
.srca(srca), 
.srcb(srcb),
.alu_control(select_alu),
.alu_result(alu_result),
.zero(zero)
);
	
	
//always #5 clk = ~clk;

initial begin 
			//clk = 0; srca = 0; srcb = 0; 
			 select_alu = 3'b010; srca = 32'd5 ; srcb = 32'd8 ;
		#10; select_alu = 3'b110; srca = 32'd5 ; srcb = 32'd3 ;
		#10; select_alu = 3'b000; srca = 32'd5 ; srcb = 32'd3 ;
		#10; select_alu = 3'b001; srca = 32'd5 ; srcb = 32'd7 ;
		#10; select_alu = 3'b011; srca = 32'd5 ; srcb = 32'd5 ;
		#10; select_alu = 3'b111; srca = 32'd9 ; srcb = 32'd8 ;
		#10; select_alu = 3'b111; srca = 32'd7 ; srcb = 32'd8 ;
		
		$finish;
end

initial begin
 $monitor("time =%0t ,select_alu = %b ,srca =%d , srcb=%d ,alu_result=%d , zero =%b ",
			$time,    select_alu ,     srca ,     srcb  ,  alu_result  , zero); end
endmodule