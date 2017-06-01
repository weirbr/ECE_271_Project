module SNES_para_to_ser(
					input logic clk,
					input logic latch,
					output logic data,
					
					input logic AIn,
					input logic BIn,
					input logic sel,
					input logic start,
					input logic up,
					input logic down,
					input logic left,
					input logic right,
					input logic L,
					input logic R, 
					input logic X,
					input logic Y,
					input logic reset);
					
	logic [11:0] data_q;
		
	always_ff @ (posedge latch, negedge reset) begin
		if (!reset) data_q = 255;
		else begin
			data_q[0] = BIn;
			data_q[1] = Y;
			data_q[2] = sel;
			data_q[3] = start;
			data_q[4] = up;
			data_q[5] = down;
			data_q[6] = left;
			data_q[7] = right;
			data_q[8] = AIn;
			data_q[9] = X;
			data_q[10] = L;
			data_q[11] = R; 
		end
	end
	
	always_ff @ (posedge clk) begin
		data_q = data_q << 1;
		data = data_q[0];
	end

	

endmodule
