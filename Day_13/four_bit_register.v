`timescale 1ns / 1ps


module four_bit_register(
input wire clk,
input wire reset,
input wire [3:0]d,
input wire enable,
output reg  [3:0]q
);

always @(posedge clk or posedge reset) begin
if(reset)
q <= 4'b0000;
else if(enable)
q <= d;
end


endmodule
