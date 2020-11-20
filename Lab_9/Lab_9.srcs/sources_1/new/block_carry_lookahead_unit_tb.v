`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 02:46:18 AM
// Design Name: 
// Module Name: block_carry_lookahead_unit_tb
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


module block_carry_lookahead_unit_tb;               //(G_star, P_star, C, G, P, C0);
    wire G_star, P_star;                 //Output regs
    wire [3:1] C;                        //
    reg [3:0] G, P;                      //Input regs
    reg C0;                              //

    block_carry_lookahead_unit uut(.G_star(G_star), .P_star(P_star), .C(C), .G(G), .P(P), .C0(C0));
    
    
    initial begin
        G = 4'b1111;
        P = 4'b0000;
        C0 = 1;
        #10;
        G = 4'b0011;
        P = 4'b0100;
        C0 = 1;
        #10;
        G = 4'b0100;
        P = 4'b0001;
        C0 = 1;
        #10;
        G = 4'b0010;
        P = 4'b0111;
        C0 = 1;
        #10;
        G = 4'b0001;
        P = 4'b1110;
        C0 = 1;
        #10;
        G = 4'b0000;
        P = 4'b1111;
        C0 = 1;
        #10;

    $stop;
    end    
    

endmodule
