//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:Xuyang Zhao
// Date: 2021/6/11
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module LightsSelector(
	//add ports
	input clk,
        input sel,
        input rst,
        input button,
	input enable=1,
        output [23:0] light
        ); 

	//define white
	reg [23:0] white = 24'hFFFFFF;//from mem.coe
	//wires
	wire [2:0] colour;
	wire [23:0] rgb;


LIGHTS LIGHTS ( 
    .clk(clk),
    .rst(rst),  
    .button(button), 
    .colour(colour)      
    );

converter converter ( 
    .clk(clk),
    .enable(enable),  
    .colour(colour), 
    .rgb(rgb)      
    );

doorbell doorbell(
    .a(white),
    .b(rgb),
    .sel(sel),
    .out(light)
    );
endmodule
