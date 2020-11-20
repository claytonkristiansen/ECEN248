`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 04:16:23 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(S, Cout, A, B, Cin);
    input wire A, B, Cin;
    output wire S, Cout;
    
    wire andBCin, andACin, andAB;
    
    assign S = A ^ B ^ Cin; //Sum bit combination
    
    assign andAB = A & B;           ///////////////////////////////////////////////////////////////////////////
    assign andACin = A & Cin;       //  Components of the Cout combination
    assign andBCin = B & Cin;       ///////////////////////////////////////////////////////////////////////////
    
    assign Cout = andAB | andACin | andBCin;    //Combination for the Cout bit
    

endmodule
