//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:Xuyang Zhao
// Date: 2021/6/8
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module AIR (
    //add ports 
    input clk,  
    input [4:0] temperature,     //two inputs
    output heating,
    output cooling         //two outputs 
    );
                    
    //add registers and wires, if needed
    reg heating;
    reg cooling;

    //add user logic

     initial begin
	heating = 0;
	cooling = 0;
     end

     always@(posedge clk)
	begin
		
		// For heating state
		if ((heating == 1) && (cooling == 0))
		begin
			
			if (temperature < 20)// stay in heating state
			begin
			heating <= 1;
			cooling <= 0;
			end
			
			if (temperature >= 20)// switch to idle
			begin
			heating <= 0;
			cooling <= 0;
			end
		end

		//For cooling state
		else if ((heating == 0) && (cooling == 1))
		begin
			
			if (temperature > 20)// stay in cooling state
			begin
			heating <= 0;
			cooling <= 1;
			end
			
			if (temperature <= 20)// switch to idle
			begin
			heating <= 0;
			cooling <= 0;
			end
		end
        
                // For idle state
		else if ((heating == 0) && (cooling == 0))
		begin
			// stay in idle 
			if ((temperature > 18) && (temperature < 22))
			begin
			heating <= 0;
			cooling <= 0;
			end
			
			else if (temperature <= 18)// heating on
			begin
			heating <= 1;
			cooling <= 0;
			end
			
			else if (temperature >= 22)// cooling on
			begin
			heating <= 0;
			cooling <= 1;
			end
		end

		
	end

endmodule
