`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2020 01:26:24 PM
// Design Name: 
// Module Name: sr_latch
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


module sr_latch(Q, notQ, SnandEn, RnandEn, En, S, R);
    input wire En, S, R;        //Input nets
    output wire Q, notQ;        //Output nets
        
    output wire SnandEn, RnandEn;        //Intermediate nets
    nand #4 nand1(SnandEn, S, En);
    nand #4 nand2(RnandEn, R, En);
    
    nand #4 nand3(Q, SnandEn, notQ);  //Q with notQ feedback
    nand #4 nand4(notQ, RnandEn, Q);  //notQ with Q feedback
    
endmodule
