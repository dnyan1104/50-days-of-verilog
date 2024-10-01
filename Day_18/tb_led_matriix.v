module tb_led_matrix;
    reg clk;
    reg reset;
    reg [63:0] led_pattern;
    wire [7:0] row_select;
    wire [7:0] col_select;

    led_matrix uut (
        .clk(clk),
        .reset(reset),
        .led_pattern(led_pattern),
        .row_select(row_select),
        .col_select(col_select)
    );

    initial begin
        clk = 0;
        reset = 1;
        led_pattern = 64'hFF00FF00FF00FF00;
        #10 reset = 0;
        #200 $finish;
    end

    always #5 clk = ~clk;
endmodule
