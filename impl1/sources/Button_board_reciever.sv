module button_board_reciever (
		output logic [11:0] b_out,
		input logic [7:0] b_in);
		
		logic [7:0] BTS;
		
		decoder3_8 decoder_button_board(
						.a(b_in[6:4]),
						.y(BTS));
						
		always_comb begin
			b_out[0] = b_in[0];
			b_out[1] = b_in[1];
			b_out[2] = b_in[2];
			b_out[3] = b_in[3];
			b_out[4] = BTS[0];
			b_out[5] = BTS[1];
			b_out[6] = BTS[2];
			b_out[7] = BTS[3];
			b_out[8] = BTS[4];
			b_out[9] = BTS[5];
			b_out[10] = BTS[6];
			b_out[11] = BTS[7];
		end
		
endmodule
