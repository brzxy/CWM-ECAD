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

      if (rst)
          colour <= #1 3'b000;  //if reset then colour={000}
      else
      begin  
        if (button ==0)
                colour<=colour;
        else  
          begin

             if ((colour==3'b000))//if colour is {000} or {111}, change to {001}
                colour<= #1 3'b001; 
             if ((colour==3'b111))//if colour is {000} or {111}, change to {001}
                colour<= #1 3'b001;    

           
             if ((colour==3'b001))
                colour<= #1 3'b010;

             if ((colour==3'b010))
                colour<= #1 3'b011;

             if ((colour==3'b011))
                colour<= #1 3'b100;

             if ((colour==3'b100))
                colour<= #1 3'b101;

             if ((colour==3'b101))
                colour<= #1 3'b110;

             if ((colour==3'b110))
                colour<= #1 3'b001;

          end
       end
     end

endmodule
