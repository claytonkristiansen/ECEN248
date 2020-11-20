`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 05:00:50 PM
// Design Name: 
// Module Name: two_one_mux
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


module two_one_mux(Y, A, B, S);

    output wire Y;      //Output bit
    input wire A, B, S; //Input bit
    
    wire notS;
    wire andA;
    wire andB;
    
    not not0(notS, S);          ///////////////////////////////////////////////////////////////////////////
    and and0(andA, notS, A);    //  Logic combination for a 2:1 MUX
    and and1(andB, S, B);       //
    or or0(Y, andA, andB);      ///////////////////////////////////////////////////////////////////////////

endmodule
