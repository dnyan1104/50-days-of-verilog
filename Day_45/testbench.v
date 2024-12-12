module square_wave_generator_tb;

    // Testbench signals
    reg clk;
    reg rst;
    reg [7:0] duty_cycle;
    wire pwm_out;

    // Instantiate the DUT (Device Under Test)
    square_wave_generator dut (
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
        #10 rst = 0;

        // Test case 1: 25% duty cycle
        duty_cycle = 8'd64; // 25% of 255
        #200;

        // Test case 2: 50% duty cycle
        duty_cycle = 8'd128; // 50% of 255
        #200;

        // Test case 3: 75% duty cycle
        duty_cycle = 8'd192; // 75% of 255
        #200;

        // Test case 4: 100% duty cycle
        duty_cycle = 8'd255; // 100% of 255
        #200;

        // Test case 5: 0% duty cycle
        duty_cycle = 8'd0; // 0% of 255
        #200;

        // End simulation
        #50 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | Duty Cycle: %d | PWM Out: %b", $time, duty_cycle, pwm_out);
    end

endmodule
