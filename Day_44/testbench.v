module priority_encoder_8to3_tb;

    // Testbench signals
    reg [7:0] in;
    wire [2:0] out;
    wire valid;

    // Instantiate the DUT (Device Under Test)
    priority_encoder_8to3 dut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    // Test stimulus
    initial begin
        $monitor("Time: %0t | Input: %b | Output: %b | Valid: %b", $time, in, out, valid);

        // Test case 1: Single high bit
        in = 8'b00000001; #10;
        in = 8'b00000010; #10;
        in = 8'b00000100; #10;
        in = 8'b00001000; #10;
        in = 8'b00010000; #10;
        in = 8'b00100000; #10;
        in = 8'b01000000; #10;
        in = 8'b10000000; #10;

        // Test case 2: Multiple high bits
        in = 8'b11000000; #10;
        in = 8'b00110000; #10;
        in = 8'b00001100; #10;
        in = 8'b00000011; #10;

        // Test case 3: No high bits
        in = 8'b00000000; #10;

        // End simulation
        $finish;
    end

endmodule
