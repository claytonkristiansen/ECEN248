`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2020 11:04:37 AM
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
    
    assign #6 S = A ^ B ^ Cin; //Sum bit combination
    
    assign #4 andAB = A & B;           ///////////////////////////////////////////////////////////////////////////
    assign #4 andACin = A & Cin;       //  Components of the Cout combination
    assign #4 andBCin = B & Cin;       ///////////////////////////////////////////////////////////////////////////
    
    assign #6 Cout = andAB | andACin | andBCin;    //Combination for the Cout bit
    

endmodule
