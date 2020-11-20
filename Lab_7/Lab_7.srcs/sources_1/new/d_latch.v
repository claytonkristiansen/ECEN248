`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2020 02:00:12 PM
// Design Name: 
// Module Name: d_latch
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


module d_latch(Q, notQ, D, En);
    input wire D, En;                   //Input nets
    output wire Q, notQ;                //Output nets
    
    wire SnandEn, RnandEn, notD;        //Internal nets
    not #2 not1(notD, D);                  //Creation of R
    nand #2 nand1(SnandEn, D, En);      
    nand #2 nand2(RnandEn, notD, En);
    
    
    nand #2 nand3(Q, SnandEn, notQ);  //Q with notQ feedback
    nand #2 nand4(notQ, RnandEn, Q);  //notQ with Q feedback
endmodule
