`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:55:13 05/19/2021 
// Design Name: 
// Module Name:    anode_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module anode_controller(sel,anode);

	input [1:0]sel;
	output reg [3:0]anode = 4'd0;
	
	always @(sel)
	begin
		case(sel)
			2'd0 : anode = 4'b0001;	//right most
			2'd1 : anode = 4'b0010;
			2'd2 : anode = 4'b0100;
			2'd3 : anode = 4'b1000;	//left most
		endcase
	end

endmodule
