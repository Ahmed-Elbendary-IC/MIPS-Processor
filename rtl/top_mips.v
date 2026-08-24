module mips_top (
	input clk , rst , 
	output reg [31:0] alu_result,
	// output [31:0] read_data,
	output [31:0] pc_out,
	output [31:0] instr
	
);


wire w_zero; 
wire pcsrc;
wire [31:0] pcbranch;
wire reg_write , reg_dst , alu_src , branch , mem_write , mem_to_reg;
wire [2:0] alu_control ;
wire [31:0]signimm;
// wire [31:0] instr;
wire [4 :0] w_write_reg;
wire [31:0] w_srca;
wire [31:0] w_srcb;
wire [31:0] w_rd2;
wire [31:0] w_alu_result;
wire [31:0] read_data;
wire [31:0] result;
// wire [31:0] w_pc_out;
wire [31:0] w_pc_in;
wire [31:0] pc_plus4;
wire jump;


// assign branch = 1'b1;
assign pcsrc = branch & w_zero;
assign pcbranch = pc_plus4 + (signimm << 2);
assign w_write_reg = reg_dst ? instr[15:11] : instr[20:16];
assign w_srcb = alu_src ? signimm : w_rd2;
assign result = mem_to_reg ? read_data : w_alu_result;
assign pc_plus4 = pc_out + 4 ;
assign w_pc_in = pcsrc ? pcbranch : pc_plus4 ;

assign alu_result = w_alu_result;


//alu
alu alu_c(.alu_control(alu_control) , .srca(w_srca) , .srcb(w_srcb) , .alu_result(w_alu_result) , .zero(w_zero));

//sign_extension
sign_ext sign_ext_c(.sign_in(instr[15:0]) , .sign_out(signimm));

//register_file
reg_file reg_file_c(.clk(clk), .rst(rst) , .a1(instr[25:21]) , .a2(instr[20:16]) , .a3(w_write_reg) , .wd3(result) , .we3(reg_write),
					.rd1(w_srca),  .rd2(w_rd2));

//data_memory
data_mem data_mem_c(.clk(clk) , .wr_en(mem_write) , .wd(w_rd2) , .addr(w_alu_result) , .rd(read_data));

// pc
pc_32 pc_32_c(.clk(clk) , .rst(rst) , .pc_in(w_pc_in) , .pc_out(pc_out) );

//instr_memory
instr_mem instr_mem_c(.a(pc_out) , .rd(instr));

//control_unit
ctrl_unit ctrl_unit_c(
.opcode(instr[31:26]),
.funct(instr[5:0]),
.alu_control(alu_control),
.reg_write(reg_write) , 
.reg_dst(reg_dst) ,
.alu_src(alu_src) , 
.branch(branch) , 
.mem_write(mem_write) , 
.mem_to_reg(mem_to_reg),
.jump(jump)
);
endmodule