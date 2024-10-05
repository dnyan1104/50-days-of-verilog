`timescale 1ns / 1ps

module counter_fork_join_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the module
    counter_fork_join uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 ns clock period (100 MHz)
    end

    // Test stimulus
    initial begin
        reset = 1;  // Apply reset
        #10 reset = 0;  // Release reset after 10 ns

        #100 reset = 1;  // Reset the counter after 100 ns
        #10 reset = 0;  // Release reset again

        #200 $stop;  // End the simulation after 200 ns
    end

    // Monitor the output
    initial begin
        $monitor("Time: %0t | Reset: %b | Count: %b", $time, reset, count);
    end

endmodule
