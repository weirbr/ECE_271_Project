module Send0(
	input logic Data_Top_In,
	input logic Data_Bot_In,
	input logic en_in,
	input logic clk,
	input logic reset,
	output logic dis,
	output logic Data_Top_Out,
	output logic Data_Bot_Out
	);
	
	always_comb
	begin
		if(en_in && Data_Top_In)
			dis = 0;
		else if (en_in && Data_Top_In)
			dis = 1;
		else
			dis = 0;
	end
	
	assign en_out = en_in;
	assign Data_Bot_Out = Data_Bot_In;
	
	State_Machine_Send_0 stateMachine(
	.Data_In(Data_Top_In),
	.Enable(en_in),
	.clk(clk),
	.Reset(reset),
	.Data_Out(Data_Top_Out));
	
endmodule