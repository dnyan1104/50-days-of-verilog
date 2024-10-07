`timescale 1ns / 1ps

module lift_controller(
    input wire clk,
    input wire reset,
    input wire [1:0] current_floor,
    input wire [1:0] requested_floor,
    output reg up,
    output reg down,
    output reg arrived
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            up <= 0;
            down <= 0;
            arrived <= 0;
        end else begin
            if (current_floor < requested_floor) begin
                up <= 1;
                down <= 0;
                arrived <= 0;
            end else if (current_floor > requested_floor) begin
                up <= 0;
                down <= 1;
                arrived <= 0;
            end else begin
                up <= 0;
                down <= 0;
                arrived <= 1;
            end
        end
    end

endmodule
