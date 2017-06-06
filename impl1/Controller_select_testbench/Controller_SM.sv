module controller_SM (
		input logic [11:0] b_board_in,
		input logic [11:0] N64_in,
		input logic [11:0] remote_in,
		
		output logic [11:0] NES1,
		output logic [11:0] NES0,
		output logic [11:0] SNES1,
		output logic [11:0] SNES0,

		input logic [3:0] select_in,
		
		input logic reset_in);
		
		
		parameter off = 12'b111111111111;
		
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
						NES1 = remote_in;
						NES0 = N64_in;
						SNES1 = off;
						SNES0 = off;
					end
				S1: begin
						NES1 = N64_in;
						NES0 = remote_in;
						SNES1 = off;
						SNES0 = off;
					end
				S2: begin
						NES1 = off;
						NES0 = off;
						SNES1 = remote_in;
						SNES0 = N64_in;
					end
				S3: begin
						NES1 = off;
						NES0 = off;
						SNES1 = N64_in;
						SNES0 = remote_in;
					end
				S4: begin
						NES1 = remote_in;
						NES0 = b_board_in;
						SNES1 = off;
						SNES0 = off;
					end
				S5: begin
						NES1 = b_board_in;
						NES0 = remote_in;
						SNES1 = off;
						SNES0 = off;
					end
				S6: begin
						NES1 = off;
						NES0 = off;
						SNES1 = remote_in;
						SNES0 = b_board_in;
					end
				S7: begin
						NES1 = off;
						NES0 = off;
						SNES1 = b_board_in;
						SNES0 = remote_in;
					end
				S8: begin
						NES1 = N64_in;
						NES0 = b_board_in;
						SNES1 = off;
						SNES0 = off;
					end
				S9: begin
						NES1 = b_board_in;
						NES0 = N64_in;
						SNES1 = off;
						SNES0 = off;
					end
				S10: begin
						NES1 = off;
						NES0 = off;
						SNES1 = N64_in;
						SNES0 = b_board_in;
					end
				S11: begin
						NES1 = off;
						NES0 = off;
						SNES1 = b_board_in;
						SNES0 = N64_in;
					end
				endcase
			end
endmodule