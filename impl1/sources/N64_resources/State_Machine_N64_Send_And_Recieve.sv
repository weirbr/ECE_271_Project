module State_Machine_N64_Send_And_Recieve(
	input clk,
	input Reset,
	output Enable_Send,
	output Enable_Recieve,
	output Data_To_Send
	);
	logic [7:0] RecieveCounter;
	logic [2:0] Count;
	logic [3:0] State;
	logic [3:0] Next_State;
	logic [2:0] OutputData;
	
	assign Enable_Send = OutputData[2];
	assign Enable_Recieve = OutputData[1];
	assign Data_To_Send = OutputData[0];
	parameter Sending = 4'b0000;
	parameter Recieving = 4'b0001;
	parameter Send1 = 4'b0011;
	parameter Send2 = 4'b0111;
	parameter Send3 = 4'b1111;
	parameter Send4 = 4'b1110;
	parameter Send5 = 4'b1100;
	parameter Send6 = 4'b1000;
	parameter Send7 = 4'b1010;
	parameter Send8 = 4'b0101;
	
	always_ff @ (posedge clk, negedge Reset)
		begin
			if(!Reset)
				begin
					Count <= 0;
					State <= Sending;
					RecieveCounter <= 0;
				end
			else begin
				if(State != Recieving)
					Count <= Count + 1;
				if(State == Recieving && RecieveCounter < 132)
					RecieveCounter <= RecieveCounter + 1;
				else if(RecieveCounter > 132)
					begin
						RecieveCounter <= 0;
						State <= Next_State;
					end
				else if(Count == 4 && State != Recieving)
					begin
						State <= Next_State;
						Count <= 0;
					end
			end
		end
		
	always_comb
		begin
			case(State)
				Sending: begin
						 Next_State = Send1;
						 OutputData = 3'b100;
						 end
				Send1:	 begin
						 Next_State = Send2;
						 OutputData = 3'b100;
						 end
				Send2:	 begin
						 Next_State = Send3;
						 OutputData = 3'b100;
						 end
				Send3:	 begin
						 Next_State = Send4;
						 OutputData = 3'b100;
						 end
				Send4:	 begin
						 Next_State = Send5;
						 OutputData = 3'b100;
						 end
				Send5:	 begin
						 Next_State = Send6;
						 OutputData = 3'b100;
						 end
				Send6:	 begin
						 Next_State = Send7;
						 OutputData = 3'b100; 
						 end
				Send7:	 begin
						 Next_State = Send8;
						 OutputData = 3'b101;
						 end
				Send8:	 begin
						 Next_State = Recieving;
						 OutputData = 3'b101;
						 end
				Recieving: begin
						 Next_State = Sending;
						 OutputData = 3'b010;
						 end
				default: begin Next_State = Sending; end
		endcase
	end

endmodule