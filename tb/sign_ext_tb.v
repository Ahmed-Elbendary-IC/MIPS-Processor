module sign_ext_tb;

	reg [15:0] sign_in;
	wire [31:0] sign_out;
	
sign_ext sign_ext_uut(
.sign_in(sign_in),
.sign_out(sign_out)
);	

initial begin 
			sign_in = 16'h0005; //num.positive
			#10; sign_in = 16'hffff; //num.negative
			#10; sign_in = 16'h7fff; //num.positive
			#10; sign_in = 16'h8000; //num.negative
			#10;
			$finish;
end

initial begin 
			$monitor("time = %0t | sign_in = %h |sign_out = %h", $time , sign_in , sign_out);
	end
	
endmodule