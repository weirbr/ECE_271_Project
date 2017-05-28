module controller_SM (
		input logic [7:0] b_board_in,
		input logic [7:0] N64_in,
		input logic [7:0] remote_in,
		
		output logic [7:0] b_board_out_NES1,
		output logic [7:0] b_board_out_NES0,
		output logic [7:0] b_board_out_SNES1,
		output logic [7:0] b_board_out_SNES0,
		
		output logic [7:0] N64_out_NES1,
		output logic [7:0] N64_out_NES0,
		output logic [7:0] N64_out_SNES1,
		output logic [7:0] N64_out_SNES0,

		output logic [7:0] remote_out_NES1,
		output logic [7:0] remote_out_NES0,
		output logic [7:0] remote_out_SNES1,
		output logic [7:0] remote_out_SNES0,

		
		input logic [3:0] select_in,
		
		input logic reset_in);
		
		logic [3:0] select_q;
		
		parameter off = 8'b11111111;
		
		parameter S0 = 4'b0000;
		parameter S1 = 4'b0001;
		parameter S2 = 4'b0010;
		parameter S3 = 4'b0011;
		parameter S4 = 4'b0100;
		parameter S5 = 4'b0101;
		parameter S6 = 4'b0110;
		parameter S7 = 4'b0111;
		parameter S8 = 4'b1000;
		parameter S9 = 4'b1001;
		parameter S10 = 4'b1010;
		parameter S11 = 4'b1011;
		
		always_comb begin			
			case(select_in)
				S0: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = N64;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = remote_in;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				S1: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = remote_in;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				S2: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = remote_in;
					remote_out_SNES0 = off;
					end
				S3: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = remote_in;
					end
				S4: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = remote_in;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				S5: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = remote_in;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				S6: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = remote_in;
					remote_out_SNES0 = off;
					end
				S7: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = remote_in;
					end
				S8: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				S9: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				S10: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				S11: begin
					b_board_out_NES1 = off; 
					b_board_out_NES0 = off;
					b_board_out_SNES1 = off;
					b_board_out_SNES0 = off;
				
					N64_out_NES1 = off;
					N64_out_NES0 = off;
					N64_out_SNES1 = off;
					N64_out_SNES0 = off;

					remote_out_NES1 = off;
					remote_out_NES0 = off;
					remote_out_SNES1 = off;
					remote_out_SNES0 = off;
					end
				endcase
			end
endmodule