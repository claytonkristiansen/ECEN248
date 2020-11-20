`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 04:08:46 PM
// Design Name: 
// Module Name: summation_unit
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


module summation_unit(S, P, C);
    output wire [15:0] S;            //4-bit output net
    input wire [15:0] P, C;          //4-bit input nets
    
    assign #2 S = P ^ C;      //Sum bit calculation

endmodule
