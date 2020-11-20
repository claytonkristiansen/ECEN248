`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2020 06:13:42 PM
// Design Name: 
// Module Name: d_flip_flop
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

module d_flip_flop(Q, notQ, Clk, D);
    output wire Q, notQ;        //output nets
    input wire Clk, D;          //input nets
    
    wire notClk, Q_m, notQ_m;           //Internal nets
    
    not #2 not1(notClk, Clk);
    
    d_latch masterLatch(.Q(Q_m), .notQ(notQ_m), .D(D), .En(notClk));
    d_latch slaveLatch(.Q(Q), .notQ(notQ), .D(Q_m), .En(Clk));
    
    
endmodule
