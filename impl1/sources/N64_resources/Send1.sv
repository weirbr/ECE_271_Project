module Send1(
	input logic Data_Top_In,
	input logic Data_Bot_In,
	input logic dis,
	input logic en_in,
	input logic clk,
	input logic reset,
	output logic Data_Top_Out,
	output logic Data_Bot_Out
	);
	
	
	logic ENABLE_STATE;
	
	assign Data_Bot_Out = Data_Bot_In;
	
	always_comb
	begin
		if(en_in && dis)
			ENABLE_STATE = 0;
		else if(en_in && !dis && Data_Top_In)
			ENABLE_STATE = 1;
	end
		
	State_Machine_Send_1 stateMachine(
	.Data_In(Data_Top_In),
	.Enable(ENABLE_STATE),
	.clk(clk),
	.Reset(reset),
	.Data_Out(Data_Top_Out));
		
	
endmodule