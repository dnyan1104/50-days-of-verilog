`timescale 1ns / 1ps

module sequence_detector_10101_tb;

    reg clk;
    reg reset;
    reg in;
    wire detected;

    sequence_detector_10101 uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .detected(detected)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        in = 0;
        #10 reset = 0;
        
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;

        #50 $stop;
    end

    initial begin
        $monitor("Time: %0t | Input: %b | Detected: %b", $time, in, detected);
    end

endmodule
