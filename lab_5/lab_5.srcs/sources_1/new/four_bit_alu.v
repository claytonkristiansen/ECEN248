`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 06:45:46 PM
// Design Name: 
// Module Name: four_bit_alu
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
//////////////////////////////////////////////////////////////////////////////////


module four_bit_alu(Result, Overflow, opA, opB, ctrl);

    output wire [3:0] Result;   //Result of the ALU
    output wire Overflow;       //Overflow bit if adding/subtracting
    input wire [3:0] opA, opB;  //4 bit operands
    input wire [3:0] ctrl;      //Control bits for the ALU 00 and 01 is bitwise and, 10 is add, and 11 is subtract
    
    wire [3:0] AandB, AsumB; 
    
    assign AandB[0] = opA[0] & opB[0];  ///////////////////////////////////
    assign AandB[1] = opA[1] & opB[1];  //  Bitwise and for A and B
    assign AandB[2] = opA[2] & opB[2];  //
    assign AandB[3] = opA[3] & opB[3];  ///////////////////////////////////
    add_sub Add_Sub0(AsumB, Overflow, opA, opB, ctrl[1]);       //Add or subtract A and B
    four_bit_mux Four_Bit_Mux0(Result, AandB, AsumB, ctrl[0]);  //Selecting output using the 4 bit 2:1 MUX

endmodule
