//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:Xuyang Zhao
// Date: 2021/6/8
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
// Parameters
parameter CLK_PERIOD = 10; //set the clock period
//Todo: Regitsers and wires
reg clk;
reg [4:0] temperature;
reg err;
reg cooling;
reg heating;

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
        cooling=0;
        heating=0;
        temperature=0;//set the initial temperature to be zero   

        
        //check for HEATING ON state
        if ((cooling==0)&&(heating!=1))
        //for temperature being zero the heating should be 1 
        begin
           $display("TEST FAILED");//if not then test failed
            err = 1;
        end
        
        temperature=temperature+21;
        //check for IDLE state
        if ((cooling==0)&&(heating!=0))
        //for temperature being 21 the heating should be 0
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end


        temperature=temperature+1;
        //check for COOLING ON state
        if ((heating==0)&&(cooling!=1))
        //for temperature being 22 the cooling should be 1
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end

   end  
  
//Todo: Finish test, check for success

     initial
     begin
        #50
        if (err==0)
          $display("TEST PASSED!");
        $finish;
     end

//Todo: Instantiate module
   
   AIR top(
     .clk (clk),
     .temperature (temperature),
     .heating (heating),
     .cooling (cooling)
   );


endmodule 
