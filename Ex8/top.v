//////////////////////////////////////////////////////////////////////////////////
// Exercise #8  - Simple End-to-End Design
// Student Name:Xuyang Zhao
// Date: 2021/6/11
//
//  Description: In this exercise, you need to design an air conditioning systems
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,
     //Todo: add all other ports besides clk_n and clk_p
    input rst_n,
    input temperature_0,//1st bit
    input temperature_1,//2nd bit
    input temperature_2,//3rd bit
    input temperature_3,//4th bit
    input temperature_4,//5th bit
 
    output heating,
    output cooling
    );
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

//Add logic here
       AIR AIR(
	.clk(clk),
	.temperature(temperature),
	.heating(heating),
	.cooling(cooling)
	);
endmodule
