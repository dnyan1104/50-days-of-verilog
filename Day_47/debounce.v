module debounce (
    input clk,               // system clock
    input rst,               // synchronous reset
    input noisy_btn,         // raw button input
    output reg clean_btn     // debounced output
);

parameter DEBOUNCE_DELAY = 250000; // adjust for ~25ms delay with 10 MHz clock

reg [17:0] count = 0;
reg btn_sync_0, btn_sync_1;

always @(posedge clk) begin
    if (rst) begin
        btn_sync_0 <= 0;
        btn_sync_1 <= 0;
    end else begin
        btn_sync_0 <= noisy_btn;
        btn_sync_1 <= btn_sync_0;
    end
end

always @(posedge clk) begin
    if (rst) begin
        count <= 0;
        clean_btn <= 0;
    end else if (btn_sync_1 != clean_btn) begin
        count <= count + 1;
        if (count >= DEBOUNCE_DELAY) begin
            clean_btn <= btn_sync_1;
            count <= 0;
        end
    end else begin
        count <= 0;
    end
end

endmodule

