module top (
	input logic [7:0] button_board,
	inout N64,
	input logic remote,
	
	output logic NES_Data,
	input logic NES_Clock,
	input logic NES_Latch,
	
	output logic SNES_Data,
	input logic SNES_Clock,
	input logic SNES_Latch,
	
	input logic [3:0] game_select,
	
	input logic reset_in);
	
	
	logic [11:0] button_board_wires;
	logic [11:0] N64_wires;
	logic [11:0] remote_wires;
	
	logic [11:0] NES1;
	logic [11:0] NES0;
	logic [11:0] SNES1;
	logic [11:0] SNES0;
	
	controller_SM controller_selecter (
					.b_board_in(button_board_wires),
					.N64_in(N64_wires),
					.remote_in(remote_wires),
		
					.NES1(NES1),
					.NES0(NES0),
					.SNES1(SNES1),
					.SNES0(SNES0),

					.select_in(game_select),
		
					.reset_in(reset_in));
	
	NES_para_to_ser NES_sort_player1 (
						.clk(NES_Clock),
						.latch(NES_Latch),
						.data(NES_Data),
					
						.AIn(NES0[6]),
						.BIn(NES0[7]),
						.sel(NES0[5]),
						.start(NES0[4]),
						.up(NES0[0]),
						.down(NES0[1]),
						.left(NES0[2]),
						.right(NES0[3]),
					
						.reset(reset_in));
						
	
	SNES_para_to_ser SNES_sort_player1(
						.clk(SNES_Clock),
						.latch(SNES_Latch),
						.data(SNES_Data),
					
						.AIn(SNES0[6]),
						.BIn(SNES0[7]),
						.sel(SNES0[5]),
						.start(SNES0[4]),
						.up(SNES0[0]),
						.down(SNES0[1]),
						.left(SNES0[2]),
						.right(SNES0[3]),
						.L(SNES0[10]),
						.R(SNES0[11]), 
						.X(SNES0[8]),
						.Y(SNES0[9]),
						
						.reset(reset_in));
	
	

	button_board_reciever b_board_rec (
						.b_out(button_board_wires),
						.b_in(button_board));
	remote_reciever r_rec (
						.remote_in(remote),
						.remote_out(remote_wires));
	N64_reciever N64_rec (
						.N64_in(N64),
						.Reset(reset_in),
						.N64_out(N64_wires));
						
	
	
	
endmodule