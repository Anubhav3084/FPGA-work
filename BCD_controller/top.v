`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// This is the top module wherewe combine all the modules together to form a 
// single module. 
//////////////////////////////////////////////////////////////////////////////////

module top(clk,count,load,reset,data_in,anode,out);
	
	input [3:0]data_in;
	input clk,reset,load,count;
	
	output [3:0]anode;
	output [7:0]out;
	
	wire [1:0]sel;
	wire [3:0]data,ones,tens,hundreds,thousands;
	wire next1,next2,next3,next4;
	
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
	
	clock_divider_freq1s clkfreq1(
	.clk(clk),
	.new_clk(new_clk)
	);
	
	counter one(
	.clk(new_clk),
	.reset(reset),
	.count(count),
	.load(load),
	.data_in(data_in),
	.out(thousands),
	.next(next1)
	);
	
	counter ten(
	.clk(next1),
	.reset(reset),
	.count(count),
	.load(load),
	.data_in(data_in),
	.out(hundreds),
	.next(next2)
	);
	
	counter hundred(
	.clk(next2),
	.reset(reset),
	.count(count),
	.load(load),
	.data_in(data_in),
	.out(tens),
	.next(next3)
	);
	
	counter thousand(
	.clk(next3),
	.reset(reset),
	.count(count),
	.load(load),
	.data_in(data_in),
	.out(ones),
	.next(next4)
	);

endmodule
