// module ctrl_unit(
	// input [5 : 0] opcode,
	// input [5 :0] funct,
	// output [2 :0] alu_control,
	// output reg_write , reg_dst , alu_src , branch , mem_write , mem_to_reg
// );


// module main_decoder (
module ctrl_unit(
	input [5 : 0] opcode,
	input [5 :0] funct,
	output reg [2 :0] alu_control,
	output reg reg_write , reg_dst , alu_src , branch , mem_write , mem_to_reg , jump,
	output reg [1:0] alu_op
);



always @ (*) 
	begin
		case(opcode)
			6'b000000 : begin reg_write = 1 ; reg_dst = 1 ; alu_src = 0; branch = 0 ; mem_write = 0 ; mem_to_reg = 0; alu_op = 2'b10; jump =0; end // r-type
			6'b100011 : begin reg_write = 1 ; reg_dst = 0 ; alu_src = 1; branch = 0 ; mem_write = 0 ; mem_to_reg = 1; alu_op = 2'b00; jump =0; end // lw
			6'b101011 : begin reg_write = 0 ; reg_dst = 0 ; alu_src = 1; branch = 0 ; mem_write = 1 ; mem_to_reg = 0; alu_op = 2'b00; jump =0; end // sw
			6'b000100 : begin reg_write = 0 ; reg_dst = 0 ; alu_src = 0; branch = 1 ; mem_write = 0 ; mem_to_reg = 0; alu_op = 2'b01; jump =0; end // beq
			6'b001000 : begin reg_write = 1 ; reg_dst = 0 ; alu_src = 1; branch = 0 ; mem_write = 0 ; mem_to_reg = 0; alu_op = 2'b00; jump =0; end // addi
			6'b000010 : begin reg_write = 0 ; reg_dst = 0 ; alu_src = 0; branch = 0 ; mem_write = 0 ; mem_to_reg = 0; alu_op = 2'b00; jump =1; end // j
			default   : begin reg_write = 1 ; reg_dst = 1 ; alu_src = 0; branch = 0 ; mem_write = 0 ; mem_to_reg = 0; alu_op = 2'b00; jump =1; end 
		endcase
			
	end
	
always @(*) 
	begin
		if(alu_op == 00) 
			begin 
				alu_control = 3'b010;
			end
		else if (alu_op == 01)
			begin
				alu_control = 3'b110;
			end
		else if (alu_op == 10)
			begin
				case(funct)
					6'b100000 : alu_control = 3'b010;
					6'b100010 : alu_control = 3'b110;
					6'b100100 : alu_control = 3'b000;
					6'b100101 : alu_control = 3'b001;
					6'b100111 : alu_control = 3'b011;
					6'b101010 : alu_control = 3'b111;			
					default   : alu_control = 3'b100; // 4 => alu_result will go to default and equal (32'b0)
				endcase
			end
	end

endmodule

// module alu_decoder(
	// input [5:0] funct,
	// input [1:0] aluop,
	// output [2:0] alu_control
// );


// endmodule