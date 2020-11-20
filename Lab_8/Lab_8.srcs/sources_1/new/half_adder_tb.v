`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 03:09:50 PM
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb;
    reg A, B;
    wire S, Cout;

    half_adder myTestBoi(.S(S), .Cout(Cout), .A(A), .B(B));
    
    initial begin
        {A, B} = 2'b00; #10;
        {A, B} = 2'b01; #10;
        {A, B} = 2'b10; #10;
        {A, B} = 2'b11; #10;
        $stop;
    end
    
endmodule
