`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 08:03:35 PM
// Design Name: 
// Module Name: top_level
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_level(LEDs, SWs, BTNs, FastClk);
    output wire [3:0] LEDs;                                     //4-bit Output net
    input wire [1:0] SWs, BTNs;                                 //2-bit input nets
    input wire FastClk;                                         //input net
    wire [3:0] Clocks;                                          //4-bit intermediate net
    reg SlowClk;                                                //intermediate net
    
    always@(*)                                                  //Always when anything in the always block changes
        case(SWs)                                               //Switch to select what clock speed to use
            2'b00: SlowClk = Clocks[0];                         //Fastest clock
            2'b01: SlowClk = Clocks[1];
            2'b10: SlowClk = Clocks[2];
            2'b11: SlowClk = Clocks[3];                         //Slowest clock
        endcase
        
    up_counter counter0(LEDs[2:0], LEDs[3], BTNs[0], SlowClk, BTNs[1]);             //Counts up the LEDs using the selected SlowClk
    
    clock_divider clk_div0(.ClkOut(Clocks), .ClkIn(FastClk));                       //divides the clock with the parameter set to 25 for a 26-bit count
endmodule
