module digital_stopwatch_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg start_stop;
    reg reset_count;
    wire [3:0] minutes;
    wire [5:0] seconds;
    wire [9:0] millis;

    // Instantiate the DUT (Device Under Test)
    digital_stopwatch dut (
        .clk(clk),
        .rst(rst),
        .start_stop(start_stop),
        .reset_count(reset_count),
        .minutes(minutes),
        .seconds(seconds),
        .millis(millis)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 100 MHz clock (10 ns period)

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        start_stop = 0;
        reset_count = 0;

        // Apply reset
        #10 rst = 0;

        // Start the stopwatch
        #10 start_stop = 1;

        // Run for some time
        #100;

        // Stop the stopwatch
        start_stop = 0;

        // Observe the outputs
        #50;

        // Reset the stopwatch counters
        reset_count = 1;
        #10 reset_count = 0;

        // Start the stopwatch again
        #10 start_stop = 1;

        // Run for another duration
        #100;

        // End simulation
        #50 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | Minutes: %0d | Seconds: %0d | Milliseconds: %0d", $time, minutes, seconds, millis);
    end

endmodule
