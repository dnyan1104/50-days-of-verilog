`timescale 1ns / 1ps
module traffic_light_controller(
input wire clk,
input wire reset, 
output reg  [2:0]light_main,
output reg  [2:0]light_side
);

reg [2:0] state, next_state;
parameter RED = 3'b100, 
          YELLOW = 3'b010, 
          GREEN = 3'b001;
parameter S_MAIN_GREEN = 3'b000,
              S_MAIN_YELLOW = 3'b001,
              S_SIDE_GREEN = 3'b010,
              S_SIDE_YELLOW = 3'b011;
                always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S_MAIN_GREEN;
        else
            state <= next_state;
    end
               always @(*) begin
        next_state = state;
        case (state)
            S_MAIN_GREEN: begin
                light_main = GREEN;
                light_side = RED;
                next_state = S_MAIN_YELLOW;
            end
            S_MAIN_YELLOW: begin
                light_main = YELLOW;
                light_side = RED;
                next_state = S_SIDE_GREEN;
            end
            S_SIDE_GREEN: begin
                light_main = RED;
                light_side = GREEN;
                next_state = S_SIDE_YELLOW;
            end
            S_SIDE_YELLOW: begin
                light_main = RED;
                light_side = YELLOW;
                next_state = S_MAIN_GREEN;
            end
        endcase
    end
endmodule
