//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:Xuyang Zhao
// Date: 2021/6/8
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//  
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module LIGHTS (
    //add ports 
    input clk,
    input rst,  
    input button,     //three inputs
    output [2:0] colour         //output colour
    );
                    
    //add registers and wires, if needed
    reg [2:0] colour;

    //add user logic
    //{000} and {111} are not used, for other colours, change if button=1, stay constant if button=0
    always @(posedge clk)
     begin

        if(rst)
          colour = 3'd000;  //if reset then colour={000}
        else  
          begin
            
             if ((colour==3'd000)||(colour==3'd111))//if colour is {000} or {111}, change to {001}
                colour=3'd001;               
             if (button)   //if button=1
                colour=colour+3'd001;

          end
     end

endmodule
