`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 04:10:00 PM
// Design Name: 
// Module Name: carry_lookahead_unit
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


module generate_propagate_unit(G, P, X, Y);
    output wire [15:0] G, P;         //4-bit output nets
    input wire [15:0] X, Y;          //4-bit input nets
    
    assign #2 G = X & Y;               //Generate is and of operand bits
    assign #2 P = X ^ Y;               //Propagate is xor of operand bits
    
endmodule
