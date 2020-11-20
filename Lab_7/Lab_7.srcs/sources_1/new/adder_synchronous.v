`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2020 08:33:57 PM
// Design Name: 
// Module Name: adder_synchronous
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


module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);
    output reg Carry_reg;                   //Output register
    output reg [1:0] Sum_reg;               //Output 2-bit register
    
    input wire Clk;                         //Input wire    
    input wire [1:0] A, B;                  //Input 2-bit register
    
    reg [1:0] A_reg, B_reg;                 ///////////////////////////////////////////////////////
    wire Carry;                             //Internal nets
    wire [1:0] Sum;                         ///////////////////////////////////////////////////////
    
    adder_2bit adder(Carry, Sum, A, B);     //Calculating the addition
    
    always @ (posedge Clk)                  //Storing the addition compnents, the sum, and the carry in registers
        begin
            A_reg <= A;
            B_reg <= B;
            Carry_reg = Carry;
            Sum_reg = Sum;
        end
    
endmodule
