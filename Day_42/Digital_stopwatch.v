module digital_stopwatch(
    input clk,           // Clock input
    input rst,           // Reset input
    input start_stop,    // Start/Stop toggle
    input reset_count,   // Reset counter
    output [3:0] minutes, // Minutes (4-bit BCD)
    output [5:0] seconds, // Seconds (6-bit BCD)
    output [9:0] millis  // Milliseconds (10-bit binary)
);

    reg [9:0] millis_reg;
    reg [5:0] seconds_reg;
    reg [3:0] minutes_reg;
    reg running;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all counters
            millis_reg <= 10'd0;
            seconds_reg <= 6'd0;
            minutes_reg <= 4'd0;
            running <= 1'b0;
        end else begin
            if (reset_count) begin
                // Reset the counters
                millis_reg <= 10'd0;
                seconds_reg <= 6'd0;
                minutes_reg <= 4'd0;
            end

            if (start_stop) begin
                // Toggle running state
                running <= ~running;
            end

            if (running) begin
                // Update the counters
                millis_reg <= millis_reg + 1;
                if (millis_reg == 10'd999) begin
                    millis_reg <= 10'd0;
                    seconds_reg <= seconds_reg + 1;
                    if (seconds_reg == 6'd59) begin
                        seconds_reg <= 6'd0;
                        minutes_reg <= minutes_reg + 1;
                        if (minutes_reg == 4'd9) begin
                            minutes_reg <= 4'd0; // Wrap around at 9 minutes
                        end
                    end
                end
            end
        end
    end

    // Output assignments
    assign millis = millis_reg;
    assign seconds = seconds_reg;
    assign minutes = minutes_reg;

endmodule
