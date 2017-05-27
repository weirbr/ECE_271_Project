module top (
	input logic [7:0] button_board,
	output logic NES_Data,
	input logic NES_Clock,
	input logic NES_Latch,
	input logic reset_in);
	
	logic [7:0] BTS;
	
	NES_para_to_ser test (
						.clk(NES_Clock),
						.latch(NES_Latch),
						.data(NES_Data),
					
						.AIn(BTS[2]),
						.BIn(BTS[3]),
						.sel(BTS[1]),
						.start(BTS[0]),
						.up(button_board[0]),
						.down(button_board[1]),
						.left(button_board[2]),
						.right(button_board[3]),
					
						.reset(reset_in));
	
	
	decoder3_8 decoder_button_board(
						.a(button_board[6:4]),
						.y(BTS));
	
	
	
endmodule