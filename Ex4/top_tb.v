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
        rst=1;
        err=0;  
        button=0;    

   forever begin      
        //check for reset
        #(CLK_PERIOD)
        if ((rst==1)&&(colour!=3'b000))
        //rst=1 means colour={000}
        begin
           $display("Test FAILED1");//if not then test failed
           err = 1;
        end
      
        #(CLK_PERIOD)
        rst=0;
        colour_prev=colour;
        #(CLK_PERIOD)

        if ((button==0)&&(colour_prev!=colour))
        //button=0 colour=colour
        begin
           $display("Test FAILED2");//if not then test failed
           err = 1;
        end        

    
        
        //check for increment
        #CLK_PERIOD
        button=1;
        colour_prev=colour;
        #CLK_PERIOD
        if ( (button == 1) && (colour_prev == 3'b110) && (colour != colour_prev + 1) )
        //button=1 means the colour number will increase by one 
        begin
           $display("TEST FAILED3");//if not then test failed
            err = 1;
        end
        
        if ((button==1)&&(colour_prev == 3'b110)&&(colour!=3'b001))
        //change from 6 to 1 
        begin
           $display("Test FAILED4");//if not then test failed
           err = 1;
        end

     end
   end  
  

//Todo: Finish test, check for success

     initial
     begin
        #200
        if (err==0)
          $display("TEST PASSED!");
        $finish;
     end

//Todo: Instantiate counter module
   
   LIGHTS top(
     .clk (clk),
     .rst (rst),
     .button(button),
     .colour (colour)
   );


endmodule 
