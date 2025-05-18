module uart_tx (
    input clk,
    input start,
    input [7:0] data,
    output reg tx,
    output reg busy
);

parameter CLK_PER_BIT = 87; // for 115200 baud @ 10 MHz
reg [3:0] bit_index = 0;
reg [15:0] clk_count = 0;
reg [9:0] tx_data;

always @(posedge clk) begin
    if (start && !busy) begin
        busy <= 1;
        tx_data <= {1'b1, data, 1'b0}; // Start bit, data, stop bit
        bit_index <= 0;
        clk_count <= 0;
    end else if (busy) begin
        if (clk_count < CLK_PER_BIT - 1) begin
            clk_count <= clk_count + 1;
        end else begin
            clk_count <= 0;
            tx <= tx_data[bit_index];
            bit_index <= bit_index + 1;
            if (bit_index == 9) busy <= 0;
        end
    end
end

endmodule
