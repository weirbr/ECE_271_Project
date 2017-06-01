module N64_reciever (
			input logic N64_in,
			input logic clk_i,
			output logic [11:0] N64_out);
			
			
			logic clk_slow;
			
/*			
			OSCH #("14.00") osc_int (					
					.STDBY(1'b0),			
					.OSC(clk_i),				
					.SEDSTDBY());
*/
					
			clock_slow slow_it_down_baby (
					.clk_i(clk_i),
					.clk_o(clk_slow));
			
			
			
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
		if (clk_o===1'bX) clk_o = 0;
		
	end

endmodule