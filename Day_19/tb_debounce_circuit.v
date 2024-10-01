`timescale 1ns / 1ps

module tb_three_bit_debounce_circuit;

    reg clk;
    reg reset;              
    reg noise;
    wire debounced_out;

    three_bit_debounce_circuit uut (
        .clk(clk),
        .reset(reset),
        .noise(noise),
        .debounced_out(debounced_out)
    );

    always begin
        #5 clk = ~clk; // Clock period of 10 time units
    end

    initial begin
        clk = 0;
        reset = 1;        // Start with reset high
        noise = 0;

        #10;
        reset = 0;       // Deactivate reset
        #10;             // Wait for 10 time units before changing noise
        noise = 1;       // Set noise high
        #30;             // Hold high for 30 time units (3 clock cycles)
        noise = 0;       // Set noise low
        #30;             // Hold low for 30 time units (3 clock cycles)
        noise = 1;       // Set noise high
        #30;             // Hold high for 30 time units (3 clock cycles)
        noise = 0;       // Set noise low
        #30;             // Hold low for 30 time units (3 clock cycles)

        #20;             // Wait for a while to observe the output

        #10;             // Additional wait time before finishing
        $finish;         // End the simulation
    end

    initial begin
        $monitor("Time: %0t | Noise Input: %b | Debounced Output: %b", 
                 $time, noise, debounced_out);
    end

endmodule
