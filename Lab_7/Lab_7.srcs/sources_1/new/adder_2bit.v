`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2020 09:13:40 PM
// Design Name: 
// Module Name: adder_2bit
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


module adder_2bit(Carry, Sum, A, B);
    input wire [1:0] A, B;          //2-bit input nets
    output wire [1:0] Sum;            //2-bit output net
    output wire Carry;                  //1-bit input net
    
    wire C1;                        //Internal carry net
    
    full_adder add0(Sum[0], C1, A[0], B[0], 0);       //First sum bit
    full_adder add1(Sum[1], Carry, A[1], B[1], C1);       //Second sum bit and carry out calculation
    
endmodule