module keypad_scanner_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg [3:0] col;
    wire [3:0] row;
    wire [3:0] key;

    // Instantiate the DUT (Device Under Test)
    keypad_scanner dut (
        .clk(clk),
        .rst(rst),
        .col(col),
        .row(row),
        .key(key)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 100 MHz clock (10 ns period)

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        col = 4'b1111;

        // Apply reset
        #20 rst = 0;

        // Simulate key press for each row and column combination
        // Row 0, Key '1', '2', '3', 'A'
        #50 col = 4'b1110; #50 col = 4'b1101; #50 col = 4'b1011; #50 col = 4'b0111; col = 4'b1111;

        // Row 1, Key '4', '5', '6', 'B'
        #200 col = 4'b1110; #50 col = 4'b1101; #50 col = 4'b1011; #50 col = 4'b0111; col = 4'b1111;

        // Row 2, Key '7', '8', '9', 'C'
        #200 col = 4'b1110; #50 col = 4'b1101; #50 col = 4'b1011; #50 col = 4'b0111; col = 4'b1111;

        // Row 3, Key '*', '0', '#', 'D'
        #200 col = 4'b1110; #50 col = 4'b1101; #50 col = 4'b1011; #50 col = 4'b0111; col = 4'b1111;

        // End simulation
        #500 $finish;
    end

    // Monitor key presses
    initial begin
        $monitor("Time: %0t | Row: %b | Col: %b | Key: %h", $time, row, col, key);
    end

endmodule
