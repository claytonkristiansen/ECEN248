`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 01:13:10 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(ClkOut, ClkIn);
    output wire [3:0] ClkOut;               //4-bit output net
    input wire ClkIn;                       //input net
    
    parameter n = 5;                        //parameter that sets width of count and therefore the clock division
    
    reg [n:0] Count;                        //n + 1 bit wide intermediate net
    
    always@(posedge ClkIn)                  
        Count <= Count + 1;                 //behavioral counter
        
    assign ClkOut[3:0] = {Count[n], Count[n - 1], Count[n - 2], Count[n - 3]};          //assigning the 4 most significant bits to ClkOut
    
    initial begin
        Count <= 0;                         //Set count bits to zero initially
    end
    
endmodule
