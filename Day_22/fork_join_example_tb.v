`timescale 1ns / 1ps

module fork_join_example_tb;

    reg a, b, c;
    reg [1:0] result;

    fork_join_example uut ();

    initial begin
        $monitor("Time: %0t | a: %b | b: %b | c: %b | result: %b", $time, uut.a, uut.b, uut.c, uut.result);
        #100;
        $stop;
    end

endmodule
