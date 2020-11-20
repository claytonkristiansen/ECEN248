`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2020 07:08:02 PM
// Design Name: 
// Module Name: d_flip_flop_behavioral
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


module d_flip_flop_behavioral(Q, notQ, D, Clk);
    output reg Q;                   //Output register
    output wire notQ;               //Output wire
    input wire D;                   //Input wire
    input wire Clk;                 //Input wire
    
    always @ (posedge Clk)          //Store D in Q on the rising edge of the clock signal
        Q <= D;
    assign notQ = ~Q;
endmodule
