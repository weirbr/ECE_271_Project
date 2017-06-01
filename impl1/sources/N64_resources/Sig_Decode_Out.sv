module Sig_Decode_Out(
	inout N64Data,
	input logic clk,
	input logic Reset,
	input logic Enable,
	input logic DataIn,
	output logic DataOut
	);
	
	logic Disable_One;
	logic Split_Bot_Out;
	logic Split_Top_In;
	logic One_Top_In;
	logic One_Bot_Out;
	
	Splitter split(
	.N64Data(N64Data),
	.Data_In(Split_Top_In),
	.Toggle_In(Enable),
	.Data_Out(Split_Bot_Out));
	
	Send0 Send_Zero_Right(
	.Data_Top_In(DataIn),
	.Data_Bot_In(One_Bot_Out),
	.en_in(Enable),
	.clk(clk),
	.reset(Reset),
	.dis(Disable_One),
	.Data_Top_Out(One_Top_In),
	.Data_Bot_Out(DataOut));
	
	Send1 Send_One_Left(
	.Data_Top_In(One_Top_In),
	.Data_Bot_In(Split_Top_Out),
	.dis(Disable_One),
	.en_in(Enable),
	.clk(clk),
	.reset(Reset),
	.Data_Top_Out(Split_Top_In),
	.Data_Bot_Out(One_Top_Out));

	
	
	
endmodule
	