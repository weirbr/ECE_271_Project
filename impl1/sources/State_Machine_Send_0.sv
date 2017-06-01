module State_Machine_Send_0(
		input logic Data_In,
		input logic Enable,
		input logic clk,
		input logic Reset,
		output logic Data_Out
		);


	logic [1:0] state;
	logic [1:0] nextState;
	parameter s0 = 2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	parameter s3 = 2'b11;
	
		
	always_ff @ (posedge clk, negedge Reset)
		if(!Reset)
			state = s0;
		else
			state = nextState;
			
	always_comb 
	begin
		if(Enable && !Data_In)
		begin
			case(state)
				s0: begin nextState = s1;
					Data_Out = 0; end
				s1: begin nextState = s2;
					Data_Out = 0; end
				s2: begin nextState = s3;
					Data_Out = 0; end
				s3: begin nextState = s0;
					Data_Out = 1; end
				default: nextState = s0;
			endcase
		end
		else nextState = s0;
	end	
endmodule