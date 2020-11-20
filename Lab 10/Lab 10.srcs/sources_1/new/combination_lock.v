/*This is the top-level module for our digital *
 *rotary combination-lock based on the diagram *
 *provide in the lab manual                    */

module combination_lock(
    output wire [3:0] LEDs,//connect to lock
    /*Let's output state for debugging!*/
    output wire [2:0] JB,
    input Clk,
    input wire Reset,
    input wire Key1,Key2,
    input wire [3:0]Password
);
	
    /*intermediate nets*/
    wire KeySync1,KeySync2, ResetSync;
    
    wire [3:0] tempLock;

     
    /*synchronize button inputs*/
    synchronizer syncA(KeySync1, Key1, Clk);                    //Synchronize Key0 input
    synchronizer syncB(KeySync2, Key2, Clk);                    //Synchronize Key1 input
    synchronizer syncC(ResetSync, Reset, Clk);                  //Synchronize Reset input

    /*wire up combination lock FSM*/
    combination_lock_fsm U1(
        .Lock(LEDs), 
        .state(JB), 
        .Clk(Clk), 
        .Key1(KeySync1),
        .Key2(KeySync2),
        .Reset(ResetSync), 
        .Password(Password)
    );


endmodule
