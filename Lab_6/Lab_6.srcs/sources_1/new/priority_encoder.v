`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 04:12:19 PM
// Design Name: 
// Module Name: priority_decoder
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


module priority_encoder(W, Y, zero);
    input wire [3:0] W;     //////////////////////////////////////////////////
    output wire [1:0] Y;    //  Input and output nets
    output wire zero;       //////////////////////////////////////////////////
    
    wire i0, i1, i2, i3;    //  Internal nets
    
    assign i0 = ~W[3] & ~W[2] & ~W[1] & W[0];   //////////////////////////////////////////////////
    assign i1 = ~W[3] & ~W[2] & W[1];           //  Intermediate values
    assign i2 = ~W[3] & W[2];                   //
    assign i3 = W[3];                           //////////////////////////////////////////////////
    
    assign Y[0] = i1 | i3;                      //////////////////////////////////////////////////
    assign Y[1] = i2 | i3;                      //  Final assignment combinations
    assign zero = ~i0 & ~i1 & ~i2 & ~i3;        //////////////////////////////////////////////////
    
endmodule
