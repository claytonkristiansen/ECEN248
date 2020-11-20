`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 05:59:19 PM
// Design Name: 
// Module Name: add_sub
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


module add_sub(Sum, Overflow, opA, opB, opSel);

    output wire [3:0] Sum;
    output wire Overflow;
    input wire [3:0] opA, opB;
    input wire opSel;
    
    wire [3:0] notB;
    wire c0, c1, c2, c3;
    
    assign notB[0] = opB[0] ^ opSel;    ///////////////////////////////////////////////////////////////////////////
    assign notB[1] = opB[1] ^ opSel;    //  Inverts the bits of B if opSel is 1
    assign notB[2] = opB[2] ^ opSel;    //
    assign notB[3] = opB[3] ^ opSel;    ///////////////////////////////////////////////////////////////////////////
    
    full_adder adder0(Sum[0], c0, opA[0], notB[0], opSel);  ///////////////////////////////////////////////////////////////////////////
    full_adder adder1(Sum[1], c1, opA[1], notB[1], c0);     //  Adds A and B, storing the output in Sum
    full_adder adder2(Sum[2], c2, opA[2], notB[2], c1);     //
    full_adder adder3(Sum[3], c3, opA[3], notB[3], c2);     ///////////////////////////////////////////////////////////////////////////
    
    assign Overflow = c2 ^ c3;  //Overflow bit if c2 XOR c3 is 1
    
    

endmodule
