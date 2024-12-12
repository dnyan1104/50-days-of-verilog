module square_wave_generator (
    input clk,        // Input clock
    input rst,        // Reset
    input [7:0] duty_cycle, // Duty cycle (0-255)
    output reg pwm_out // PWM output
);

    reg [7:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 8'd0;
            pwm_out <= 1'b0;
        end else begin
            counter <= counter + 1;
            if (counter < duty_cycle)
                pwm_out <= 1'b1;
            else
                pwm_out <= 1'b0;
        end
    end

endmodule
