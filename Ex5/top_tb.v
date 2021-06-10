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
wire cooling;
wire heating;

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
        #(CLK_PERIOD) 
        temperature=18;//set the initial temperature to be 18   

      forever
      begin  
        #(CLK_PERIOD)
        //check for HEATING ON state
        if ((temperature>=20)&&((cooling==1)||(heating==0)))
        //heater should be on
        begin
           $display("TEST FAILED1");//if not then test failed
            err = 1;
        end
        

        #(CLK_PERIOD)
        temperature=19;
        #(CLK_PERIOD)
        //check for remainning HEATING state
        if ((temperature>=20)&&(cooling == 0) && ((cooling == 1) || (heating == 0)))
        //for temperature being 19 the heating should on
        begin
           $display("Test FAILED2");//if not then test failed
           err = 1;
        end


        #(CLK_PERIOD)
        temperature=20;
        #(CLK_PERIOD)
        //check for IDLE state
        if ((temperature>=20)&&((cooling==1)||(heating==1)))
        //for temperature being 20 should IDLE
        begin
           $display("Test FAILED3");//if not then test failed
           err = 1;
        end

        #(CLK_PERIOD)
        temperature=21;
        #(CLK_PERIOD)
        //check for remaining IDLE state
        if ((temperature<22)&&((cooling==1)||(heating==1)))
        //for temperature being 21 should IDLE
        begin
           $display("Test FAILED4");//if not then test failed
           err = 1;
        end

        #(CLK_PERIOD)
        temperature=22;
        #(CLK_PERIOD)
        //check for COOLING state
        if ((temperature>=22)&&((cooling==0)||(heating==1)))
        //for temperature being 22 should COOLING
        begin
           $display("Test FAILED5");//if not then test failed
           err = 1;
        end

        #(CLK_PERIOD)
        temperature=21;
        #(CLK_PERIOD)
        //check for remain cooling state
        if ((temperature>20)&&((cooling==0)||(heating==1)))
        //for temperature being 21 should Cooling
        begin
           $display("Test FAILED6");//if not then test failed
           err = 1;
        end

        #(CLK_PERIOD)
        temperature=20;
        #(CLK_PERIOD)
        //check for IDLE state
        if ((temperature<=20)&&((cooling==1)||(heating==1)))
        //for temperature being 20 should IDLE
        begin
           $display("Test FAILED7");//if not then test failed
           err = 1;
        end

        #(CLK_PERIOD)
        temperature=19;
        #(CLK_PERIOD)
        //check for remain IDLE state
        if ((temperature>18)&&((cooling==1)||(heating==1)))
        //for temperature being 19 should IDLE
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end

        #(CLK_PERIOD)
        temperature=18;
        #(CLK_PERIOD)
        //check for HEATING state
        if ((temperature<=18)&&((cooling==1)||(heating==0)))
        //for temperature being 18 should HEATING
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end

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
   
   AIR top(
     .clk (clk),
     .temperature (temperature),
     .heating (heating),
     .cooling (cooling)
   );


endmodule 
