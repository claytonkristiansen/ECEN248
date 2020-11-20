`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 05:46:12 PM
// Design Name: 
// Module Name: four_two_encoder_behavioral
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


module four_two_encoder_behavioral(W, Y, zero);
    input wire [3:0] W;     //4-bit input wire
    output reg [1:0] Y;     //2-bit output register
    output wire zero;      //output wire
    
    assign zero = (W == 4'b0000);       //Assigns zero to be 1 if W is 0000 and 0 if W is anything else
    
    always @ (W)
        begin
            case(W)             //Case on W
                4'b0001: Y = 2'b00;     //0th element
                4'b0010: Y = 2'b01;     //1st element
                4'b0100: Y = 2'b10;     //2nd element
                4'b1000: Y = 2'b11;     //3rd element
                default: Y = 2'bXX;     //Covers don't care situations
            endcase
        end

endmodule
