`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 03:05:05 PM
// Design Name: 
// Module Name: half_adder
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


module half_adder(S, Cout, A, B);
    input wire A, B;        //Input nets
    output wire S, Cout;    //Output nets
    
    assign S = A ^ B;       //Sum bit
    assign Cout = A & B;    //Cout bit
endmodule
