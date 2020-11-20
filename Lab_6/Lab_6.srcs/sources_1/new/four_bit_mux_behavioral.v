`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 04:12:51 PM
// Design Name: 
// Module Name: four_bit_mux_behavioral
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


module four_bit_mux_behavioral(Y, A, B, S);

    output reg[3:0] Y;          //1-bit output    
    input wire[3:0] A, B;       //4-bit inputs    
    input wire S;               //1-bit input
    
    
    always @ (A or B or S)  //Always block triggers when A, B, or S change
        begin
            if(S == 1'b0)
                Y = A;      //drive Y with A
            else
                Y = B;      //drive Y with B
        end

endmodule
