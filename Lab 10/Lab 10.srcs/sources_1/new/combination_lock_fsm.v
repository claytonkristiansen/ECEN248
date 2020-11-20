`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 05:14:24 PM
// Design Name: 
// Module Name: combination_lock_fsm
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


module combination_lock_fsm(
output reg [2:0] state,
output wire [3:0] Lock,
input wire Key1,
input wire Key2,
input wire [3:0] Password,
input wire Reset,
input wire Clk
);
    

    parameter     S0 = 3'b000,                   //assigning each state to a binary number 
                  S1 = 3'b001, 
                  S2 = 3'b010, 
                  S3 = 3'b011,
                  S4 = 3'b100; 
    initial begin
        state = S0;
    end
    assign Lock = (state==S4) ? 4'b1111 : 4'b0000;      //Combination assignment for Lock
    //assign Lock = {state, 2'b00};
    reg [4:0] nextState;                                //Temp reg for next state

    always@(*)
    begin
        case(state)
            //Reset state
            S0:
                begin
                    if(Key1 == 1 && Password == 4'b1101)        //13
                        nextState = S1;
                    else if(Key1 == 1 && Password != 4'b1101)
                        nextState = S0;
                    else
                        nextState = S0;                         //Stay at this state
                end
            //1/4 correctly inputted
            S1:
                begin
                    if(Key2 == 1 && Password == 4'b0111)
                        nextState = S2;
                    else if(Key2 == 1 && Password != 4'b0111)   //7
                        nextState = S0;
                    else
                        nextState = S1;                         //Stay at this state         
                end                 
            //2/4 correctly inputted      
            S2:
                begin
                    if(Key1 == 1 && Password == 4'b1001)        //9
                        nextState = S3;
                    else if(Key1 == 1 && Password != 4'b1001)
                        nextState = S0;
                    else
                        nextState = S2;                         //Stay at this state
                end
            //3/4 correctly inputted
            S3:
                begin
                    if(Key2 == 1 && Password == 4'b0011)        //3
                        nextState = S4;
                    else if(Key2 == 1 && Password != 4'b0011)
                        nextState = S0;
                    else
                        nextState = S3;                         //Stay at this state
                end
            //Full combination entered, lock unlocked
            S4:
                begin
                    nextState = S4;                             //Stay at this state
                end    
        endcase
    end
    
    always @ (posedge Clk) begin
        if(Reset)
            state <= S0;                //Set state back to reset state
        else
            state <= nextState;         //Progress to next state (might be the same state)
    end

endmodule
