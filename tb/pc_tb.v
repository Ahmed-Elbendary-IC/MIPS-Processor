module pc_top_tb;
    reg clk;
    reg rst;
    reg [31:0] pc_next;
	wire [31:0] pc_out;
    // assign pc_next = pc_out + 4;

always #5 clk = ~clk ;

initial begin 
			clk = 0; rst = 0; pc_next =32'd0;
			
			#10; rst = 1; pc_next = 32'd4;
			#10; pc_next = 32'd8;
			#10; pc_next = 32'd12;
			
			#20;
			$finish;
	end
	
initial begin 
			$monitor("time = %0t | pc_out = %h", $time , pc_out);
	end


    pc_32 pc_inst (
        .clk(clk),
        .rst(rst),
        .pc_in(pc_next),
        .pc_out(pc_out)
    );
endmodule