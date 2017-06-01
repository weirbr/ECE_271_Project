module N64_in_to_buttons (
					input logic [1:0] data,
					input logic clock,
					input logic enable_latch,
					output logic [11:0] button_out);
		
		logic [18:0] joystick; 
		logic [14:0] buttons;
		
		N64_button_converter thing1 (
							.joy_in(joystick),
							.button_in(buttons),
							.button_out(button_out));
		N64_serial_to_parallel thing2 (
							.data(data),
							.clock(clock),
							.enable_latch(enable_latch),
							.joystick(joystick),
							.buttons(buttons));
endmodule


module N64_button_converter (
						input logic [18:0] joy_in,
						input logic [14:0] button_in,
						output logic [11:0] button_out);
		
		always_comb begin
			//this is in order: B,y,sel,st,up,down,left,right,a,x,l,r
			button_out[0] = button_in[1];
			button_out[1] = button_in[15];
			button_out[2] = button_in[2];
			button_out[3] = button_in[3];
			
			button_out[4] = button_in[4]; //add joystick to these
			button_out[5] = button_in[5];
			button_out[6] = button_in[6];
			button_out[7] = button_in[7];
			
			button_out[8] = button_in[0];
			button_out[9] = button_in[12];
			button_out[10] = button_in[10];
			button_out[11] = button_in[11]; 
		end
endmodule


module N64_serial_to_parallel (	//latch is 1, stop is 1, 33 bit length
						input logic data,
						input logic clock,
						input logic enable_latch,
						output logic [18:0] joystick,
						output logic [14:0] buttons);
						
	parameter s0 = 1'b0; //start
	parameter s1 = 1'b1; //idle
	
	logic state;
	logic [5:0] count;
						
	always_ff @(posedge enable_latch) begin
		if (data === 2'b00) begin
			state = s1;
		end
		else begin
			state = s0;
			count = 0;
		end
	end
	
	always_ff @(posedge clock) begin
		case (state)
			s0: begin
				if (count < 16) begin
					buttons[count] = data[0];
					count = count + 1;
				end
				else if (count >= 16) begin
					joystick[count - 16] = data[0];
					count = count + 1;
				end
				else if (count >= 33) begin
					state = s1;
				end
				end
			s1: begin
				state = s1;
				end
		endcase
	end						

endmodule