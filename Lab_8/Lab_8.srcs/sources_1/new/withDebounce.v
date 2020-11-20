`timescale 1ns / 1ps
`default_nettype none

module withDebounce(LEDs, BTN, Clk);

    output reg [3:0] LEDs;                          //4-bit output nets
    
    input wire BTN, Clk;                            //input nets

    /*-this is a keyword we have not seen yet!*
     *-as the name implies, it is a parameter *
     * that can be changed at compile time... */
    parameter n = 5;                                //This paremater is the bit width of the count net

    wire notMsb, Rst, En, Debounced;                ///////////////
    reg Synchronizer0, Synchronized;                //
    reg [n-1:0] Count;                              //Internal nets
                                                    //
    reg edge_detect0;                               //
    wire rising_edge;                               ///////////////
    /*This is just for simulation*/
     initial
        LEDs=0; 
    
   /********************************************/
   /* Debounce circuitry!!!                    */ 
   /********************************************/
    
    always@(posedge Clk)
      begin
        Synchronizer0 <= BTN;                       //Value of BTN is loaded into Synchronizer0 at the beginning of the clock cycle
        Synchronized <= Synchronizer0;              //The value of Synchronizer0 before the clock cycle began is loaded into Synchronized
      end

    always@(posedge Clk)                
        if(Rst)
            Count <= 0;                             //Reset count at beginning of clock cycle if Rst is HIGH
        else if(En)
            Count <= Count + 1;                     //Increment count if Rst is LOW and En is HIGH

    assign notMsb = ~Count[n-1];                    //notMsb is always HIGH while the most significant bit of Count is LOW
    assign En = notMsb & Synchronized;              //The enable bit stays HIGH while the most significant bit is LOW and the stored button input is HIGH
    assign Rst = ~Synchronized;                     //If the stored button input is LOW the count is reset to 0
    assign Debounced = Count[n-1];                  //The circuit is considered debounced if the most significant bit of Count has enough time to be set

   /********************************************/
   /* End of Debounce circuitry!!!             */ 
   /********************************************/

    always@(posedge Clk)
        edge_detect0 <= Debounced;                  //Button signal only propagates once it is debounced
    assign rising_edge = ~edge_detect0 & Debounced; //rising_edge is HIGH if the propagated button value is LOW and the incomming button value is HIGH
                                                    //      This ensures the count will only increment by one for each button press.

    always@(posedge Clk)
        if(rising_edge)
            LEDs <= LEDs + 1;                       //Finally incrementing the button, only once per debounced button pres
endmodule

