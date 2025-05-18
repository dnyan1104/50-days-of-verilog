`timescale 1ns / 1ps

module tone_generator_tb;

reg clk;
reg [2:0] note_sel;
wire buzzer;

// Instantiate the tone_generator module
tone_generator uut (
    .clk(clk),
    .note_sel(note_sel),
    .buzzer(buzzer)
);

// Generate a 10 MHz clock (period 100 ns)
initial begin
    clk = 0;
    forever #50 clk = ~clk;  // toggle clock every 50 ns
end

initial begin
    $dumpfile("tone_generator_tb.vcd");
    $dumpvars(0, tone_generator_tb);

    // Drive note_sel through multiple values over time
    note_sel = 3'b000; // Note C
    #100_000;

    note_sel = 3'b001; // Note D
    #100_000;

    note_sel = 3'b010; // Note E
    #100_000;

    note_sel = 3'b011; // Note F
    #100_000;

    note_sel = 3'b100; // Note G
    #100_000;

    note_sel = 3'b101; // Note A
    #100_000;

    note_sel = 3'b110; // Note B
    #100_000;

    note_sel = 3'b111; // Mute
    #100_000;

    $finish;
end

endmodule
