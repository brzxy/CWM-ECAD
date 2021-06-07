//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:Xuyang Zhao
// Date: 2021/6/7
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10; //set the clock period
//Todo: Regitsers and wires
reg clk, rst, data, data_out;


//Todo: Clock generation

   initial begin //This block generates the clock with a period of 10 time units
      clk=0;
      forever
      #(CLK_PERIOD/2) clk=~clk; //happens every delay of CLK_PERIOD/2
   end

//Todo: User logic

   initial begin //This block drives inputs to user’s module and checks output
      rst=1;
      data=0;
      #10 rst=0;
      data=1;
      #10
      $display(“data= %h, data_out=%h”, data, data_out);
   end    
//Todo: Finish test, check for success

//Todo: Instantiate counter module
   monitor top(
     .a (ab[1]),
     .b (ab[0]),
     .sel (sel),
     .out (out)
     );
endmodule 
