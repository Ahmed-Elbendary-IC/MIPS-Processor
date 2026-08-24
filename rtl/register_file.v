module reg_file #(parameter width = 32,
				 parameter depth = 32)(
	input clk , rst , we3,
	input [4:0] a1 , a2, a3 ,
	input [width - 1 :0] wd3,
	output [width - 1 :0] rd1, rd2
);

reg [width -1 :0] rf [0: depth -1];

assign rd1 = rf[a1];
assign rd2 = rf[a2];

integer i;

always@(posedge clk or posedge rst)
	begin
		if(rst)
			begin 
				for(i = 0 ; i < depth ; i = i +1)
					rf[i] <= 0;
				
			end
		else if(we3)
			begin 
				rf[a3] <= wd3 ;
			end
	end
	
endmodule