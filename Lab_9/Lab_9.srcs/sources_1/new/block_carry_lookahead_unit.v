`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 01:36:06 AM
// Design Name: 
// Module Name: block_carry_lookahead_unit
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


module block_carry_lookahead_unit(G_star, P_star, C, G, P, C0);
    output wire G_star, P_star;                 //Output regs
    output wire [3:1] C;                        //
    input wire [3:0] G, P;                      //Input regs
    input wire C0;                              //
    
    wire [4:0] cTemp;                           //Stores temp C values from carry lookahead adder
    
    assign #4 G_star = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);  //Generate calculation
    assign #2 P_star = P[3] & P[2] & P[1] & P[0];                                                  //Propagate calculation
    carry_lookahead_unit clu1(cTemp, C0, P, G);
    assign C = cTemp[3:1];
    
endmodule
