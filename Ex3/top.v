//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name:Xuyang Zhao
// Date: 2021/6/7
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
    input clk,
    input rst,
    input change,   
    input on_off,     //four inputs
    output [7:0] counter_out         //output out
    );
                    
    //Todo: add registers and wires, if needed
    reg [7:0] counter_out;   //set the output as register as we want it to store information
    
    //Todo: add user logic
    always @(posedge clk)
     begin

        if(rst)
          counter_out <= 0;  //if reset then output=o
        else  
          begin
  
            if(change)       //so if change=0,output stays constant                
                if(on_off)   //if on then count up
                  counter_out<=counter_out+1;
                else         //if off then count down
                  counter_out<=counter_out-1;
              
          end
     end

endmodule
