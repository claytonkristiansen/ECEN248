`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 04:14:20 PM
// Design Name: 
// Module Name: four_two_encoder
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


module four_two_encoder(W, Y, zero);
    input wire [3:0] W;     //////////////////////////////////////////////////
    output wire [1:0] Y;    //  Input and output nets
    output wire zero;       //////////////////////////////////////////////////
    
    assign zero = (W[0] ^ W[1]) ^ (W[2] ^ W[3]);    //////////////////////////////////////////////////
    assign Y[0] = W[1] ^ W[3];                      //  Output assignments for the encoder
    assign Y[1] = W[2] ^ W[3];                      ///////////////////////////////////////////////////
endmodule
