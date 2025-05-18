`timescale 1ns / 1ps

module debounce_tb;

reg clk;
reg rst;
reg noisy_btn;
wire clean_btn;

// Instantiate debounce module
debounce #(.DEBOUNCE_DELAY(20)) uut (
    .clk(clk),
    .rst(rst),
    .noisy_btn(noisy_btn),
    .clean_btn(clean_btn)
);

// Clock generation: 10 MHz
initial begin
    clk = 0;
    forever #50 clk = ~clk;  // 100ns period = 10 MHz
end

initial begin
    $dumpfile("debounce_tb.vcd");
    $dumpvars(0, debounce_tb);

    // Initialize
    rst = 1;
    noisy_btn = 0;
    #200;
    rst = 0;

    // Simulate noisy press (bouncing)
    noisy_btn = 1;
    #100;
    noisy_btn = 0;
    #100;
    noisy_btn = 1;
    #100;
    noisy_btn = 0;
    #100;
    noisy_btn = 1;
    #3000; // keep stable long enough for debounce

    // Simulate noisy release
    noisy_btn = 0;
    #100;
    noisy_btn = 1;
    #100;
    noisy_btn = 0;
    #3000;

    $finish;
end

endmodule
