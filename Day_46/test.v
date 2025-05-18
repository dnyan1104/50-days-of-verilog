`timescale 1ns / 1ps

module uart_tx_tb;

reg clk;
reg start;
reg [7:0] data;
wire tx;
wire busy;

// Instantiate the DUT (Design Under Test)
uart_tx uut (
    .clk(clk),
    .start(start),
    .data(data),
    .tx(tx),
    .busy(busy)
);

// Clock generation: 10 MHz => 100 ns period
initial begin
    clk = 0;
    forever #50 clk = ~clk;
end

// Test sequence
initial begin
    $display("Starting UART TX Testbench");
    $dumpfile("uart_tx_tb.vcd"); // For GTKWave
    $dumpvars(0, uart_tx_tb);

    // Initialize
    start = 0;
    data = 8'h00;
    #200;

    // Send first byte (e.g. 0x41 = 'A')
    data = 8'h41;
    start = 1;
    #200;  // Keep start high for 2 clock cycles
    start = 0;

    // Wait for transmission to complete
    wait (!busy);
    #1000;

    // Send another byte (e.g. 0x5A = 'Z')
    data = 8'h5A;
    start = 1;
    #200;
    start = 0;

    wait (!busy);
    #2000;

    $display("UART TX Test Complete");
    $finish;
end

endmodule
