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
reg clk;
reg rst; 
reg on_off;
reg change;
reg err;
reg [7:0] counter_prev;
wire [7:0] counter_out;

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
        rst=1;

        change=0;
        on_off=0;

        counter_prev=counter_out;        

     forever begin
        
        //check for on_off
        #CLK_PERIOD
        if (change==1)
        begin
           if ((on_off==1)&&(counter_out<counter_prev))
           //on_off=1 means counter counts up, so counter_out should be larger than counter_prev 
           begin
              $display("TEST FAILED");//if not then test failed
              err = 1;
           end
        
           if ((on_off==0)&&(counter_out>counter_prev))
           //on_off=1 means counter counts up, so counter_out should be smaller than counter_prev 
           begin
              $display("Test FAILED");//if not then test failed
              err = 1;
           end
           counter_prev=counter_out; //set the new counter_prev
        end
        

        on_off=~on_off;
        change=~change;
        rst=0;        //try both cases
     end 

        //check for reset
        if ((rst==1)&&(counter_out!=0))
        //rst=1 means counter_out=0
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end
        
        if ((rst==0)&&(counter_out!=counter_prev))
        //rst=0 means counter_out=counter_prev
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end  
   

        // change is zero, check if the counter value stays the same 
        if((change == 0) && (counter_out != counter_prev))
        begin
	   $display("TEST FAILED");
	   err = 1;
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

//Todo: Instantiate counter module
   
   monitor top(
     .clk (clk),
     .rst (rst),
     .change (change),
     .on_off (on_off),
     .counter_out (counter_out)
   );


endmodule 
