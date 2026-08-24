module ctrl_unit_tb;

	reg [5:0] opcode;
	reg [5:0] funct ;
	wire [2:0]alu_control;
	wire reg_write , reg_dst , alu_src , branch , mem_write , mem_to_reg , jump;
	wire [1:0] alu_op;
	
ctrl_unit ctrl_unit_uut(
.opcode(opcode),
.funct(funct),
.alu_control(alu_control),
.alu_op(alu_op),
.reg_write(reg_write),
.reg_dst(reg_dst),
.alu_src(alu_src),
.branch(branch),
.mem_write(mem_write),  
.mem_to_reg(mem_to_reg),
.jump(jump)
);

initial begin 
			opcode =6'b000000; funct = 6'b000000; #10;
			opcode =6'b100011; funct = 6'b000000; #10;
			opcode =6'b101011; funct = 6'b000000; #10;
			opcode =6'b000100; funct = 6'b000000; #10;
			opcode =6'b001000; funct = 6'b000000; #10;
			opcode =6'b000010; funct = 6'b000000; #10;
			
			$finish;
			
			
	end

initial begin
        $monitor("Time = %0t | Opcode=%b | alu_control=%b | reg_write = %b |reg_dst = %b | alu_src =%b| branch =%b | mem_write =%b | mem_to_reg =%b | alu_op =%b | jump =%b ", 
                 $time,       opcode,      alu_control ,   reg_write,        reg_dst , alu_src,          branch,     mem_write,       mem_to_reg  , alu_op   ,  jump );
    end
endmodule