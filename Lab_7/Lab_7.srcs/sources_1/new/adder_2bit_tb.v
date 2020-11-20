`timescale 1ns / 1ps

module add_2bit_tb;//a test bench does not have any ports of its own!

	/* Input nets */
	reg [1:0] A; //these are regs because they are modified in 
	reg [1:0] B; //a behavioral block

	/* Output nets */
	wire [1:0] Sum; //these are wires because they will be driven
	wire Carry;//by the inantiated module
	reg [7:0] passed = 0;
	reg [7:0] numTests = 0;

	/* Instantiate the Unit Under Test (UUT) */
	adder_2bit uut ( //this is a different way
		.A(A),       //to instantiate a module.
		.B(B),       //the nice thing about this style
		.Sum(Sum),   //is that the order does not matter!
		.Carry(Carry)//notice the ports are in a different order!
	);


    /*-this is a behavioral block which is executed only once!  *
     *-the statements within this behavioral block are executed *
     *-sequentially because we are using blocking statements    *
     *-an '=' sign within a behavioral construct is considered a*
     * blocking statement. We will talk more about this later...*/
	initial 
      begin

        /* Initialize inputs*/
        A = 0;
        B = 0;

        #25; //just delay 25 ns  
        {A,B} = 4'b0000; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //here is where we could put a check to see if the results 
        //are as expected!
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b000)//you could put your own message here
            $display("Ah crap... something went wrong here...");
			else
			     begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        //let's do it again with a different input...
        {A,B} = 4'b0001; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b001)
            $display("Your own message here...");
			else
				begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        //okay this is fun... you try it now... 
        
        //go through all possible input combinations (2^4 = 16)
        //cut and paste makes this task a lot easier
        
        {A,B} = 4'b0010; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b010)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
                
        {A,B} = 4'b0011; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b011)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
                
        {A,B} = 4'b0100; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b001)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b0101; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b010)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b0110; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b011)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b0111; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b100)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1000; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b010)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1001; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b011)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1010; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b100)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1011; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b101)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1100; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b011)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1101; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b100)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1110; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b101)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        {A,B} = 4'b1111; #25;
        numTests = numTests + 1;
        if({Carry, Sum} != 3'b110)
            $display("You done messed up");
            else
                begin
			     $display("You passed this test boi");
			     passed = passed + 1;
			     end
        
        if(numTests == passed)
            $display("All tests passed!");

        //when we are done, let's stop the simulation
        $stop;
	end
      
endmodule

