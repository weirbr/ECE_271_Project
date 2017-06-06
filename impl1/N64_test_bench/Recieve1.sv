module Recieve1(
	input logic Disable,
	input logic Data_In,
	input logic Enable,
	input logic clk,
	input logic Reset,
	output logic Data_Out
	);
	
	logic [1:0] State;
	logic [1:0] NextState;
	logic DataWire;
	
	assign Data_Out = DataWire;
	
	parameter s0 = 2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	parameter s3 = 2'b11;
	
	always_ff @ (posedge clk, negedge Reset)
		begin
			if(!Reset)
				State = s0;
			else
				State = NextState;
		end
	
	always_comb
		if(Enable && !Disable)
		begin
				case(State)
					s0: begin
						NextState = s1;
						DataWire = 1;
						end
					s1: begin
						NextState = s1;
						DataWire = 1;
						end
					s2: begin
						NextState = s1;
						DataWire = 1;
						end
				    s3: begin
						NextState = s1;
						DataWire = 1;
						end
					endcase
		end
endmodule