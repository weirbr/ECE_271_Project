module Four_Bit_Register(
	input logic clk,
	input logic Reset,
	input logic DataIn,
	output logic [3:0] DataOut);
	
	logic [3:0] DataStored; 
	assign DataOut = ~DataStored;
	always_ff @ (negedge Reset)
		if(!Reset)
			DataStored = 4'b0000;
	
	always_ff @ (posedge clk) 
	begin
		DataStored[0] = DataIn;
		DataStored = DataStored << 1;
	end

	
endmodule