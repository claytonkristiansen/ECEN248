`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 03:44:33 PM
// Design Name: 
// Module Name: two_one_mux_behavioral
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


module two_one_mux_behavioral(Y, A, B, S);
    output reg Y;           //outputs    
    input wire A, B, S;     //inputs
    
    
    always @ (A or B or S)  //Always block triggers when A, B, or S change
        begin
            if(S == 1'b0)
                Y = A;      //drive Y with A
            else
                Y = B;      //drive Y with B
        end
endmodule
