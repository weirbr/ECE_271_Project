module top (
	input logic [7:0] button_board,
	output logic SNES_Data,
	input logic SNES_Clock,
	input logic SNES_Latch,
	input logic reset_in,
	
	logic [7:0] BTS;
	
	NES_parallel_to_serial NES_conv(
						.clk(SNES_Clock),
						.latch(SNES_Latch),
						.data(SNES_Data),
					
						.AIn(BTS[2]),
						.BIn(BTS[3]),
						.sel(BTS[1]),
						.start(BTS[0]),
						.up(button_board[0]),
						.down(button_board[1]),
						.left(button_board[2]),
						.right(button_board[3]),
					
						.reset(reset_in));
	);
	
	
endmodule