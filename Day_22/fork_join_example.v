`timescale 1ns / 1ps

module counter_fork_join(
    input clk,
    input reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else begin
            fork
                begin
                    count <= count + 1;
                end
            join
        end
    end

endmodule
