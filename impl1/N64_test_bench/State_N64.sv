module State_N64(
	input clk,
	input Reset,
	input Data_Top_In,
	output Data_To_Send,
	output Data_To_Recieve,
	output Enable_Recieve,
	output Enable_Send
	);
	
	assign Data_To_Recieve = Data_Top_In;
	
	State_Machine_N64_Send_And_Recieve StateMachine(
	.clk(clk),
	.Reset(Reset),
	.Enable_Send(Enable_Send),
	.Enable_Recieve(Enable_Recieve),
	.Data_To_Send(Data_To_Send));
	


endmodule
	
	
	