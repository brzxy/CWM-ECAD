//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:Xuyang Zhao
// Date: 2021/6/10
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
// Parameters
parameter CLK_PERIOD = 10; //set the clock period
//Todo: Regitsers and wires
reg clk;
reg [2:0] colour;
reg err;
reg enable;
wire [23:0] rgb;

//Todo: Clock generation

   initial
   begin //This block generates the clock with a period of 10 time units
      clk=0;
      forever
        #(CLK_PERIOD/2) clk=~clk; //happens every delay of CLK_PERIOD/2
   end

//Todo: User logic

   initial 
   begin //This block drives inputs to user’s module and checks output
        err=0;
        colour=3'b0;
        enable=0;   
        #(CLK_PERIOD)
        enable=1; 
      forever
      begin  
       
        #(CLK_PERIOD*2)
        if ((colour[0]!=(rgb[7:0]))||(colour[1]!=(rgb[15:8]))||(colour[2]!=(&rgb[23:16]))) 
        //the first bit in colour is converted to first 8 bits in rgb
        //the second bit in colour is converted to second 8 bits in rgb
        //the third bit in colour is converted to third 8 bits in rgb
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end
        colour=colour+3'd1;
      end
   end  
  
//Todo: Finish test, check for success
     initial
     begin
        #500
        if (err==0)
          $display("TEST PASSED!");
        $finish;
     end

//Todo: Instantiate module
   
   converter top(
     .clk (clk),
     .enable (enable),
     .colour (colour),
     .rgb (rgb)
   );


endmodule 
