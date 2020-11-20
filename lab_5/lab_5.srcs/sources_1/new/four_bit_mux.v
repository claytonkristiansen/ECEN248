`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2020 06:01:16 PM
// Design Name: 
// Module Name: four_bit_two_one_mux
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


module four_bit_mux(Y, A, B, S);

    output wire [3:0] Y;    //4 bit output
    input wire [3:0] A, B;  //4 bit inputs
    input wire S;           //Selector bit
    
    two_one_mux MUX0(Y[0], A[0], B[0], S);  ///////////////////////////////////////////////////////////////////////////
    two_one_mux MUX1(Y[1], A[1], B[1], S);  //  Series of 2:1 MUX to form a 4 bit 2:1 MUX
    two_one_mux MUX2(Y[2], A[2], B[2], S);  //
    two_one_mux MUX3(Y[3], A[3], B[3], S);  ///////////////////////////////////////////////////////////////////////////

endmodule
