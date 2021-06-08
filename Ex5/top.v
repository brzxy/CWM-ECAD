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
    //{000} and {111} are not used, for other colours, change if button=1, stay constant if button=0
    always @(posedge clk)
     begin
        

        //for the state to be COOLING ON
        if((heating==0)&&(cooling==1))
        begin
            if(temperature<=20)
            begin 
               cooling<=0; 
               heating<=0;     //turn off cooling and turn off heating
            end
            else
            begin 
               cooling<=1; 
               heating<=0;     //turn on cooling and turn off heating
            end
        end


        //for the state to be HEATER ON
        if((heating==1)&&(cooling==0))
        begin
            if(temperature>=20)
            begin 
               cooling<=0; 
               heating<=0;     //turn off cooling and turn off heating
            end
            else
            begin 
               cooling<=0; 
               heating<=1;     //turn off cooling and turn on heating
            end
        end


        //for the state to be IDLE
        if((heating==0)&&(cooling==0))
        begin
            if(temperature>=22)
            begin 
               cooling<=1; 
               heating<=0;     //turn on cooling and turn off heating
            end

            if(temperature<=18)
            begin 
               cooling<=0;
               heating<=1;     //turn off cooling and turn on heating
            end
            
            else begin
               cooling<=0;
               heating<=0;     //turn off cooling and turn off heating
            end
        end
 
    end

endmodule
