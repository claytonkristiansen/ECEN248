`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 04:50:10 PM
// Design Name: 
// Module Name: carry_lookahead_4bit
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


module carry_lookahead_4bit(Cout, S, X, Y, Cin);
    output wire Cout;
    output wire [3:0] S;
    input wire [3:0] X, Y;
    input wire Cin;
    
    wire [3:0] G, P;                    //Intermediate nets
    wire [4:0] C;
    
    generate_propagate_unit gp0(G, P, X, Y);
    carry_lookahead_unit clu0(C, Cin, P, G);
    summation_unit su0(S, P, {C[3:1], Cin});
    assign Cout = C[4];
     
endmodule
