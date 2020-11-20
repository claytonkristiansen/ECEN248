`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 02:22:03 AM
// Design Name: 
// Module Name: carry_lookahead_16bit
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


module carry_lookahead_16bit(Cout, S, X, Y, Cin);
    output wire Cout;                                                                                   //Output net
    output wire [15:0] S;                                                                               //16-bit output net
    input wire [15:0] X, Y;                                                                             //16-bit input nets
    input wire Cin;                                                                                     //Input net
    
    wire [16:0] C;                  //Carry vector
    wire [15:0] P, G;               //Propagate and Generate vectors
    wire [3:0] P_star, G_star;      //Block propagate and generate bits
    wire [4:0] tempC;               //wires to carry the output of the clu to the appropriate carry bits
    
    generate_propagate_unit gp1(G, P, X, Y);                                                            //Calculate the generate and propagate bits
    block_carry_lookahead_unit bcl0(G_star[0], P_star[0], C[3:1], G[3:0], P[3:0], Cin);                 //Block 1
    block_carry_lookahead_unit bcl1(G_star[1], P_star[1], C[7:5], G[7:4], P[7:4], C[4]);                //Block 2
    block_carry_lookahead_unit bcl2(G_star[2], P_star[2], C[11:9], G[11:8], P[11:8], C[8]);             //Block 3
    block_carry_lookahead_unit bcl3(G_star[3], P_star[3], C[15:13], G[15:12], P[15:12], C[12]);         //Block 4
    
    carry_lookahead_unit clu2(tempC, Cin, P_star, G_star);                                              //Calculationg the carry bits into the bcl blocks
    
    assign C[4] = tempC[1]; 
    assign C[8] = tempC[2];
    assign C[12] = tempC[3];
    assign C[16] = tempC[4];
    
    summation_unit su1(S, P, {C[15:1], Cin});                                                           //Calculating the final sum bits

    assign C[0] = Cin;                                                                                  //Assigning the carry in bit
    assign Cout = C[16];                                                                                //Assigning the carry out bit

endmodule
