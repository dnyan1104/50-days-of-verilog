module scrolling_led (
    input clk,
    input reset,
    output reg [7:0] led_out
);
    reg [31:0] scroll_data;  // message pattern (you can make it longer)
    reg [4:0] position;      // position of the scroll

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            scroll_data <= 32'b11110000111100001111000011110000; // Example pattern
            position <= 0;
        end else begin
            position <= position + 1;
        end
    end

    always @(*) begin
        led_out = scroll_data >> position;
    end
endmodule
