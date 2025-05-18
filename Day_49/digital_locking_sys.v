module digital_lock (
    input clk,
    input reset,
    input [3:0] key_input,
    input enter,              // signal to check the entered code
    output reg unlocked,
    output reg wrong_code
);
    parameter PASSWORD = 4'b1010;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            unlocked <= 0;
            wrong_code <= 0;
        end else if (enter) begin
            if (key_input == PASSWORD) begin
                unlocked <= 1;
                wrong_code <= 0;
            end else begin
                unlocked <= 0;
                wrong_code <= 1;
            end
        end
    end
endmodule
