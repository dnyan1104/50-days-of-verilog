module tb_scrolling_led;
    reg clk, reset;
    wire [7:0] led_out;

    scrolling_led uut (
        .clk(clk),
        .reset(reset),
        .led_out(led_out)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Starting Scrolling LED Test");
        clk = 0;
        reset = 1;
        #10;
        reset = 0;

        // Let it scroll
        repeat (40) begin
            #10;
            $display("LED Output = %b", led_out);
        end

        $finish;
    end
endmodule
