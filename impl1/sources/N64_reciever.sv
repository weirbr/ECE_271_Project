module N64_reciever (
			inout N64_in,
			input logic Reset,
			output logic [11:0] N64_out);
			
			logic clk_i;
			logic clk_slow;
			logic DataOutToStateBig;
			logic DataStateBigToSender;
			logic DataStateBigToReciever;
			logic [1:0] DataRecieverToShifter;
			logic EnableToSender;
			logic EnableToReciever;
			logic EnableRecieverToShifter;
			logic ClockRecieverToShifter;
			

			
			OSCH #("14.00") osc_int (					
					.STDBY(1'b0),			
					.OSC(clk_i),				
					.SEDSTDBY());
					
			clock_slow slow_it_down_baby (
					.clk_i(clk_i),
					.clk_o(clk_slow));
			
			
			Sig_Decode_Out ImActuallyAnEncoderButWhatever(
			.N64Data(N64_in),
			.clk(clk_slow),
			.Reset(Reset),
			.Enable(EnableToSender),
			.DataIn(DataStateBigToSender),
			.DataOut(DataOutToStateBig)
			);
			
			State_N64 StateMachineBig(
			.clk(clk_slow),
			.Reset(Reset),
			.Data_Top_In(DataOutToStateBig),
			.Data_To_Send(DataStateBigToSender),
			.Data_To_Recieve(DataStateBigToReciever),
			.Enable_Recieve(EnableToReciever),
			.Enable_Send(EnableToSender)
			);
			
			Sig_Decode_In SignalDecoderIn(
			.clk(clk),
			.Reset(Reset),
			.Enable(EnableToReciever),
			.Data_In(DataStateBigToReciever),
			.Data_Out(DataRecieverToShifter),
			.Enable_Out(EnableRecieverToShifter),
			.clk_Out(ClockRecieverToShifter)
			);
			
			//PLACE THE N64 SHIFT REGISTER HERE
			//FOR THE INPUTS, IT NEEDS TO TAKE A TWO BIT DATA LINE (DataRecieverToShifter) AND AN ENABLE LINE AND CLOCK LINE
			//THAT ARE OUTPUTTED FROM SignalDecoderIn (ENABLE - EnableRecieverToShifter | CLOCK - ClockRecieverToShifter)
			N64_in_to_buttons shifter (
			.data(DataRecieverToShifter),
			.clock(ClockRecieverToShifter),
			.enable_latch(EnableRecieverToShifter),
			.button_out(N64_out));
			
endmodule

module clock_slow (
			 input logic clk_i,
		     output logic clk_o);
			
	logic [2:0] count;		
	
	always_ff @ (posedge clk_i) begin
		count = count + 1;
		if (count >= 7) begin
			clk_o = ~clk_o;
			count = 0;
		end
	end

endmodule