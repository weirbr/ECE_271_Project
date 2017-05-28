module top (
	input logic [7:0] button_board,
	input logic N64,
	input logic remote,
	
	output logic NES_Data,
	input logic NES_Clock,
	input logic NES_Latch,
	
	output logic SNES_Data,
	input logic SNES_Clock,
	input logic SNES_Latch,
	
	input logic reset_in);
	
	
	logic [11:0] button_board_wires;
	logic [11:0] N64_wires;
	logic [11:0] remote_wires;
	
	NES_para_to_ser NES_sort (
						.clk(NES_Clock),
						.latch(NES_Latch),
						.data(NES_Data),
					
						.AIn(button_board_wires[6]),
						.BIn(button_board_wires[7]),
						.sel(button_board_wires[5]),
						.start(button_board_wires[4]),
						.up(button_board_wires[0]),
						.down(button_board_wires[1]),
						.left(button_board_wires[2]),
						.right(button_board_wires[3]),
					
						.reset(reset_in));
						
	
	SNES_para_to_ser SNES_sort(
						.clk(SNES_Clock),
						.latch(SNES_Latch),
						.data(SNES_Data),
					
						.AIn(button_board_wires[6]),
						.BIn(button_board_wires[7]),
						.sel(button_board_wires[5]),
						.start(button_board_wires[4]),
						.up(button_board_wires[0]),
						.down(button_board_wires[1]),
						.left(button_board_wires[2]),
						.right(button_board_wires[3]),
						.L(button_board_wires[10]),
						.R(button_board_wires[11]), 
						.X(button_board_wires[8]),
						.Y(button_board_wires[9]),
						
						.reset(reset_in));
	
	

	button_board_reciever b_board_rec (
						.b_out(button_board_wires),
						.b_in(button_board));
	remote_reciever r_rec (
						.remote_in(remote),
						.remote_out(remote_wires));
	N64_reciever N64_rec (
						.N64_in(N64),
						.N64_out(N64_wires));
						
	
	
	
endmodule