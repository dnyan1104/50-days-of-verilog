module pwm_generator(
    input clk,           // Clock input
    input rst,           // Reset input
    input [7:0] duty_cycle, // Duty cycle input (0-255)
    output reg pwm_out   // PWM output
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

module pwm_generator_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg [7:0] duty_cycle;
    wire pwm_out;

    // Instantiate the DUT (Device Under Test)
    pwm_generator dut (
        .clk(clk),
        .rst(rst),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 100 MHz clock (10 ns period)

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        duty_cycle = 8'd0;

        // Apply reset
        #20 rst = 0;

        // Test different duty cycles
        #50 duty_cycle = 8'd64;  // 25% duty cycle
        #200 duty_cycle = 8'd128; // 50% duty cycle
        #200 duty_cycle = 8'd192; // 75% duty cycle
        #200 duty_cycle = 8'd255; // 100% duty cycle

        // Reset and observe behavior
        #100 rst = 1;
        #20 rst = 0;

        // End simulation
        #200 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | Duty Cycle: %0d | PWM Out: %b", $time, duty_cycle, pwm_out);
    end

endmodule
