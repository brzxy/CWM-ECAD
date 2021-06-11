//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:Xuyang Zhao
// Date: 2021/6/11
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

	//parameters
	parameter CLK_PERIOD = 10;
	
	//registers
	reg clk;
        reg err;
        reg sel;
        reg button;
        reg rst;
	reg enable;
	wire [23:0] light;
	reg [23:0] light_prev;

	//creating the clock
	initial begin
        clk = 1'b0;
        light_prev=24'd0;        

        forever
         #(CLK_PERIOD/2) clk=~clk;
        end

	//logic and testing output

	initial 
        begin
		err=0;
		rst=0;
		button=0;
                enable=1;
		//button=0 means colours can change 
		light_prev=light;
		sel = 0;
                #10
		#(CLK_PERIOD)
		if (light != 24'hFFFFFF) 
                begin
		   $display("TEST FAILED 1");
	       	   err = 1;
		end
		button = 1;

		#(CLK_PERIOD)

		if (light != 24'hFFFFFF) 
                begin
		   $display("TEST FAILED 2");
		   err = 1;
		end

		//when sel==0, white light should be ouput 
		sel = 1;
		rst = 1;
		#(CLK_PERIOD)
                //when rst=1, colour resets to the start
		if (light!= 24'h0000FF) 
                begin
		   $display("TEST FAILED 3");
	           err = 1;
		end
		
		rst = 0;
		button = 0;
                //return back to the value when button was turned off
		#(CLK_PERIOD*5)
		if (light_prev != light) begin
			$display("TEST FAILED 4");
			err = 1;
		end
		
		//now test and validate the rest of system
		//button=1 means switching colours
		button=1;
		forever begin
		    #(CLK_PERIOD*2)
		    //should be moving through the sequence
		    if(light_prev==light) begin
			$display("TEST FAILED 5");
			err = 1;
       		    end
			light_prev=light;
		end
		
	end

	//check for success
	initial begin
        #150 
        if (err==0)
          $display("TEST PASSED");
        $finish;
      end


	//instantiation
	LightsSelector top (
		.clk(clk),
		.sel(sel),
                .rst(rst),
		.button(button),
                .enable(enable),
		.light(light)
		);

endmodule
