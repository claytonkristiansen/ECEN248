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


module carry_lookahead_unit(C, Cin, P, G);
    output wire [4:0] C;            //4-bit output net
    input wire Cin;                 //input net
    input wire [3:0] P, G;          //4-bit input nets
    
    assign C[0] = Cin;
    //The Cin calculation from the previous carry is replicated for each of the preceding carries
    assign #4 C[1] = G[0] | (Cin & P[0]);                                                                                          
    assign #4 C[2] = G[1] | (G[0] & P[1]) | (Cin & P[0] & P[1]);                                               
    assign #4 C[3] = G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (Cin & P[0] & P[1] & P[2]);
    assign #4 C[4] = G[3] | (G[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (Cin & P[0] & P[1] & P[2] & P[3]);           
endmodule
