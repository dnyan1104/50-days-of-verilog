module tb_digital_lock;
    reg clk, reset, enter;
    reg [3:0] key_input;
    wire unlocked, wrong_code;

    digital_lock dut (
        .clk(clk),
        .reset(reset),
        .key_input(key_input),
        .enter(enter),
        .unlocked(unlocked),
        .wrong_code(wrong_code)
    );

    // Clock generator
    always #5 clk = ~clk;

    initial begin
        $display("Starting Digital Lock Test");
        clk = 0;
        reset = 1; enter = 0; key_input = 4'b0000;
        #10;
        
        reset = 0;

        // Test wrong code
        key_input = 4'b1100; enter = 1;
        #10 enter = 0;
        #10;

        // Test correct code
        key_input = 4'b1010; enter = 1;
        #10 enter = 0;
        #10;

        // Test reset
        reset = 1;
        #10 reset = 0;
        #10;

        $finish;
    end
endmodule
