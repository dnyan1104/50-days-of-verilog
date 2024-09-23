`timescale 1ns / 1ps



module d_ff(
    input wire d, wire clk,
    output reg q
    );
    always @(posedge clk) begin 
    q <= d;
    end
endmodule
