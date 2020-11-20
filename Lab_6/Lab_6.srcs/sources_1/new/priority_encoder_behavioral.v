`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 05:58:16 PM
// Design Name: 
// Module Name: priority_encoder_behavioral
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


module priority_encoder_behavioral(W, Y, zero);
    input wire [3:0] W;     //////////////////////////////////////////////////
    output reg [1:0] Y;    //  Input and output nets
    output wire zero;       //////////////////////////////////////////////////
    
    assign zero = (W == 4'b0000);       //Assigns zero to be 1 if W is 0000 and 0 if W is anything else
    
    always @ (W)
        begin
            casex(W)
                4'b0001: Y = 2'b00;
                4'b001X: Y = 2'b01;
                4'b01XX: Y = 2'b10;
                4'b1XXX: Y = 2'b11;
                default: Y = 2'bXX;
            endcase
        end

endmodule
