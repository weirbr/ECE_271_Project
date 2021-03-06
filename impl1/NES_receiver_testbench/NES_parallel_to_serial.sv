module NES_para_to_ser(
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
					
					input logic reset);
					
	logic [7:0] data_q;
		
	always_ff @ (posedge latch, negedge reset) begin
		if (!reset) data_q = 8'b11111111;
		else begin
			data_q[0] = AIn;
			data_q[1] = BIn;
			data_q[2] = sel;
			data_q[3] = start;
			data_q[4] = up;
			data_q[5] = down;
			data_q[6] = left;
			data_q[7] = right;
		end
	end
	
	always_ff @ (posedge clk) begin
		data_q = data_q << 1;
		data = data_q[0];
	end

	

endmodule