module instr_mem #(parameter width = 32,
				   parameter depth = 32)(
	input [width - 1 :0] a,
	output [width -1 :0] rd
);

reg [width -1 :0]mem[0: depth -1];

initial begin
	mem[0] = 32'h20010005; // addi x1, x0, 5
	mem[1] = 32'h20020003; // addi x2, x0, 3
	mem[2] = 32'h00221820; // add  x3, x1, x2
	mem[3] = 32'h00000000;  // nop
	
	mem[4] = 32'h00000000;
    mem[5] = 32'h00000000;
    mem[6] = 32'h00000000;
    mem[7] = 32'h00000000;
	
	
end

assign rd = mem[a >> 2];

endmodule