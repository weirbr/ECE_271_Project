module Splitter(
	inout N64Data,
	input logic Data_In,
	input logic Toggle_In,
	output logic Data_Out);
	
	assign N64Data = Toggle_In ? Data_In : 'bZ;
	assign Data_Out = N64Data;
	
endmodule