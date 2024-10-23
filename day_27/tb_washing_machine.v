module washing_machine_tb;

    reg clk;
    reg rst_n;
    reg start;
    wire [2:0] state;
    wire done;

    washing_machine uut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .state(state),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock period of 10 units
    end

    initial begin
        rst_n = 0;
        start = 0;

        // Reset the system
        #15 rst_n = 1;
        #10 rst_n = 0;
        #15 rst_n = 1;

        // Test Case 1: Start the washing machine cycle
        #20 start = 1;
        #10 start = 0;  // Start button press ends
        
        // Wait until the washing cycle is complete
        wait(done == 1);

        // Test Case 2: Start a new cycle after the first is done
        #100 start = 1;
        #10 start = 0;
        
        wait(done == 1);

        // Test Case 3: Reset in the middle of a cycle
        #200 start = 1;
        #10 start = 0;
        #200 rst_n = 0;  // Trigger reset during operation
        #20 rst_n = 1;   // Release reset
        
        // Final wait and stop simulation
        #5000 $stop;
    end

endmodule
