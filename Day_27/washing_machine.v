module washing_machine (
    input clk,        // System clock
    input rst_n,      // Active low reset
    input start,      // Start button
    output reg [2:0] state,  // Washing machine states
    output reg done          // Done signal
);

    // Define states
    localparam IDLE   = 3'b000;
    localparam FILL   = 3'b001;
    localparam WASH   = 3'b010;
    localparam RINSE  = 3'b011;
    localparam SPIN   = 3'b100;
    localparam DONE   = 3'b101;

    reg [15:0] timer; // Timer for each state (arbitrary value for simulation)

    // State machine logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset state and timer
            state <= IDLE;
            timer <= 16'b0;
            done <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 1'b0;
                    if (start) begin
                        state <= FILL;
                        timer <= 16'd5000;  // Time for filling water
                    end
                end
                FILL: begin
                    if (timer == 0) begin
                        state <= WASH;
                        timer <= 16'd10000; // Time for washing
                    end else begin
                        timer <= timer - 1;
                    end
                end
                WASH: begin
                    if (timer == 0) begin
                        state <= RINSE;
                        timer <= 16'd7000;  // Time for rinsing
                    end else begin
                        timer <= timer - 1;
                    end
                end
                RINSE: begin
                    if (timer == 0) begin
                        state <= SPIN;
                        timer <= 16'd8000;  // Time for spinning
                    end else begin
                        timer <= timer - 1;
                    end
                end
                SPIN: begin
                    if (timer == 0) begin
                        state <= DONE;
                    end else begin
                        timer <= timer - 1;
                    end
                end
                DONE: begin
                    done <= 1'b1;  // Washing cycle complete
                    state <= IDLE;
                end
                default: state <= IDLE;
            endcase
        end
    end
endmodule
