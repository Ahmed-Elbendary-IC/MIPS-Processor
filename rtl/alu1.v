module alu #(parameter width = 32,
			parameter control = 3)(
	input [width -1 :0] srca , srcb,
	input [control -1 :0] alu_control,
	output reg [width -1 :0] alu_result,
	output wire zero
);

// assign zero = (srca == srcb) ;
assign zero = ~|alu_result ;

always @(*) 
	begin
		case(alu_control)
			3'b000: alu_result = srca & srcb;
			3'b001: alu_result = srca | srcb;
			3'b010: alu_result = srca + srcb;
			3'b110: alu_result = srca - srcb;
			3'b011: alu_result = srca ^ srcb;
			3'b111: alu_result = (srca < srcb) ? 32'd1 : 32'd0;
			// 3'd5: alu_result = srca & srcb;
			// 3'd6: alu_result = srca | srcb;
			default: alu_result = 32'd0;
		endcase
	end
endmodule