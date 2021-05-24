`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// This is the top module wherewe combine all the modules together to form a 
// single module. 
//////////////////////////////////////////////////////////////////////////////////

module top(clk,ones,tens,hundreds,thousands,anode,out);
	
	input [3:0]ones,tens,hundreds,thousands;
	input clk;
	
	output [3:0]anode;
	output [7:0]out;
	
	wire [1:0]sel;
	
	digit_select DS(
	.clk(clk),
	.sel(sel)
	);
	
	anode_controller AC(
	.sel(sel),
	.anode(anode)
	);
	
	digit_control DC(
	.ones(ones),
	.tens(tens),
	.hundreds(hundreds),
	.thousands(thousands),
	.sel(sel),
	.data(data)
	);
	
	BCD_convertor BCD( 
	.data(data),
	.out(out)
	);

endmodule
