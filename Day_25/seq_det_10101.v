`timescale 1ns / 1ps

module sequence_detector_10101(
    input wire clk,
    input wire reset,
    input wire in,
    output reg detected
);

    reg [2:0] state;
    localparam S0 = 3'b000,
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
               S4 = 3'b100,
               S5 = 3'b101;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            detected <= 0;
        end else begin
            case (state)
                S0: state <= (in == 1) ? S1 : S0;
                S1: state <= (in == 0) ? S2 : S1;
                S2: state <= (in == 1) ? S3 : S0;
                S3: state <= (in == 0) ? S4 : S1;
                S4: state <= (in == 1) ? S5 : S0;
                S5: begin
                    detected <= 1;
                    state <= S0;
                end
                default: state <= S0;
            endcase
        end
    end

endmodule
