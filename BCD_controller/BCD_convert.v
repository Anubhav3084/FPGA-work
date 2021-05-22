`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// This module gets the data from the digit_control and is mapped to 7-segment 
//	display accordingly. Note that our FPGA have common annode so for switching a 
//	led on we need to provide cathode as low voltage(logic 0).
//////////////////////////////////////////////////////////////////////////////////

module BCD_convertor(data,out);

	input [3:0]data;
	
	output reg [7:0]out = 8'd0;
	
	always @(data)
	begin
		case(data)
			4'b0000  	: out = 8'b00000011;
			4'b0001 		: out = 8'b10011111;
			4'b0010	 	: out = 8'b00100101;
			4'b0011		: out = 8'b00001101;
			4'b0100 		: out = 8'b10011001;
			4'b0101 		: out = 8'b01001001;
			4'b0110 		: out = 8'b01000001;
			4'b0111 		: out = 8'b00011111;
			4'b1000 		: out = 8'b00000001;
			4'b1001 		: out = 8'b00001001;
			default 		: out = 8'b11111111;
		endcase
	end

endmodule