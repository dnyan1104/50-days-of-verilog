`timescale 1ns / 1ps

module lift_controller_tb;

    reg clk;
    reg reset;
    reg [1:0] current_floor;
    reg [1:0] requested_floor;
    wire up;
    wire down;
    wire arrived;

    lift_controller uut (
        .clk(clk),
        .reset(reset),
        .current_floor(current_floor),
        .requested_floor(requested_floor),
        .up(up),
        .down(down),
        .arrived(arrived)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        current_floor = 2'b00;
        requested_floor = 2'b00;
        #10 reset = 0;
        
        #10 requested_floor = 2'b01;
        #50 requested_floor = 2'b10;
        #50 requested_floor = 2'b00;
        
        #100 $stop;
    end

endmodule
