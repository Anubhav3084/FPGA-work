`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// This module divides the clock frequency to 50KHz and we increment the sel
// value so that one of the four 7-segment display is active.
//////////////////////////////////////////////////////////////////////////////////

module digit_select(clk,sel);

	input clk;
	output reg [1:0]sel = 2'b00;
	
	reg [9:0]count = 10'd0;
	reg new_clk = 0;
	
	parameter prescalar = 1000;	// refresh frequency is 50KHz
	
	always @(posedge clk)
	begin
		if(count == prescalar)
		begin
			count <= 0;
			new_clk <= ~new_clk;
		end
		else count <= count + 1;
	end
	
	always @(posedge new_clk) sel <= sel + 1;


endmodule
