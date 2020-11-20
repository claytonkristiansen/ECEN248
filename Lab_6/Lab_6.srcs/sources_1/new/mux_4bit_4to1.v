`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 04:37:02 PM
// Design Name: 
// Module Name: mux_4bit_4to1
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


module mux_4bit_4to1(Y, A, B, C, D, S);

    output reg[3:0] Y;          //1-bit output    
    input wire[3:0] A, B, C, D;       //4-bit inputs    
    input wire S;               //1-bit input
    
    always @ (A or B or C or D or S)
        case(S)     //Selection based on S
            2'b00: Y = A;
            2'b01: Y = B;
            2'b10: Y = C;
            2'b11: Y = D;
        endcase

endmodule
