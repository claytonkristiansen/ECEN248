`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 05:20:10 PM
// Design Name: 
// Module Name: two_four_decoder_behavioral
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


module two_four_decoder_behavioral(W, En, Y);
    input wire [1:0] W;     //2-bit input
    input wire En;          //1-bit input
    output reg [3:0] Y;     //4-bit output
    
    always @ (En or W)
        begin
            if(En == 1'b1)
                case(W)                         //Case statement to assign the correct outputs
                    2'b00: Y = 4'b0001;
                    2'b01: Y = 4'b0010;
                    2'b10: Y = 4'b0100;
                    2'b11: Y = 4'b1000;
                endcase
            else                                //If enable is 0 set output to 0000
                Y = 4'b0000;
        end
endmodule
