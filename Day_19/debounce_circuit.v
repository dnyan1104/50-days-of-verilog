`timescale 1ns / 1ps

module three_bit_debounce_circuit(
    input wire clk,
    input wire reset,          // Reset signal
    input wire noise,
    output reg debounced_out
);
    reg [2:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 3'b000; // Reset shift register
            debounced_out <= 0;   // Reset debounced output
        end else begin
            shift_reg <= {shift_reg[1:0], noise};
            if (shift_reg == 3'b111)
                debounced_out <= 1;
            else if (shift_reg == 3'b000)
                debounced_out <= 0;
            else
                debounced_out <= debounced_out; // Hold previous value
        end
    end
endmodule
