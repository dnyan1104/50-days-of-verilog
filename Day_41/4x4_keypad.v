module keypad_scanner(
    input clk,                // Clock input
    input rst,                // Reset input
    input [3:0] col,          // Columns of the keypad (inputs)
    output reg [3:0] row,     // Rows of the keypad (outputs)
    output reg [3:0] key      // Key value (4-bit binary representation)
);

    reg [1:0] current_row;    // Tracks the currently active row
    reg [19:0] scan_counter;  // For debouncing and scan timing

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            row <= 4'b1111;      // Reset rows to inactive
            current_row <= 2'b00; // Start with the first row
            key <= 4'b0000;      // Reset key value
            scan_counter <= 20'd0;
        end else begin
            // Increment the scan counter
            scan_counter <= scan_counter + 1;

            // Perform scanning at regular intervals
            if (scan_counter == 20'd100000) begin
                scan_counter <= 20'd0;

                // Activate the next row
                case (current_row)
                    2'b00: row <= 4'b1110; // Activate row 0
                    2'b01: row <= 4'b1101; // Activate row 1
                    2'b10: row <= 4'b1011; // Activate row 2
                    2'b11: row <= 4'b0111; // Activate row 3
                endcase

                // Read the column values
                if (col != 4'b1111) begin
                    case ({row, col})
                        8'b1110_1110: key <= 4'h1; // Key '1'
                        8'b1110_1101: key <= 4'h2; // Key '2'
                        8'b1110_1011: key <= 4'h3; // Key '3'
                        8'b1110_0111: key <= 4'hA; // Key 'A'
                        8'b1101_1110: key <= 4'h4; // Key '4'
                        8'b1101_1101: key <= 4'h5; // Key '5'
                        8'b1101_1011: key <= 4'h6; // Key '6'
                        8'b1101_0111: key <= 4'hB; // Key 'B'
                        8'b1011_1110: key <= 4'h7; // Key '7'
                        8'b1011_1101: key <= 4'h8; // Key '8'
                        8'b1011_1011: key <= 4'h9; // Key '9'
                        8'b1011_0111: key <= 4'hC; // Key 'C'
                        8'b0111_1110: key <= 4'hE; // Key '*'
                        8'b0111_1101: key <= 4'h0; // Key '0'
                        8'b0111_1011: key <= 4'hF; // Key '#'
                        8'b0111_0111: key <= 4'hD; // Key 'D'
                    endcase
                end

                // Move to the next row
                current_row <= current_row + 1;
            end
        end
    end

endmodule
