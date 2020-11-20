`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 03:29:27 PM
// Design Name: 
// Module Name: up_counter
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


module up_counter(Count, Carry2, En, Clk, Rst);
    input wire En, Clk, Rst;    //Input nets
    output reg [2:0] Count;     //3-bit output net
    output wire Carry2;          //Output net
    
    wire [2:0] Sum;      //For testing purposes
    wire [2:0] Carry;           //Intermediate nets
    
    Threebit_counter UCI(Sum, Carry2, Count, En);       //continuously updating Sum and Carry2 when Count changes. Sum is always 1 greater than Count until rollover
    
    always@(posedge Clk or posedge Rst)
        if(Rst)
            Count <= 0;         //Reset
        else
            Count <= Sum;       //Increment Count leading to new Sum value in counter
endmodule

module Threebit_counter(Sum, Carry2, Count, En);            //Adds En to Count
    input En;
    input [2:0] Count;
    output [2:0] Sum;
    output Carry2;
    wire [2:0] Carry;
    
    half_adder add0(Sum[0], Carry[0], En, Count[0]);
    half_adder add1(Sum[1], Carry[1], Carry[0], Count[1]);
    half_adder add2(Sum[2], Carry[2], Carry[1], Count[2]);
    
    assign Carry2 = Carry[2];
    
endmodule
