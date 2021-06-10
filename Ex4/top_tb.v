//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:Xuyang Zhao
// Date: 2021/6/8
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
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
    
// Parameters
parameter CLK_PERIOD = 10; //set the clock period
//Todo: Regitsers and wires
reg clk;
reg rst; 
reg button;
reg err;
reg [2:0] colour_prev;
wire [2:0] colour;

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

        button=0;
        colour_prev=colour;

           
        //check for reset
        if ((rst==1)&&(colour!=3'b000))
        //rst=1 means colour={000}
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end
        if ((rst==0)&&(colour!=colour_prev))
        //rst=0 means colour=colour_prev
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end        

     forever begin
        
        //check for on_off
        #CLK_PERIOD
        if ( (button == 1) && (colour < colour_prev) )
        //button=1 means the colour number will increase by one 
        begin
           $display("TEST FAILED");//if not then test failed
            err = 1;
        end
        
        if ((button==0)&&(colour!=colour_prev))
        //button=0 means the colour number will stay constant 
        begin
           $display("Test FAILED");//if not then test failed
           err = 1;
        end

        #CLK_PERIOD
        button=~button; 
        colour_prev=colour; //set the new colour_prev  
       
        rst=0;
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
   
   LIGHTS top(
     .clk (clk),
     .rst (rst),
     .colour (colour)
   );


endmodule 
