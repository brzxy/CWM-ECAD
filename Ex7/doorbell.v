//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 - Doorbell Chime
// Student Name:Xuyang Zhao
// Date: 2021/6/7
//
//  Description: In this exercise, you need to design a multiplexer that chooses between two sounds, where the  
//  output is delayed by 5 ticks (not clocks!) and acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module doorbell(
    //Todo: define inputs here
    input [23:0] a,
    input [23:0] b,
    input sel,   //input a,b,sel
    output out         //output out
    );
    
    
    //Todo: define registers and wires here
    wire   out;

    //Todo: define your logic here                 
      assign #5 out=(sel==0)?a:
                     b;   //out=b when sel=1
endmodule
