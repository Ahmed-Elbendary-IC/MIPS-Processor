module data_mem #(parameter width = 32,
				//parameter width_addr = 8,
			      parameter depth = 32)(
	input wire clk , wr_en ,
	// input wire rst ,
	input wire [width - 1:0] wd,
	input wire [width -1 :0] addr,
	//input wire [width_addr -1 :0] addr_1,
	// output reg[width -1 :0] rd
	output [width -1 :0] rd	
);

reg [width -1 :0]mem[0: depth -1];

assign rd = mem[addr >> 2];

//always(posedge clk or negedge rst)
always@(posedge clk) 
	begin 
		//if(~rst)
			//rd <= 0;
			
		// for(i = 0 ; i < depth ; i = i + 1)
			// mem[i] <= 0;
			
		if (wr_en) begin
			mem[addr >> 2] <=  wd;
		//mem[addr_1] <=  wd;
			end 
		
	end
	


// wire w_rd;
// assign w_rd = mem[addr >> 2];
// assign rd = w_rd;
	
endmodule
	