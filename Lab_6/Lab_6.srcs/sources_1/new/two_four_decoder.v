`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 04:14:00 PM
// Design Name: 
// Module Name: two_four_decoder
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


module two_four_decoder(W, En, Y);
    input wire [1:0] W;     //////////////////////////////////////////////////
    input wire En;          //  Input and output nets
    output wire [3:0] Y;    //////////////////////////////////////////////////
    
    wire w0Not, w1Not;                                      //////////////////////////////////////////////////
    wire w0NotAndw1Not, w0Andw1Not, w1Andw0Not, w0Andw1;    //  Internal nets
    
    not not0(w0Not, W[0]);                      //////////////////////////////////////////////////
    not not1(w1Not, W[1]);                      //  Intermediate values
    and and0(w0NotAndw1Not, w0Not, w1Not);      //
    and and1(w0Andw1Not, W[0], w1Not);          //
    and and2(w1Andw0Not, W[1], w0Not);          //
    and and3(w0Andw1, W[0], W[1]);              //////////////////////////////////////////////////
    
    and and4(Y[0], w0NotAndw1Not, En);          //////////////////////////////////////////////////
    and and5(Y[1], w0Andw1Not, En);             //  Final combinations for decoder
    and and6(Y[2], w1Andw0Not, En);             //
    and and7(Y[3], w0Andw1, En);                //////////////////////////////////////////////////
    
endmodule
