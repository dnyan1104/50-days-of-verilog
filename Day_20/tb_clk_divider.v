`timescale 1ns/1ps

module clock_divider_tb;

    reg clk_in;
    wire clk_out;

    clock_divider uut (
        .clk_in(clk_in),
        .clk_out(clk_out)
    );

    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in;
    end

    initial begin
        $monitor("Time: %0t | Input Clock: %b | Output Clock: %b", $time, clk_in, clk_out);
        #100;
        $stop;
    end

endmodule
