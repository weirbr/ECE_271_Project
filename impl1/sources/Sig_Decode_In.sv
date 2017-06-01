module Sig_Decode_In(
	input logic clk,
	input logic Reset,
	input logic Enable,
	input logic Data_In,
	output logic [1:0] Data_Out,
	output logic Enable_Out,
	output logic clk_Out
	);
	assign clk_out = clk;
	assign Enable_out = Enable;
	assign Data_Out = DataWire;
	
	logic [3:0] RegisterOut;
	logic [1:0] DataWire;
	
	always_comb
	begin
		if(RegisterOut[0] && RegisterOut[1] && RegisterOut[2] && !(RegisterOut[3] && Enable))
			DataWire = 2'b01;
		else if(RegisterOut[0] && !(RegisterOut[1]) && !(RegisterOut[2]) && !(RegisterOut[3] && Enable))
			DataWire = 2'b10;
		else
			DataWire = 2'b00;
	end
	
	Four_Bit_Register Shifter(
	.clk(clk),
	.Reset(Reset),
	.DataIn(Data_In),
	.DataOut(RegisterOut));
			
		
	
endmodule