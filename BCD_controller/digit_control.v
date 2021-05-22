`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//  This module selects the data input and gives to BCD_convertor. It takes data 
//  for one place at a time like ones or tens,  etc.
//////////////////////////////////////////////////////////////////////////////////

module digit_control(ones,tens,hundreds,thousands,sel,data);

	input [3:0]ones,tens,hundreds,thousands;
	input [1:0]sel;
	
	output reg [3:0]data = 4'd0;
	
	always @(sel)
	begin
		case(sel)
			2'b00	:	data = ones;
			2'b01	:	data = tens;
			2'b10	:	data = hundreds;
			2'b11	:	data = thousands;
		endcase
	end

endmodule
 