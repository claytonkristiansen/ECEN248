`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2020 07:00:44 PM
// Design Name: 
// Module Name: d_latch_behavioral
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


module d_latch_behavioral(Q, notQ, D, En);
    output reg Q;                   //Output register
    output wire notQ;               //Output wire
    input wire D, En;               //Input wires
    
    always @ (En or D)              //If En or D changes, assign D to Q
        if(En)
            Q = D;
    assign notQ = ~Q;               //Assigning notQ
endmodule
